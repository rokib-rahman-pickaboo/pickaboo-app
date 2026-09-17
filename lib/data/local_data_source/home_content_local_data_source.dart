import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';

abstract class HomeContentLocalDataSource {
  Future<HomeContentResponse?> getHomeContentIfValid();

  /// Cached payload regardless of its TTL. Used as the offline fallback: a
  /// stale home feed beats an error screen when the network is unreachable.
  Future<HomeContentResponse?> getHomeContentStale();

  Future<void> insertHomeContent(HomeContentResponse content);

  Future<bool> isHomeContentStale();

  Future<void> clearHomeContent();
}
