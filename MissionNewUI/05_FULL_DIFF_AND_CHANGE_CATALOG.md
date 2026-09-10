# 📜 05: Complete Change Catalog, Rationale & Architectural Remarks

## 📊 Summary of Modified & New Files (60 Files Total)

### 1. New Core & Presentation Widgets (17 Files)

| File Path | Description & Why It Was Added |
|---|---|
| [`lib/core/theme/app_decorations.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/theme/app_decorations.dart) | Centralized `AppRadius`, `AppSpacing`, and `AppShadows` design tokens. |
| [`lib/presentation/ui/widgets/common/rating_stars.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/rating_stars.dart) | Unified amber rating stars component with fractional star support. |
| [`lib/presentation/ui/widgets/common/app_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/app_card.dart) | Standardized card wrapper with `12.r` radius and subtle border. |
| [`lib/presentation/ui/widgets/common/app_search_bar.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/app_search_bar.dart) | Reusable search bar input for catalog and knowledge base. |
| [`lib/presentation/ui/widgets/common/back_title_top_app_bar.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/back_title_top_app_bar.dart) | Standardized back navigation app bar with navy title. |
| [`lib/presentation/ui/widgets/common/text_only_top_app_bar.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/text_only_top_app_bar.dart) | Minimal text-only top bar for root tabs. |
| [`lib/presentation/ui/widgets/common/user_image_widget.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/user_image_widget.dart) | Avatar widget with network caching, placeholder, and online dot. |
| [`lib/presentation/ui/widgets/dashboard/app_menu_tile.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/app_menu_tile.dart) | Modern dashboard list menu item with trailing chevron. |
| [`lib/presentation/ui/widgets/dashboard/profile_grid_tile.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/profile_grid_tile.dart) | 2-column quick action dashboard grid tile with badge counter. |
| [`lib/presentation/ui/widgets/dashboard/profile_header_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/profile_header_card.dart) | Dashboard user summary card with edit profile trigger. |
| [`lib/presentation/ui/widgets/dashboard/profile_section_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/profile_section_card.dart) | Section container card grouping dashboard options. |
| [`lib/presentation/ui/widgets/filters/brand_filter_widget.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/filters/brand_filter_widget.dart) | Horizontal brand filter chips with uppercase formatting & clear option. |
| [`lib/presentation/ui/widgets/filters/question_filter_widget.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/filters/question_filter_widget.dart) | Dynamic question filter pills derived from API attributes. |
| [`lib/presentation/ui/widgets/home_page/home_category_nav.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/home_category_nav.dart) | Scroll-collapsible horizontal category bar with active sky blue indicator. |
| [`lib/presentation/ui/widgets/home_page/primary_home_widget.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/primary_home_widget.dart) | Consolidated "For You" homepage feed (banners, promos, sliders, just for you). |
| [`lib/presentation/ui/widgets/home_page/secondary_home_widget.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/secondary_home_widget.dart) | Way 1: Inline 20-product category preview with dynamic API filter questions. |
| [`lib/presentation/ui/widgets/knowledge_base_page/support_empty_state.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/knowledge_base_page/support_empty_state.dart) | Empty state graphic and message for support tickets. |

---

### 2. Modified Core & Data Layer (4 Files)

| File Path | Changes Made & Why |
|---|---|
| [`lib/core/color/app_colors.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/color/app_colors.dart) | Added `NewAppColors` semantic tokens (`pickabooBlue`, `navy`, `pageBg`, `surfaceBlue`, `border`, `redBg`, `amber`, `blueBorder`). |
| [`lib/core/theme/style/app_text_styles.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/theme/style/app_text_styles.dart) | Added `NewAppTextStyles` tokens matching `Pickaboo-App-UI` typography. |
| [`lib/core/endpoints/api_endpoints.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/core/endpoints/api_endpoints.dart) | Maintained endpoint configurations without breaking contracts. |
| [`lib/domain/entity/common/product/product_entity.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/domain/entity/common/product/product_entity.dart) | Added `ProductEntityX` extension for brand name parsing, original price, and discount percentage calculations. |

---

### 3. Modified Homepage & Navigation (4 Files)

| File Path | Changes Made & Why |
|---|---|
| [`lib/presentation/ui/pages/home_page/home_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/home_page/home_page.dart) | Restructured into pinned header + category bar + switchable primary/secondary feed; scroll-driven collapse state. |
| [`lib/presentation/ui/widgets/search_app_bar/search_app_bar.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/search_app_bar/search_app_bar.dart) | Split into `HomeTopHeader` and `SearchAppBar`; category-aware search hint (`"Search in [Category]..."`). |
| [`lib/presentation/ui/nav_drawer/nav_drawer.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/nav_drawer/nav_drawer.dart) | Fixed category routing parameters (`categoryId`, `categorySlug`, `categoryName`) and special category routing. |
| [`lib/presentation/ui/pages/main_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/main_page.dart) | Modernized bottom navigation bar with updated styling, badge counters, and active tint. |

---

### 4. Modified Product Cards & Sliders (8 Files)

| File Path | Changes Made & Why |
|---|---|
| [`lib/presentation/ui/widgets/common/product_view.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/product_view.dart) | 100% Pickaboo-App-UI redesign: 1:1 image, left-aligned brand/title/rating/price, amber stars, inline red discount pill. |
| [`lib/presentation/ui/widgets/common/list_product_view.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/list_product_view.dart) | 1-column list card with 90x90 image thumbnail and left-aligned details. |
| [`lib/presentation/ui/widgets/common/slider_product_view.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/slider_product_view.dart) | Fixed-width card for horizontal carousels with 1:1 square image. |
| [`lib/presentation/ui/widgets/home_page/flash_sale_category_slider.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/flash_sale_category_slider.dart) | Fixed `_calculateCarouselHeight` to account for 1:1 square image (resolved 30px bottom overflow). |
| [`lib/presentation/ui/widgets/home_page/category_slider.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/category_slider.dart) | Fixed carousel height calculation for 1:1 product card images. |
| [`lib/presentation/ui/widgets/category_product_page/category_featured_products_rail.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/category_product_page/category_featured_products_rail.dart) | Fixed horizontal rail height for 1:1 aspect ratio. |
| [`lib/presentation/ui/widgets/brand_product_page/brand_featured_products_rail.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/brand_product_page/brand_featured_products_rail.dart) | Fixed brand featured products rail height. |
| [`lib/presentation/ui/widgets/product_detail_page/product_section_slider.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/product_detail_page/product_section_slider.dart) | Fixed PDP product recommendation slider height. |

---

### 5. Modified Category Catalog & Filter System (3 Files)

| File Path | Changes Made & Why |
|---|---|
| [`lib/presentation/ui/pages/category_product_page/category_product_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/category_product_page/category_product_page.dart) | Prioritized `categoryId` over `categorySlug`; added `didUpdateWidget` for drawer category switching. |
| [`lib/presentation/ui/widgets/category_product_page/category_product_results.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/category_product_page/category_product_results.dart) | Interleaved product chunks with dynamic API questions at thresholds [2, 6, 14, 22, 30]. |
| [`lib/presentation/ui/widgets/common/filter_sort_bar.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/filter_sort_bar.dart) | Redesigned sort/filter cards with `12.r` radius, sort bottom sheet, active count badge, and grid/list view toggle. |

---

### 6. Modified Dashboard Pages & Components (17 Files)

| File Path | Changes Made & Why |
|---|---|
| [`lib/presentation/ui/pages/dashboard/dashboard_page/dashboard_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/dashboard_page/dashboard_page.dart) | Complete visual overhaul using new design tokens, profile grid, and menu tiles. |
| [`lib/presentation/ui/pages/dashboard/account_information_page/account_information_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/account_information_page/account_information_page.dart) | Clean personal info form cards, date pickers, and avatar editor. |
| [`lib/presentation/ui/pages/order/order_list_page/order_list_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/order/order_list_page/order_list_page.dart) | Modernized order list items with order status pill badges. |
| [`lib/presentation/ui/pages/dashboard/address_page/address_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/address_page/address_page.dart) | Address cards with default tag, edit/delete actions, and clean cards. |
| [`lib/presentation/ui/pages/dashboard/club_point_page/club_point_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/club_point_page/club_point_page.dart) | Club point balance header card and transaction history tiles. |
| [`lib/presentation/ui/pages/dashboard/ticket_main_page/ticket_main_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/ticket_main_page/ticket_main_page.dart) | Support ticket list with status badges and create ticket CTA. |
| [`lib/presentation/ui/pages/dashboard/create_ticket_page/create_ticket_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/create_ticket_page/create_ticket_page.dart) | Clean ticket creation form with department dropdown & file uploader. |
| [`lib/presentation/ui/pages/dashboard/referral_page/referral_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/referral_page/referral_page.dart) | Copy referral code card, social share triggers, earnings breakdown. |
| [`lib/presentation/ui/pages/dashboard/save_payment_page/save_payment_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/save_payment_page/save_payment_page.dart) | Saved payment methods list and add card form. |
| [`lib/presentation/ui/pages/dashboard/setting_page/setting_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/setting_page/setting_page.dart) | Notification toggle, biometric security, password change. |
| [`lib/presentation/ui/pages/knowledge_base_page/knowledge_base_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/knowledge_base_page/knowledge_base_page.dart) | FAQ accordion cards and search input. |
| [`lib/presentation/ui/pages/dashboard/contact_us_page/contact_us_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/contact_us_page/contact_us_page.dart) | Direct hotline dial, support email, office locations. |
| [`lib/presentation/ui/pages/dashboard/content/terms_page/terms_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/content/terms_page/terms_page.dart) | Formatted terms & conditions content viewer. |
| [`lib/presentation/ui/pages/dashboard/your_review_page/your_review_page.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/pages/dashboard/your_review_page/your_review_page.dart) | User reviews and ratings breakdown list. |
| [`lib/presentation/ui/widgets/account_information_page/personal_information_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/account_information_page/personal_information_card.dart) | Personal info input card. |
| [`lib/presentation/ui/widgets/account_information_page/profile_header_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/account_information_page/profile_header_card.dart) | Account info top card. |
| [`lib/presentation/ui/widgets/dashboard/club_point_page/club_points_header.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/club_point_page/club_points_header.dart) | Club point header banner card. |
| [`lib/presentation/ui/widgets/dashboard/club_point_page/point_history_item.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/club_point_page/point_history_item.dart) | History tile for points earned/redeemed. |
| [`lib/presentation/ui/widgets/dashboard/ticket_main_page/ticket_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/ticket_main_page/ticket_card.dart) | Support ticket item tile with priority tags. |
| [`lib/presentation/ui/widgets/dashboard/your_review_page/review_row_item.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/dashboard/your_review_page/review_row_item.dart) | Review item tile with star ratings. |
| [`lib/presentation/ui/widgets/knowledge_base_page/faq_design.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/knowledge_base_page/faq_design.dart) | FAQ question & answer expandable card. |
| [`lib/presentation/ui/widgets/order_list_page/order_item_card.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/order_list_page/order_item_card.dart) | Order card with thumbnail and tracking status. |
| [`lib/presentation/ui/widgets/product_detail_page/product_seller_info.dart`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/product_detail_page/product_seller_info.dart) | Seller trust rating card on PDP. |

---

## 🌟 Comprehensive Remarks & Architectural Recommendations

### 1. State Management & Data Caching
- **Recommendation**: Introduce a lightweight caching layer (e.g. `hydrated_bloc` or a time-expiring `Map<String, CacheEntry>`) for `SecondaryHomeWidget` so that when a user switches between categories, data loads instantaneously from memory without making duplicate HTTP calls for 5 minutes.

### 2. Micro-Interactions & Haptic Polish
- **Recommendation**: Add haptic feedback (`HapticFeedback.selectionClick()`) when switching category tabs in `HomeCategoryNav` and when selecting brand chips in `BrandFilterWidget`. This makes the navigation feel tactile and native.

### 3. Infinite Grid Masonry vs Fixed Aspect Ratio
- **Recommendation**: For `PagedSliverAlignedGrid` (used in `PrimaryHomeWidget` and `CategoryProductResults`), dynamic height rendering prevents overflow even if a product title is unusually long. We recommend keeping `PagedSliverAlignedGrid` as the default for all infinite catalog feeds.

### 4. Image Pre-caching
- **Recommendation**: Pre-cache the first 10 category icons during application initialization in `main_page.dart` using `precacheImage`. This guarantees 0ms icon pop-in when opening the homepage.
