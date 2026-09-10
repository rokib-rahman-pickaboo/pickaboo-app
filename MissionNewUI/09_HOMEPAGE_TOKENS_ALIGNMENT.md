# 📱 09: Homepage Tokens, Insertion Banners & View All Styling

## 📌 Summary of Updates

1. **🏷️ "View All >" Button Styling (Strictly Matched to New UI)**:
   - Updated across all category sliders, flash sale, deals grids, and category feeds:
     - **Text**: `"View All"` in bold Navy/Black (`NewAppColors.navy`, `12.sp`, `FontWeight.w700`).
     - **Arrow**: `">"` in Pickaboo Blue (`NewAppColors.pickabooBlue`, `Icon(Icons.chevron_right_rounded, size: 16.sp)`).
     - Applied to:
       - [`CategorySlider`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/category_slider.dart)
       - [`FlashSaleCategorySlider`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/flash_sale_category_slider.dart)
       - [`CategoryDealsGrid`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/category_deals_grid.dart)
       - [`HomepageOffersSection`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/homepage_offers_section.dart)
       - [`SecondaryHomeWidget`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/secondary_home_widget.dart)
       - [`CategoryList`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/category_list.dart)

2. **📏 Mid-Feed Insertion Banners Optimization**:
   - Standardized outer paddings to `AppSpacing.sameGroupItemSpacing` (`8.w` horizontal, `8.h` vertical).
   - Reduced default single banner height to **`120.h`** (with `naturalHeight: true`) instead of the previous oversized `160.h`/`200.h`.
   - Standardized multi-column square banners (3-column layout) to `(screenWidth - 2 * 8.w - 2 * 8.w) / 3` with `8.w` gaps, eliminating large blank boundaries.

3. **📦 Product Card & Slider Height**:
   - Proportional **`250.h`** horizontal `ListView.separated` across all category and flash sale rails.
   - Solid card geometry in [`SliderProductView`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/common/slider_product_view.dart) with `Expanded` details container.

---

## 🛡️ Verification
- **Code Health**: `flutter analyze` completed with **0 errors and 0 warnings**.
