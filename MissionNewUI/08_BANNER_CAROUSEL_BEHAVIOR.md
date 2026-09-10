# 📱 08: Big Banner Carousel Configuration & Behavior

## 📌 Implemented Behavior

1. **Component Core**:
   - Built on top of `CarouselSlider.builder` + `smooth_page_indicator` in [`BannerCarousel`](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/lib/presentation/ui/widgets/home_page/banner_carousel.dart).

2. **User Gestures**:
   - **Non-Swipeable**: Configured `scrollPhysics: const NeverScrollableScrollPhysics()`. User drag is disabled so movement is strictly controlled by the automated timer.

3. **Auto-Slide Timing**:
   - Rotates every **3.6s** (`autoPlayInterval: const Duration(milliseconds: 3600)`).
   - Smooth **400ms** transition duration (`autoPlayAnimationDuration: const Duration(milliseconds: 400)`).
   - **Easing Curve**: `Curves.easeInOutCubic`.

4. **Sizing & Aspect Ratio**:
   - Retains the native `height: 160.h`.

5. **Layout & Peek**:
   - `viewportFraction: 0.95`, `enlargeCenterPage: true` with `enlargeFactor: 0.15` for subtle side peek.

6. **Dots Indicator Design & Position**:
   - Design: Native `WormEffect` (`dotHeight: 3.h`, `dotWidth: 10.w`).
   - Position: Positioned **after the image** (outside the image container in a column below with `6.h` gap) matching `Pickaboo-App-UI` placement.

7. **Smart Indicator (Single Banner)**:
   - If `banners.length <= 1`, `autoPlay` is disabled and the dots indicator is **completely hidden**.

---

## 🛡️ Verification
- **Code Health**: `flutter analyze` completed with **0 errors and 0 warnings**.
