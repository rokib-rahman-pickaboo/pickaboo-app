import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/model/cache/category_cache_wrapper.dart';
import 'package:pickaboo/data/model/category_response/category_response.dart';
import 'package:pickaboo/data/model/auth/user_response/user_response.dart';
import 'package:pickaboo/data/model/cache/user_profile_cache_wrapper.dart';
import 'package:pickaboo/data/model/common/product/product.dart';
import 'package:pickaboo/data/model/common/category/category.dart';
import 'package:pickaboo/data/model/common/slider/slider.dart';
import 'package:pickaboo/data/model/home_content_response/home_content_response.dart';
import 'package:pickaboo/data/model/cache/home_content_cache_wrapper.dart';
import 'package:pickaboo/data/model/cache/ticket_cache_wrapper.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';
import 'package:pickaboo/data/model/product_detail_response/product_detail_response.dart';
import 'package:pickaboo/data/model/cache/product_detail_cache_wrapper.dart';

@module
abstract class AppInitModule {
  @preResolve
  Future<Box<CategoryCacheWrapper>> openCategoryBox() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryResponseAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(CategoryCacheWrapperAdapter());
    }

    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(UserResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(AddressAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(RegionAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(CustomAttributeAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(ExtensionAttributesAdapter());
    }

    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(UserProfileCacheWrapperAdapter());
    }

    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(ProductAdapter());
    }
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(SliderAdapter());
    }
    if (!Hive.isAdapterRegistered(12)) {
      Hive.registerAdapter(HomeContentResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(13)) {
      Hive.registerAdapter(CategoryProductAdapter());
    }
    if (!Hive.isAdapterRegistered(14)) {
      Hive.registerAdapter(CategorySliderAdapter());
    }
    if (!Hive.isAdapterRegistered(15)) {
      Hive.registerAdapter(JustForYouAdapter());
    }
    if (!Hive.isAdapterRegistered(16)) {
      Hive.registerAdapter(HomeContentCacheWrapperAdapter());
    }

    if (!Hive.isAdapterRegistered(17)) {
      Hive.registerAdapter(TicketResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(18)) {
      Hive.registerAdapter(TicketCacheWrapperAdapter());
    }

    if (!Hive.isAdapterRegistered(19)) {
      Hive.registerAdapter(ProductDetailResponseAdapter());
    }
    if (!Hive.isAdapterRegistered(20)) {
      Hive.registerAdapter(DetailedRatingAdapter());
    }
    if (!Hive.isAdapterRegistered(21)) {
      Hive.registerAdapter(ExtraOptionAdapter());
    }
    if (!Hive.isAdapterRegistered(22)) {
      Hive.registerAdapter(ValueAdapter());
    }
    if (!Hive.isAdapterRegistered(23)) {
      Hive.registerAdapter(MoreInformationAdapter());
    }
    if (!Hive.isAdapterRegistered(24)) {
      Hive.registerAdapter(AttrListAdapter());
    }
    if (!Hive.isAdapterRegistered(25)) {
      Hive.registerAdapter(OtherBrandAdapter());
    }
    if (!Hive.isAdapterRegistered(26)) {
      Hive.registerAdapter(VarientAdapter());
    }
    if (!Hive.isAdapterRegistered(27)) {
      Hive.registerAdapter(OptionAdapter());
    }
    if (!Hive.isAdapterRegistered(28)) {
      Hive.registerAdapter(ConfigurableProductAdapter());
    }
    if (!Hive.isAdapterRegistered(29)) {
      Hive.registerAdapter(BuysTogatherAdapter());
    }
    if (!Hive.isAdapterRegistered(30)) {
      Hive.registerAdapter(YoutubeVideoAdapter());
    }
    if (!Hive.isAdapterRegistered(31)) {
      Hive.registerAdapter(ProductDetailCacheWrapperAdapter());
    }

    try {
      if (await Hive.boxExists(dbCategoryName)) {
        if (kDebugMode) {
          print('🔄 Migrating category cache: deleting old format');
        }
        await Hive.deleteBoxFromDisk(dbCategoryName);
      }
    } catch (e) {
      if (kDebugMode) {
        print('⚠️ Migration error (safe to ignore): $e');
      }
    }

    return await Hive.openBox<CategoryCacheWrapper>(dbCategoryName);
  }
}
