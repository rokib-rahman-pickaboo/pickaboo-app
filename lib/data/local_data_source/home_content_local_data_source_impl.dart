import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/core/monitoring/crash_reporter.dart';
import 'package:pickaboo/data/local_data_source/home_content_local_data_source.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';
import 'package:pickaboo/data/model/cache/home_content_cache_wrapper.dart';

@LazySingleton(as: HomeContentLocalDataSource)
class HomeContentLocalDataSourceImpl implements HomeContentLocalDataSource {
  Future<Box<HomeContentCacheWrapper>> _cacheBox() async {
    final box = Hive.isBoxOpen(dbHomeContentName)
        ? Hive.box<HomeContentCacheWrapper>(dbHomeContentName)
        : await Hive.openBox<HomeContentCacheWrapper>(dbHomeContentName);
    if (kDebugMode) {
      print(
        '📦 Home box → entries=${box.length} '
        'reopened=${!Hive.isBoxOpen(dbHomeContentName)} path=${box.path}',
      );
    }
    return box;
  }

  /// A cache read must never be able to fail the screen: a box written by an
  /// older adapter layout (fields added/reordered, typeId reused) throws on
  /// read, and the home feed would then never load at all. On any failure the
  /// box is dropped from disk and `null` is returned, so the caller falls
  /// through to the network exactly as it does for a cold cache.
  @override
  Future<HomeContentResponse?> getHomeContentIfValid() async {
    try {
      final box = await _cacheBox();

      if (box.isEmpty) {
        if (kDebugMode) {
          print('📦 Home Content Cache: Empty');
        }
        return null;
      }

      final wrapper = box.getAt(0);
      if (wrapper == null) {
        return null;
      }

      if (wrapper.isExpired) {
        if (kDebugMode) {
          print('⏰ Home Content Cache: Expired (cached ${wrapper.cachedAt})');
        }
        // Deliberately NOT cleared: an expired copy is still the offline
        // fallback ([getHomeContentStale]). It is overwritten by the next
        // successful fetch.
        return null;
      }

      if (kDebugMode) {
        final remaining = wrapper.timeUntilExpiration;
        print(
          '✅ Home Content Cache: Valid (expires in ${remaining.inHours}h ${remaining.inMinutes % 60}m)',
        );
      }

      return wrapper.homeContent;
    } catch (e, s) {
      if (kDebugMode) {
        print('⚠️ Home Content Cache: unreadable → dropping box. $e');
      }
      CrashReporter.record(e, s);
      await _deleteBox();
      return null;
    }
  }

  @override
  Future<HomeContentResponse?> getHomeContentStale() async {
    try {
      final box = await _cacheBox();
      if (box.isEmpty) return null;
      final wrapper = box.getAt(0);
      if (wrapper == null) return null;
      if (kDebugMode) {
        print(
          '📦 Home Content Cache: Serving STALE copy from ${wrapper.cachedAt}',
        );
      }
      return wrapper.homeContent;
    } catch (e, s) {
      if (kDebugMode) {
        print('⚠️ Home Content Cache: stale read failed → dropping box. $e');
      }
      CrashReporter.record(e, s);
      await _deleteBox();
      return null;
    }
  }

  /// hive_generator_plus 4.x emits `(fields[i] as List)?.cast<T>()` for
  /// *nullable* list fields — a pre-null-safety cast that throws on read when
  /// `null` was written:
  ///   type 'Null' is not a subtype of type 'List<dynamic>' in type cast
  /// The home payload legitimately omits `attributes`, `products`,
  /// `slides_data`… so every cached copy was unreadable, which is why the
  /// cache appeared never to be used. Storing empty lists instead of nulls
  /// sidesteps the generator bug; the mapper already treats `[]` and `null`
  /// identically (`?? const []`), so nothing downstream changes.
  HomeContentResponse _withoutNullLists(HomeContentResponse c) {
    Product safeProduct(Product p) =>
        p.copyWith(attributes: p.attributes ?? const []);

    final justForYou = c.justForYou;

    return c.copyWith(
      categoryList: c.categoryList ?? const [],
      mainSlider: c.mainSlider ?? const [],
      commonLinkSlider: c.commonLinkSlider ?? const [],
      categorySlider: (c.categorySlider ?? const [])
          .map((s) => s.copyWith(slidesData: s.slidesData ?? const []))
          .toList(),
      categoryProducts: (c.categoryProducts ?? const [])
          .map(
            (cp) => cp.copyWith(
              products: (cp.products ?? const []).map(safeProduct).toList(),
            ),
          )
          .toList(),
      justForYou: justForYou?.copyWith(
        list: (justForYou.list ?? const []).map(safeProduct).toList(),
      ),
    );
  }

  @override
  Future<void> insertHomeContent(HomeContentResponse content) async {
    try {
      final box = await _cacheBox();
      await box.clear();

      final wrapper = HomeContentCacheWrapper(
        homeContent: _withoutNullLists(content),
        cachedAt: DateTime.now(),
      );

      await box.add(wrapper);
      // Force the write through to disk. Without it a process kill shortly
      // after the write can lose the frame, which looks exactly like "the
      // cache is never used" on the next launch.
      await box.flush();

      if (kDebugMode) {
        print(
          '📦 Home Content Cache: Saved home content at ${wrapper.cachedAt} '
          '(entries=${box.length})',
        );
      }
    } catch (e, s) {
      // Writing is best-effort — the caller already has the fresh payload.
      if (kDebugMode) {
        print('⚠️ Home Content Cache: write failed. $e');
      }
      CrashReporter.record(e, s);
    }
  }

  @override
  Future<void> clearHomeContent() async {
    try {
      final box = await _cacheBox();
      await box.clear();
      if (kDebugMode) {
        print('📦 Home Content Cache: Cleared');
      }
    } catch (_) {
      await _deleteBox();
    }
  }

  Future<void> _deleteBox() async {
    try {
      if (Hive.isBoxOpen(dbHomeContentName)) {
        await Hive.box<HomeContentCacheWrapper>(dbHomeContentName).close();
      }
      await Hive.deleteBoxFromDisk(dbHomeContentName);
    } catch (_) {
      // Nothing else we can do; the next read will try again.
    }
  }
}
