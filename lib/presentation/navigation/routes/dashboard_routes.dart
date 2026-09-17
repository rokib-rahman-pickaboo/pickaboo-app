import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/navigation/app_navigator_key.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/home_banner_bloc/home_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_content_bloc/home_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_flash_sale_bloc/home_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/popup_bloc/popup_bloc.dart';
import 'package:pickaboo/presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/privacy_policy_bloc/privacy_policy_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/return_policy_bloc/return_policy_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_article_bloc/support_article_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/support_category_bloc/support_category_bloc.dart';
import 'package:pickaboo/presentation/bloc/support/terms_and_condition_bloc/terms_and_condition_bloc.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/add_card_page/add_card_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/account_information_page/account_information_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/address_page/address_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/club_point_page/club_point_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/contact_us_page/contact_us_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/privacy_policy_page/privacy_policy_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/return_policy_page/return_policy_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/content/terms_page/terms_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/create_ticket_page/create_ticket_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/dashboard_page/dashboard_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/edit_account_information_page/edit_account_information_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/new_address_page/new_address_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/referral_code_page/referral_code_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/referral_page/referral_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/review_page/review_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/save_payment_page/save_payment_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/setting_page/setting_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_detail_page/ticket_detail_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_main_page/ticket_main_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/wish_list_page/wish_list_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/write_review_page/write_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/your_review_page/your_review_page.dart';
import 'package:pickaboo/presentation/ui/pages/discover_category_page/discover_category_page.dart';
import 'package:pickaboo/presentation/ui/pages/home_page/home_page.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_details_page/knowledge_base_details_page.dart';
import 'package:pickaboo/presentation/ui/pages/knowledge_base_page/knowledge_base_page.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/pages/notification_list_page/notification_list_page.dart';

/// Routes for main navigation shell, user account, support, and settings.
final List<RouteBase> dashboardRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, shell) => MainPage(navigationShell: shell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.home,
            name: 'home',
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<HomeContentBloc>()),
                  BlocProvider(create: (context) => getIt<HomepageOffersBloc>()),
                  BlocProvider(create: (context) => getIt<PromotionSliderBloc>()),
                  BlocProvider(create: (context) => getIt<HomeFlashSaleBloc>()),
                  BlocProvider(create: (context) => getIt<HomeBannerBloc>()),
                  BlocProvider(create: (context) => getIt<PopupBloc>()),
                  BlocProvider(create: (context) => getIt<JustForYouBloc>()),
                ],
                child: const HomePage(),
              );
            },
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.discoverCategory,
            name: 'discoverCategory',
            builder: (context, state) => const DiscoverCategoryPage(),
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.knowledgeBase,
            name: 'knowledgeBase',
            builder: (context, state) {
              return BlocProvider(
                create: (context) => getIt<SupportCategoryBloc>(),
                child: const KnowledgeBasePage(),
              );
            },
            routes: [
              GoRoute(
                path: ':id',
                name: 'knowledgeBaseDetails',
                parentNavigatorKey: appNavigatorKey,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  final id = state.pathParameters['id'];
                  final query = extra?['query'] as String?;
                  final categoryId = extra?['categoryId'] as String? ??
                      ((query != null && query.isNotEmpty) ? null : id);
                  final categoryName =
                      extra?['categoryName'] as String? ?? 'Help Articles';

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => getIt<SupportArticleBloc>()),
                      BlocProvider(
                        lazy: false,
                        create: (context) => getIt<SupportCategoryBloc>()
                          ..add(const SupportCategoryEvent.getSupportCategories()),
                      ),
                    ],
                    child: KnowledgeBaseDetailsPage(
                      categoryId: categoryId,
                      categoryName: categoryName,
                      query: query,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),

      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.dashboard,
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
        ],
      ),
    ],
  ),

  GoRoute(
    path: Routes.wishlist,
    name: 'wishlist_response',
    builder: (context, state) => const WishListPage(),
  ),

  GoRoute(
    path: Routes.savePayment,
    name: 'savePayment',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<SavedPaymentBloc>(),
      child: SavePaymentPage(customerId: (state.extra as String?) ?? ''),
    ),
  ),

  GoRoute(
    path: Routes.addCard,
    name: 'addCard',
    builder: (context, state) => const AddCards(),
  ),

  GoRoute(
    path: Routes.address,
    name: 'address',
    builder: (context, state) => const AddressPage(),
  ),

  GoRoute(
    path: Routes.newAddress,
    name: 'newAddress',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final address = extra?['address'];
      return NewAddressPage(existingAddress: address);
    },
  ),

  GoRoute(
    path: Routes.review,
    name: 'review',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<ReviewBloc>(),
      child: const Review(),
    ),
  ),

  GoRoute(
    path: Routes.yourReview,
    name: 'yourReview',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<ReviewBloc>(),
      child: const YourReviewPage(),
    ),
  ),

  GoRoute(
    path: Routes.writeReview,
    name: 'writeReviewOrder',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<WriteReviewBloc>()),
          BlocProvider(create: (context) => getIt<PhotoPickerBloc>()),
        ],
        child: WriteReviewPage(
          productId: extra['productId'] as String,
          productName: extra['productName'] as String,
          productImage: extra['productImage'] as String? ?? "",
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.ticketMain,
    name: 'ticketMain',
    builder: (context, state) => const TicketMainPage(),
  ),

  GoRoute(
    path: Routes.createTicket,
    name: 'createTicket',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<PhotoPickerBloc>(),
      child: const CreateTicketPage(),
    ),
  ),

  GoRoute(
    path: Routes.ticketDetail,
    name: 'ticketDetail',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return BlocProvider(
        create: (context) => getIt<PhotoPickerBloc>(),
        child: TicketDetailPage(ticketId: id),
      );
    },
  ),

  GoRoute(
    path: Routes.accountInformation,
    name: 'accountInformation',
    builder: (context, state) => const AccountInformationPage(),
  ),

  GoRoute(
    path: Routes.editAccountInformation,
    name: 'editAccountInformation',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<PhotoPickerBloc>(),
      child: const EditAccountInformationPage(),
    ),
  ),

  GoRoute(
    path: Routes.setting,
    name: 'setting',
    builder: (context, state) => const SettingsPage(),
  ),

  GoRoute(
    path: Routes.clubPoint,
    name: 'clubPoint',
    builder: (context, state) => const ClubPointPage(),
  ),

  GoRoute(
    path: Routes.knowledgeBaseDetailsStandalone,
    name: 'knowledgeBaseDetailsStandalone',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      final extra = state.extra as Map<String, dynamic>?;
      final categoryId = extra?['categoryId'] as String?;
      final categoryName = extra?['categoryName'] as String? ?? 'Help Articles';
      final query = extra?['query'] as String?;

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SupportArticleBloc>()),
          BlocProvider(
            lazy: false,
            create: (context) => getIt<SupportCategoryBloc>()
              ..add(const SupportCategoryEvent.getSupportCategories()),
          ),
        ],
        child: KnowledgeBaseDetailsPage(
          categoryId: categoryId ??
              ((query != null && query.isNotEmpty || id == 'search') ? null : id),
          categoryName: categoryName,
          query: query,
        ),
      );
    },
  ),

  GoRoute(
    path: Routes.terms,
    name: 'terms',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<TermsAndConditionBloc>(),
      child: const TermsAndConditionPage(),
    ),
  ),

  GoRoute(
    path: Routes.privacyPolicy,
    name: 'privacyPolicy',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<PrivacyPolicyBloc>(),
      child: const PrivacyPolicyPage(),
    ),
  ),

  GoRoute(
    path: Routes.returnPolicy,
    name: 'returnPolicy',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<ReturnPolicyBloc>(),
      child: const ReturnPolicyPage(),
    ),
  ),

  GoRoute(
    path: Routes.contactUs,
    name: 'contactUs',
    builder: (context, state) => const ContactUsPage(),
  ),

  GoRoute(
    path: Routes.notificationList,
    name: 'notificationList',
    builder: (context, state) => const NotificationListPage(),
  ),

  GoRoute(
    path: Routes.referral,
    name: 'referral',
    builder: (context, state) => const ReferralPage(),
  ),

  GoRoute(
    path: Routes.referralCode,
    name: 'referralCode',
    builder: (context, state) =>
        const ReferralCodePage(referralCode: "referralCode"),
  ),
];
