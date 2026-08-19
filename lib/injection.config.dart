// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import 'core/cache/auth_cache_manager.dart' as _i475;
import 'core/cache/category_facet_cache.dart' as _i655;
import 'core/cache/category_filter_store.dart' as _i226;
import 'core/cache/special_category_filter_store.dart' as _i568;
import 'core/endpoints/api_endpoints.dart' as _i560;
import 'core/utils/encryption_helper.dart' as _i40;
import 'data/api_service/auth_api_service.dart' as _i925;
import 'data/api_service/cart_api_service.dart' as _i411;
import 'data/api_service/category_banner_api_service.dart' as _i1026;
import 'data/api_service/checkout_api_service.dart' as _i615;
import 'data/api_service/home_banner_api_service.dart' as _i1042;
import 'data/api_service/homepage_offers_api_service.dart' as _i834;
import 'data/api_service/i_auth_api_service.dart' as _i447;
import 'data/api_service/i_cart_api_service.dart' as _i741;
import 'data/api_service/i_category_banner_api_service.dart' as _i302;
import 'data/api_service/i_checkout_api_service.dart' as _i735;
import 'data/api_service/i_home_banner_api_service.dart' as _i346;
import 'data/api_service/i_homepage_offers_api_service.dart' as _i1071;
import 'data/api_service/i_notification_api_service.dart' as _i334;
import 'data/api_service/i_place_picker_api_service.dart' as _i98;
import 'data/api_service/i_product_api_service.dart' as _i950;
import 'data/api_service/i_saved_payment_api_service.dart' as _i430;
import 'data/api_service/i_search_api_service.dart' as _i1016;
import 'data/api_service/i_support_api_service.dart' as _i75;
import 'data/api_service/i_ticket_api_service.dart' as _i949;
import 'data/api_service/i_user_profile_api_service.dart' as _i211;
import 'data/api_service/i_wishlist_api_service.dart' as _i267;
import 'data/api_service/notification_api_service.dart' as _i554;
import 'data/api_service/place_picker_api_service.dart' as _i987;
import 'data/api_service/product_api_service.dart' as _i118;
import 'data/api_service/saved_payment_api_service.dart' as _i681;
import 'data/api_service/search_api_service.dart' as _i760;
import 'data/api_service/support_api_service.dart' as _i961;
import 'data/api_service/ticket_api_service.dart' as _i505;
import 'data/api_service/user_profile_api_service.dart' as _i62;
import 'data/api_service/wishlist_api_service.dart' as _i962;
import 'data/interceptors/auth_interceptor.dart' as _i481;
import 'data/local_data_source/category_local_data_source.dart' as _i139;
import 'data/local_data_source/category_local_data_source_impl.dart' as _i777;
import 'data/local_data_source/home_content_local_data_source.dart' as _i821;
import 'data/local_data_source/home_content_local_data_source_impl.dart'
    as _i846;
import 'data/local_data_source/product_detail_local_data_source.dart' as _i37;
import 'data/local_data_source/product_detail_local_data_source_impl.dart'
    as _i478;
import 'data/local_data_source/ticket_local_data_source.dart' as _i50;
import 'data/local_data_source/ticket_local_data_source_impl.dart' as _i572;
import 'data/local_data_source/user_profile_local_data_source.dart' as _i37;
import 'data/local_data_source/user_profile_local_data_source_impl.dart'
    as _i261;
import 'data/mapper/saved_payment_mapper.dart' as _i462;
import 'data/mapper/ticket_mapper.dart' as _i37;
import 'data/model/cache/category_cache_wrapper.dart' as _i288;
import 'data/network_info/network_info.dart' as _i341;
import 'data/permission/i_permission_service.dart' as _i437;
import 'data/permission/permission_service.dart' as _i902;
import 'data/photo_picker_service/photo_picker_service.dart' as _i513;
import 'data/photo_picker_service/photo_picker_service_impl.dart' as _i433;
import 'data/repository/auth_repository_impl.dart' as _i448;
import 'data/repository/cart_repository_impl.dart' as _i639;
import 'data/repository/category_banner_repository_impl.dart' as _i499;
import 'data/repository/club_point_repository_impl.dart' as _i131;
import 'data/repository/delivery_charge_repository_impl.dart' as _i220;
import 'data/repository/home_banner_repository_impl.dart' as _i148;
import 'data/repository/homepage_offers_repository_impl.dart' as _i806;
import 'data/repository/notification_repository_impl.dart' as _i278;
import 'data/repository/place_picker_repository_impl.dart' as _i597;
import 'data/repository/product_repository_impl.dart' as _i907;
import 'data/repository/promo_repository_impl.dart' as _i815;
import 'data/repository/saved_payment_repository_impl.dart' as _i782;
import 'data/repository/search_repository_impl.dart' as _i153;
import 'data/repository/support_repository_impl.dart' as _i402;
import 'data/repository/ticket_repository_impl.dart' as _i1002;
import 'data/repository/user_profile_repository_impl.dart' as _i370;
import 'data/repository/wishlist_repository_impl.dart' as _i931;
import 'data/services/analytics_service.dart' as _i703;
import 'data/services/i_analytics_service.dart' as _i446;
import 'data/services/push_notification_service.dart' as _i573;
import 'data/services/recaptcha_service.dart' as _i1017;
import 'di/app_init_module.dart' as _i220;
import 'di/connection_module.dart' as _i293;
import 'di/network_module.dart' as _i905;
import 'di/secure_storage_module.dart' as _i701;
import 'domain/repository/auth_repository.dart' as _i914;
import 'domain/repository/cart_repository.dart' as _i907;
import 'domain/repository/category_banner_repository.dart' as _i377;
import 'domain/repository/club_point_repository.dart' as _i283;
import 'domain/repository/delivery_charge_repository.dart' as _i1036;
import 'domain/repository/home_banner_repository.dart' as _i731;
import 'domain/repository/homepage_offers_repository.dart' as _i1070;
import 'domain/repository/notification_repository.dart' as _i899;
import 'domain/repository/place_picker_repository.dart' as _i225;
import 'domain/repository/product_repository.dart' as _i570;
import 'domain/repository/promo_repository.dart' as _i585;
import 'domain/repository/saved_payment_repository.dart' as _i92;
import 'domain/repository/search_repository.dart' as _i38;
import 'domain/repository/support_repository.dart' as _i766;
import 'domain/repository/ticket_repository.dart' as _i218;
import 'domain/repository/user_profile_repository.dart' as _i930;
import 'domain/repository/wishlist_repository.dart' as _i828;
import 'presentation/bloc/address/address_bloc.dart' as _i340;
import 'presentation/bloc/auth/auth_bloc/auth_bloc.dart' as _i1063;
import 'presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart'
    as _i621;
import 'presentation/bloc/auth/login_bloc/login_bloc.dart' as _i473;
import 'presentation/bloc/auth/otp_bloc/otp_bloc.dart' as _i825;
import 'presentation/bloc/auth/registration_bloc/registration_bloc.dart'
    as _i460;
import 'presentation/bloc/autocomplete_bloc/autocomplete_bloc.dart' as _i596;
import 'presentation/bloc/banner_bloc/banner_bloc.dart' as _i108;
import 'presentation/bloc/brand_products_bloc/brand_products_bloc.dart'
    as _i158;
import 'presentation/bloc/card_bin_bloc/card_bin_bloc.dart' as _i513;
import 'presentation/bloc/cart_bloc/cart_bloc.dart' as _i433;
import 'presentation/bloc/category_banner_bloc/category_banner_bloc.dart'
    as _i65;
import 'presentation/bloc/category_bloc/category_bloc.dart' as _i1066;
import 'presentation/bloc/category_products_bloc/category_products_bloc.dart'
    as _i915;
import 'presentation/bloc/checkout_bloc/checkout_bloc.dart' as _i888;
import 'presentation/bloc/club_point_bloc/club_point_bloc.dart' as _i727;
import 'presentation/bloc/cms_content_bloc/cms_content_bloc.dart' as _i177;
import 'presentation/bloc/compare_bloc/compare_bloc.dart' as _i360;
import 'presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart'
    as _i583;
import 'presentation/bloc/discover_category_bloc/discover_category_bloc.dart'
    as _i111;
import 'presentation/bloc/emi_bloc/emi_bloc.dart' as _i262;
import 'presentation/bloc/filter_bloc/filter_bloc.dart' as _i923;
import 'presentation/bloc/home_banner_bloc/home_banner_bloc.dart' as _i780;
import 'presentation/bloc/home_content_bloc/home_content_bloc.dart' as _i664;
import 'presentation/bloc/home_flash_sale_bloc/home_flash_sale_bloc.dart'
    as _i115;
import 'presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart'
    as _i537;
import 'presentation/bloc/internet/internet_bloc.dart' as _i593;
import 'presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart' as _i843;
import 'presentation/bloc/nav_drawer/nav_drawer_bloc.dart' as _i341;
import 'presentation/bloc/notification_bloc/notification_bloc.dart' as _i1070;
import 'presentation/bloc/order_bloc/order_bloc.dart' as _i675;
import 'presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart' as _i911;
import 'presentation/bloc/place_picker_bloc/place_picker_bloc.dart' as _i779;
import 'presentation/bloc/popup_bloc/popup_bloc.dart' as _i544;
import 'presentation/bloc/product_detail_bloc/product_detail_bloc.dart'
    as _i998;
import 'presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart'
    as _i915;
import 'presentation/bloc/promo_bloc/promo_bloc.dart' as _i609;
import 'presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart'
    as _i958;
import 'presentation/bloc/recaptcha_bloc/recaptcha_bloc.dart' as _i780;
import 'presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart'
    as _i460;
import 'presentation/bloc/referral/referral_bloc.dart' as _i591;
import 'presentation/bloc/related_products_bloc/related_products_bloc.dart'
    as _i39;
import 'presentation/bloc/review_bloc/review_bloc.dart' as _i449;
import 'presentation/bloc/saved_payment/saved_payment_bloc.dart' as _i851;
import 'presentation/bloc/search_bloc/search_bloc.dart' as _i623;
import 'presentation/bloc/seller_products_bloc/seller_products_bloc.dart'
    as _i169;
import 'presentation/bloc/special_category_products_bloc/special_category_products_bloc.dart'
    as _i434;
import 'presentation/bloc/support/privacy_policy_bloc/privacy_policy_bloc.dart'
    as _i649;
import 'presentation/bloc/support/return_policy_bloc/return_policy_bloc.dart'
    as _i934;
import 'presentation/bloc/support/support_article_bloc/support_article_bloc.dart'
    as _i269;
import 'presentation/bloc/support/support_category_bloc/support_category_bloc.dart'
    as _i43;
import 'presentation/bloc/support/terms_and_condition_bloc/terms_and_condition_bloc.dart'
    as _i992;
import 'presentation/bloc/ticket_bloc/ticket_bloc.dart' as _i745;
import 'presentation/bloc/user_profile/user_profile_bloc.dart' as _i845;
import 'presentation/bloc/wishlist/wishlist_bloc.dart' as _i921;
import 'presentation/bloc/write_review_bloc/write_review_bloc.dart' as _i40;
import 'presentation/navigation/deep_link_handler.dart' as _i21;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appInitModule = _$AppInitModule();
  final secureStorageModule = _$SecureStorageModule();
  final connectionModule = _$ConnectionModule();
  final networkModule = _$NetworkModule();
  await gh.factoryAsync<_i986.Box<_i288.CategoryCacheWrapper>>(
    () => appInitModule.openCategoryBox(),
    preResolve: true,
  );
  gh.factory<_i560.ApiEndpoints>(() => _i560.ApiEndpoints());
  gh.factory<_i923.FilterBloc>(() => _i923.FilterBloc());
  gh.factory<_i341.NavDrawerBloc>(() => _i341.NavDrawerBloc());
  gh.lazySingleton<_i558.FlutterSecureStorage>(
    () => secureStorageModule.storage(),
  );
  gh.lazySingleton<_i973.InternetConnectionChecker>(
    () => connectionModule.connectionChecker,
  );
  gh.lazySingleton<_i226.CategoryFilterStore>(
    () => _i226.CategoryFilterStore(),
  );
  gh.lazySingleton<_i568.SpecialCategoryFilterStore>(
    () => _i568.SpecialCategoryFilterStore(),
  );
  gh.lazySingleton<_i655.CategoryFacetCache>(() => _i655.CategoryFacetCache());
  gh.lazySingleton<_i475.AuthCacheManager>(() => _i475.AuthCacheManager());
  gh.lazySingleton<_i40.EncryptionHelper>(() => _i40.EncryptionHelper());
  gh.lazySingleton<_i462.SavedPaymentMapper>(() => _i462.SavedPaymentMapper());
  gh.lazySingleton<_i37.TicketMapper>(() => _i37.TicketMapper());
  gh.lazySingleton<_i573.PushNotificationService>(
    () => _i573.PushNotificationService(),
  );
  gh.lazySingleton<_i1017.RecaptchaService>(() => _i1017.RecaptchaService());
  gh.lazySingleton<_i593.InternetBloc>(() => _i593.InternetBloc());
  gh.lazySingleton<_i37.UserProfileLocalDataSource>(
    () => _i261.UserProfileLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i139.CategoryLocalDataSource>(
    () => _i777.CategoryLocalDataSourceImpl(),
  );
  gh.factory<_i780.RecaptchaBloc>(
    () => _i780.RecaptchaBloc(gh<_i1017.RecaptchaService>()),
  );
  gh.lazySingleton<_i703.AnalyticsService>(() => _i446.IAnalyticsService());
  gh.lazySingleton<_i361.Dio>(
    () => networkModule.barikoiDio(),
    instanceName: 'barikoi',
  );
  gh.lazySingleton<_i821.HomeContentLocalDataSource>(
    () => _i846.HomeContentLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i37.ProductDetailLocalDataSource>(
    () => _i478.ProductDetailLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i341.NetworkInfo>(() => connectionModule.networkInfo);
  gh.lazySingleton<_i513.PhotoPickerService>(
    () => _i433.PhotoPickerServiceImpl(),
  );
  gh.lazySingleton<_i50.TicketLocalDataSource>(
    () => _i572.TicketLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i437.IPermissionService>(() => _i902.PermissionService());
  gh.factory<_i481.AuthInterceptor>(
    () => _i481.AuthInterceptor(
      gh<_i475.AuthCacheManager>(),
      gh<_i50.TicketLocalDataSource>(),
      gh<_i37.UserProfileLocalDataSource>(),
    ),
  );
  gh.lazySingleton<_i987.PlacePickerApiService>(
    () => _i98.IPlacePickerApiService(gh<_i361.Dio>(instanceName: 'barikoi')),
  );
  gh.factory<_i911.PhotoPickerBloc>(
    () => _i911.PhotoPickerBloc(gh<_i513.PhotoPickerService>()),
  );
  gh.lazySingleton<_i225.PlacePickerRepository>(
    () => _i597.PlacePickerRepositoryImpl(gh<_i987.PlacePickerApiService>()),
  );
  gh.lazySingleton<_i361.Dio>(
    () => networkModule.dio(gh<_i481.AuthInterceptor>()),
  );
  gh.factory<_i779.PlacePickerBloc>(
    () => _i779.PlacePickerBloc(gh<_i225.PlacePickerRepository>()),
  );
  gh.lazySingleton<_i62.UserProfileApiService>(
    () => _i211.IUserProfileApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i930.UserProfileRepository>(
    () => _i370.UserProfileRepositoryImpl(
      gh<_i62.UserProfileApiService>(),
      gh<_i475.AuthCacheManager>(),
      gh<_i37.UserProfileLocalDataSource>(),
      gh<_i1017.RecaptchaService>(),
    ),
  );
  gh.lazySingleton<_i961.SupportApiService>(
    () => _i75.ISupportApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i925.AuthApiService>(
    () => _i447.IAuthApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i1071.HomepageOffersApiService>(
    () => _i834.IHomepageOffersApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i766.SupportRepository>(
    () => _i402.SupportRepositoryImpl(gh<_i961.SupportApiService>()),
  );
  gh.lazySingleton<_i505.TicketApiService>(
    () => _i949.ITicketApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i346.HomeBannerApiService>(
    () => _i1042.IHomeBannerApiService(gh<_i361.Dio>()),
  );
  gh.factory<_i596.AutocompleteBloc>(
    () => _i596.AutocompleteBloc(
      gh<_i225.PlacePickerRepository>(),
      gh<_i341.NetworkInfo>(),
    ),
  );
  gh.lazySingleton<_i1070.HomepageOffersRepository>(
    () => _i806.HomepageOffersRepositoryImpl(
      gh<_i1071.HomepageOffersApiService>(),
    ),
  );
  gh.factory<_i591.ReferralBloc>(
    () => _i591.ReferralBloc(gh<_i930.UserProfileRepository>()),
  );
  gh.factory<_i340.AddressBloc>(
    () => _i340.AddressBloc(gh<_i930.UserProfileRepository>()),
  );
  gh.factory<_i845.UserProfileBloc>(
    () => _i845.UserProfileBloc(gh<_i930.UserProfileRepository>()),
  );
  gh.factory<_i675.OrderBloc>(
    () => _i675.OrderBloc(gh<_i930.UserProfileRepository>()),
  );
  gh.lazySingleton<_i118.ProductApiService>(
    () => _i950.IProductApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i681.SavedPaymentApiService>(
    () => _i430.ISavedPaymentApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i92.SavedPaymentRepository>(
    () => _i782.SavedPaymentRepositoryImpl(
      gh<_i681.SavedPaymentApiService>(),
      gh<_i462.SavedPaymentMapper>(),
    ),
  );
  gh.lazySingleton<_i302.CategoryBannerApiService>(
    () => _i1026.ICategoryBannerApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i377.CategoryBannerRepository>(
    () => _i499.CategoryBannerRepositoryImpl(
      gh<_i302.CategoryBannerApiService>(),
    ),
  );
  gh.factory<_i851.SavedPaymentBloc>(
    () => _i851.SavedPaymentBloc(gh<_i92.SavedPaymentRepository>()),
  );
  gh.lazySingleton<_i554.NotificationApiService>(
    () => _i334.INotificationApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i615.CheckoutApiService>(
    () => _i735.ICheckoutApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i411.CartApiService>(
    () => _i741.ICartApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i1036.DeliveryChargeRepository>(
    () => _i220.DeliveryChargeRepositoryImpl(gh<_i118.ProductApiService>()),
  );
  gh.factory<_i177.CmsContentBloc>(
    () => _i177.CmsContentBloc(gh<_i118.ProductApiService>()),
  );
  gh.factory<_i262.EmiBloc>(() => _i262.EmiBloc(gh<_i118.ProductApiService>()));
  gh.lazySingleton<_i218.TicketRepository>(
    () => _i1002.TicketRepositoryImpl(
      gh<_i505.TicketApiService>(),
      gh<_i37.TicketMapper>(),
      gh<_i50.TicketLocalDataSource>(),
    ),
  );
  gh.factory<_i583.DeliveryChargeBloc>(
    () => _i583.DeliveryChargeBloc(gh<_i1036.DeliveryChargeRepository>()),
  );
  gh.lazySingleton<_i760.SearchApiService>(
    () => _i1016.ISearchApiService(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i38.SearchRepository>(
    () => _i153.SearchRepositoryImpl(gh<_i760.SearchApiService>()),
  );
  gh.lazySingleton<_i962.WishlistApiService>(
    () => _i267.IWishlistApiService(gh<_i361.Dio>()),
  );
  gh.factory<_i745.TicketBloc>(
    () => _i745.TicketBloc(gh<_i218.TicketRepository>()),
  );
  gh.factory<_i649.PrivacyPolicyBloc>(
    () => _i649.PrivacyPolicyBloc(gh<_i766.SupportRepository>()),
  );
  gh.factory<_i992.TermsAndConditionBloc>(
    () => _i992.TermsAndConditionBloc(gh<_i766.SupportRepository>()),
  );
  gh.factory<_i43.SupportCategoryBloc>(
    () => _i43.SupportCategoryBloc(gh<_i766.SupportRepository>()),
  );
  gh.factory<_i934.ReturnPolicyBloc>(
    () => _i934.ReturnPolicyBloc(gh<_i766.SupportRepository>()),
  );
  gh.factory<_i269.SupportArticleBloc>(
    () => _i269.SupportArticleBloc(gh<_i766.SupportRepository>()),
  );
  gh.lazySingleton<_i914.AuthRepository>(
    () => _i448.AuthRepositoryImpl(
      gh<_i925.AuthApiService>(),
      gh<_i475.AuthCacheManager>(),
      gh<_i1017.RecaptchaService>(),
    ),
  );
  gh.lazySingleton<_i283.ClubPointRepository>(
    () => _i131.ClubPointRepositoryImpl(gh<_i62.UserProfileApiService>()),
  );
  gh.factory<_i537.HomepageOffersBloc>(
    () => _i537.HomepageOffersBloc(gh<_i1070.HomepageOffersRepository>()),
  );
  gh.factory<_i1063.AuthBloc>(
    () => _i1063.AuthBloc(
      gh<_i914.AuthRepository>(),
      gh<_i930.UserProfileRepository>(),
    ),
  );
  gh.lazySingleton<_i570.ProductRepository>(
    () => _i907.ProductRepositoryImpl(
      gh<_i118.ProductApiService>(),
      gh<_i139.CategoryLocalDataSource>(),
      gh<_i37.ProductDetailLocalDataSource>(),
      gh<_i821.HomeContentLocalDataSource>(),
    ),
  );
  gh.lazySingleton<_i731.HomeBannerRepository>(
    () => _i148.HomeBannerRepositoryImpl(gh<_i346.HomeBannerApiService>()),
  );
  gh.factory<_i998.ProductDetailBloc>(
    () => _i998.ProductDetailBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
      gh<_i475.AuthCacheManager>(),
    ),
  );
  gh.factory<_i460.RegistrationBloc>(
    () => _i460.RegistrationBloc(
      gh<_i914.AuthRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i473.LoginBloc>(
    () => _i473.LoginBloc(
      gh<_i914.AuthRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i65.CategoryBannerBloc>(
    () => _i65.CategoryBannerBloc(gh<_i377.CategoryBannerRepository>()),
  );
  gh.factory<_i915.CategoryProductsBloc>(
    () => _i915.CategoryProductsBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
      gh<_i226.CategoryFilterStore>(),
      gh<_i655.CategoryFacetCache>(),
    ),
  );
  gh.factory<_i158.BrandProductsBloc>(
    () => _i158.BrandProductsBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
      gh<_i226.CategoryFilterStore>(),
      gh<_i655.CategoryFacetCache>(),
    ),
  );
  gh.lazySingleton<_i585.PromoRepository>(
    () => _i815.PromoRepositoryImpl(gh<_i118.ProductApiService>()),
  );
  gh.lazySingleton<_i907.CartRepository>(
    () => _i639.CartRepositoryImpl(
      gh<_i411.CartApiService>(),
      gh<_i615.CheckoutApiService>(),
    ),
  );
  gh.lazySingleton<_i899.NotificationRepository>(
    () => _i278.NotificationRepositoryImpl(
      gh<_i554.NotificationApiService>(),
      gh<_i475.AuthCacheManager>(),
    ),
  );
  gh.factory<_i433.CartBloc>(
    () => _i433.CartBloc(
      gh<_i907.CartRepository>(),
      gh<_i475.AuthCacheManager>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i434.SpecialCategoryProductsBloc>(
    () => _i434.SpecialCategoryProductsBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
      gh<_i568.SpecialCategoryFilterStore>(),
      gh<_i655.CategoryFacetCache>(),
    ),
  );
  gh.factory<_i780.HomeBannerBloc>(
    () => _i780.HomeBannerBloc(gh<_i731.HomeBannerRepository>()),
  );
  gh.factory<_i623.SearchBloc>(
    () => _i623.SearchBloc(
      gh<_i38.SearchRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.lazySingleton<_i828.WishlistRepository>(
    () => _i931.WishlistRepositoryImpl(gh<_i962.WishlistApiService>()),
  );
  gh.factory<_i825.OtpBloc>(() => _i825.OtpBloc(gh<_i914.AuthRepository>()));
  gh.factory<_i621.ForgotPasswordBloc>(
    () => _i621.ForgotPasswordBloc(gh<_i914.AuthRepository>()),
  );
  gh.factory<_i958.PromotionSliderBloc>(
    () => _i958.PromotionSliderBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i115.HomeFlashSaleBloc>(
    () => _i115.HomeFlashSaleBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i460.RecommendedProductsBloc>(
    () => _i460.RecommendedProductsBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i108.BannerBloc>(
    () => _i108.BannerBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i40.WriteReviewBloc>(
    () => _i40.WriteReviewBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i111.DiscoverCategoryBloc>(
    () => _i111.DiscoverCategoryBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i544.PopupBloc>(
    () => _i544.PopupBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i1066.CategoryBloc>(
    () => _i1066.CategoryBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i664.HomeContentBloc>(
    () => _i664.HomeContentBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i39.RelatedProductsBloc>(
    () => _i39.RelatedProductsBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i360.CompareBloc>(
    () => _i360.CompareBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i915.ProductFlashSaleBloc>(
    () => _i915.ProductFlashSaleBloc(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i449.ReviewBloc>(
    () => _i449.ReviewBloc(
      gh<_i570.ProductRepository>(),
      gh<_i475.AuthCacheManager>(),
    ),
  );
  gh.factory<_i727.ClubPointBloc>(
    () => _i727.ClubPointBloc(gh<_i283.ClubPointRepository>()),
  );
  gh.factory<_i169.SellerProductsBloc>(
    () => _i169.SellerProductsBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i843.JustForYouBloc>(
    () => _i843.JustForYouBloc(
      gh<_i570.ProductRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i888.CheckoutBloc>(
    () => _i888.CheckoutBloc(
      gh<_i907.CartRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i513.CardBinBloc>(
    () => _i513.CardBinBloc(gh<_i907.CartRepository>()),
  );
  gh.lazySingleton<_i21.DeepLinkHandler>(
    () => _i21.DeepLinkHandler(gh<_i570.ProductRepository>()),
  );
  gh.factory<_i921.WishlistBloc>(
    () => _i921.WishlistBloc(
      gh<_i828.WishlistRepository>(),
      gh<_i703.AnalyticsService>(),
    ),
  );
  gh.factory<_i609.PromoBloc>(
    () => _i609.PromoBloc(gh<_i585.PromoRepository>()),
  );
  gh.factory<_i1070.NotificationBloc>(
    () => _i1070.NotificationBloc(gh<_i899.NotificationRepository>()),
  );
  return getIt;
}

class _$AppInitModule extends _i220.AppInitModule {}

class _$SecureStorageModule extends _i701.SecureStorageModule {}

class _$ConnectionModule extends _i293.ConnectionModule {}

class _$NetworkModule extends _i905.NetworkModule {}
