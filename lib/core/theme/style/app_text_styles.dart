import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_text_styles.freezed.dart';

@Freezed(copyWith: false)
class AppTextStyles
    with _$AppTextStyles
    implements ThemeExtension<AppTextStyles> {
  const factory AppTextStyles({
    required TextStyle robotoBlack,
    required TextStyle robotoBold,
    required TextStyle robotoMedium,
    required TextStyle robotoRegular,
    required TextStyle robotoLight,
    required TextStyle robotoThin,

    required TextStyle displayLarge,
    required TextStyle displayMedium,
    required TextStyle headingLarge,
    required TextStyle headingMedium,
    required TextStyle headingSmall,
    required TextStyle subheading,
    required TextStyle bodyLarge,
    required TextStyle bodyMedium,
    required TextStyle bodySmall,
    required TextStyle bodyTiny,
    required TextStyle bodyMicro,

    required TextStyle bodyLargeBold,
    required TextStyle bodyMediumBold,
    required TextStyle bodySmallBold,

    required TextStyle bodyLargeMedium,
    required TextStyle bodyMediumMedium,
    required TextStyle bodySmallMedium,
    required TextStyle appBarTitle,
    required TextStyle appBarSubtitle,
    required TextStyle appBarAction,
    required TextStyle bottomNavActive,
    required TextStyle bottomNavInactive,
    required TextStyle drawerItem,
    required TextStyle drawerHeader,
    required TextStyle buttonLarge,
    required TextStyle buttonMedium,
    required TextStyle buttonSmall,
    required TextStyle buttonText,
    required TextStyle buttonLink,
    required TextStyle inputLabel,
    required TextStyle inputText,
    required TextStyle inputPlaceholder,
    required TextStyle inputHelper,
    required TextStyle inputError,
    required TextStyle productName,
    required TextStyle productNameLarge,
    required TextStyle productPrice,
    required TextStyle productPriceLarge,
    required TextStyle productPriceStrike,
    required TextStyle productDiscount,
    required TextStyle productDescription,
    required TextStyle productBrand,
    required TextStyle listTitle,
    required TextStyle listSubtitle,
    required TextStyle listCaption,
    required TextStyle cardTitle,
    required TextStyle cardSubtitle,
    required TextStyle cardBody,
    required TextStyle badgeLarge,
    required TextStyle badgeSmall,
    required TextStyle statusActive,
    required TextStyle statusInactive,
    required TextStyle tag,
    required TextStyle cartItemName,
    required TextStyle cartItemPrice,
    required TextStyle cartSubtotal,
    required TextStyle cartTotal,
    required TextStyle shippingLabel,
    required TextStyle shippingValue,
    required TextStyle profileName,
    required TextStyle profileEmail,
    required TextStyle profileLabel,
    required TextStyle profileValue,
    required TextStyle menuItem,
    required TextStyle menuLabel,
    required TextStyle orderNumber,
    required TextStyle orderDate,
    required TextStyle orderStatus,
    required TextStyle orderTotal,
    required TextStyle orderItemName,
    required TextStyle orderItemQty,
    required TextStyle reviewAuthor,
    required TextStyle reviewDate,
    required TextStyle reviewText,
    required TextStyle ratingValue,
    required TextStyle ratingCount,
    required TextStyle modalTitle,
    required TextStyle modalBody,
    required TextStyle modalAction,
    required TextStyle dialogTitle,
    required TextStyle dialogMessage,
    required TextStyle timerLarge,
    required TextStyle timerSmall,
    required TextStyle offerBadge,
    required TextStyle priceStrikethrough,
    required TextStyle link,
    required TextStyle linkSmall,
    required TextStyle caption,
    required TextStyle overline,
  }) = _AppTextStyles;

  const AppTextStyles._();

  factory AppTextStyles.build(Brightness b) =>
      b == Brightness.dark ? _dark : _light;

  static final _light = _create(Brightness.light);
  static final _dark = _create(Brightness.dark);

  static AppTextStyles _create(Brightness b) {
    // `.sp` returns 0 when ScreenUtil is initialised against a 0x0 window
    // (Android reports that for the first frame). A zero fontSize trips
    // `StrutStyle.fromTextStyle`'s `fontSize > 0` assertion inside every
    // EditableText, so never let one through — MyApp also withholds the first
    // frame until the window has a real size, this is the belt-and-braces half.
    TextStyle roboto(double size, FontWeight weight, {bool italic = false}) =>
        GoogleFonts.roboto(
          fontSize: size > 0 ? size : 14,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        );

    TextStyle rb(double size, FontWeight weight) => roboto(size, weight);

    return AppTextStyles(
      robotoBlack: rb(14.sp, FontWeight.w900),
      robotoBold: rb(14.sp, FontWeight.w700),
      robotoMedium: rb(14.sp, FontWeight.w500),
      robotoRegular: rb(14.sp, FontWeight.w400),
      robotoLight: rb(14.sp, FontWeight.w300),
      robotoThin: rb(14.sp, FontWeight.w100),

      displayLarge: rb(20.sp, FontWeight.w400),
      displayMedium: rb(18.sp, FontWeight.w400),
      headingLarge: rb(20.sp, FontWeight.w700),
      headingMedium: rb(18.sp, FontWeight.w700),
      headingSmall: rb(16.sp, FontWeight.w700),
      subheading: rb(16.sp, FontWeight.w600),

      bodyLarge: rb(16.sp, FontWeight.w400),
      bodyMedium: rb(14.sp, FontWeight.w400),
      bodySmall: rb(12.sp, FontWeight.w400),
      bodyTiny: rb(10.sp, FontWeight.w400),
      bodyMicro: rb(8.sp, FontWeight.w400),

      bodyLargeBold: rb(16.sp, FontWeight.w700),
      bodyMediumBold: rb(14.sp, FontWeight.w700),
      bodySmallBold: rb(12.sp, FontWeight.w700),

      bodyLargeMedium: rb(16.sp, FontWeight.w500),
      bodyMediumMedium: rb(14.sp, FontWeight.w500),
      bodySmallMedium: rb(12.sp, FontWeight.w500),

      appBarTitle: rb(14.sp, FontWeight.w700),
      appBarSubtitle: rb(16.sp, FontWeight.w500),
      appBarAction: rb(14.sp, FontWeight.w500),

      bottomNavActive: rb(12.sp, FontWeight.w500),
      bottomNavInactive: rb(12.sp, FontWeight.w400),
      drawerItem: rb(14.sp, FontWeight.w500),
      drawerHeader: rb(18.sp, FontWeight.w700),

      buttonLarge: rb(16.sp, FontWeight.w700),
      buttonMedium: rb(14.sp, FontWeight.w700),
      buttonSmall: rb(12.sp, FontWeight.w700),
      buttonText: rb(14.sp, FontWeight.w500),
      buttonLink: rb(14.sp, FontWeight.w500),

      inputLabel: rb(14.sp, FontWeight.w500),
      inputText: rb(14.sp, FontWeight.w400),
      inputPlaceholder: rb(14.sp, FontWeight.w400),
      inputHelper: rb(12.sp, FontWeight.w400),
      inputError: rb(12.sp, FontWeight.w400),

      productName: rb(12.sp, FontWeight.w400),
      productNameLarge: rb(16.sp, FontWeight.w500),
      productPrice: rb(13.sp, FontWeight.w700),
      productPriceLarge: rb(20.sp, FontWeight.w700),
      productPriceStrike: rb(
        12.sp,
        FontWeight.w400,
      ).copyWith(decoration: TextDecoration.lineThrough),
      productDiscount: rb(10.sp, FontWeight.w700),
      productDescription: rb(13.sp, FontWeight.w400),
      productBrand: rb(12.sp, FontWeight.w400),

      listTitle: rb(16.sp, FontWeight.w500),
      listSubtitle: rb(12.sp, FontWeight.w400),
      listCaption: rb(12.sp, FontWeight.w400),
      cardTitle: rb(16.sp, FontWeight.w700),
      cardSubtitle: rb(14.sp, FontWeight.w500),
      cardBody: rb(14.sp, FontWeight.w400),

      badgeLarge: rb(12.sp, FontWeight.w700),
      badgeSmall: rb(10.sp, FontWeight.w700),
      statusActive: rb(12.sp, FontWeight.w500),
      statusInactive: rb(12.sp, FontWeight.w400),
      tag: rb(10.sp, FontWeight.w500),

      cartItemName: rb(13.sp, FontWeight.w500),
      cartItemPrice: rb(15.sp, FontWeight.w700),
      cartSubtotal: rb(14.sp, FontWeight.w500),
      cartTotal: rb(18.sp, FontWeight.w700),
      shippingLabel: rb(14.sp, FontWeight.w500),
      shippingValue: rb(14.sp, FontWeight.w400),

      profileName: rb(16.sp, FontWeight.w700),
      profileEmail: rb(14.sp, FontWeight.w400),
      profileLabel: rb(12.sp, FontWeight.w500),
      profileValue: rb(14.sp, FontWeight.w400),
      menuItem: rb(14.sp, FontWeight.w500),
      menuLabel: rb(12.sp, FontWeight.w400),

      orderNumber: rb(16.sp, FontWeight.w700),
      orderDate: rb(12.sp, FontWeight.w400),
      orderStatus: rb(14.sp, FontWeight.w500),
      orderTotal: rb(18.sp, FontWeight.w700),
      orderItemName: rb(14.sp, FontWeight.w400),
      orderItemQty: rb(12.sp, FontWeight.w400),

      reviewAuthor: rb(14.sp, FontWeight.w500),
      reviewDate: rb(10.sp, FontWeight.w400),
      reviewText: rb(14.sp, FontWeight.w400),
      ratingValue: rb(16.sp, FontWeight.w700),
      ratingCount: rb(12.sp, FontWeight.w400),

      modalTitle: rb(18.sp, FontWeight.w700),
      modalBody: rb(14.sp, FontWeight.w400),
      modalAction: rb(16.sp, FontWeight.w500),
      dialogTitle: rb(16.sp, FontWeight.w500),
      dialogMessage: rb(14.sp, FontWeight.w400),

      timerLarge: rb(24.sp, FontWeight.w700),
      timerSmall: rb(16.sp, FontWeight.w700),
      offerBadge: rb(12.sp, FontWeight.w700),
      priceStrikethrough: rb(
        14.sp,
        FontWeight.w400,
      ).copyWith(decoration: TextDecoration.lineThrough),
      link: rb(14.sp, FontWeight.w500),
      linkSmall: rb(12.sp, FontWeight.w400),
      caption: rb(10.sp, FontWeight.w400),
      overline: rb(10.sp, FontWeight.w500).copyWith(letterSpacing: 1.5),
    );
  }

  @override
  Type get type => AppTextStyles;

  @override
  AppTextStyles copyWith({
    TextStyle? robotoBlack,
    TextStyle? robotoBold,
    TextStyle? robotoMedium,
    TextStyle? robotoRegular,
    TextStyle? robotoLight,
    TextStyle? robotoThin,
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? headingSmall,
    TextStyle? subheading,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? bodyTiny,
    TextStyle? bodyMicro,
    TextStyle? bodyLargeBold,
    TextStyle? bodyMediumBold,
    TextStyle? bodySmallBold,
    TextStyle? bodyLargeMedium,
    TextStyle? bodyMediumMedium,
    TextStyle? bodySmallMedium,
    TextStyle? appBarTitle,
    TextStyle? appBarSubtitle,
    TextStyle? appBarAction,
    TextStyle? bottomNavActive,
    TextStyle? bottomNavInactive,
    TextStyle? drawerItem,
    TextStyle? drawerHeader,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
    TextStyle? buttonText,
    TextStyle? buttonLink,
    TextStyle? inputLabel,
    TextStyle? inputText,
    TextStyle? inputPlaceholder,
    TextStyle? inputHelper,
    TextStyle? inputError,
    TextStyle? productName,
    TextStyle? productNameLarge,
    TextStyle? productPrice,
    TextStyle? productPriceLarge,
    TextStyle? productPriceStrike,
    TextStyle? productDiscount,
    TextStyle? productDescription,
    TextStyle? productBrand,
    TextStyle? listTitle,
    TextStyle? listSubtitle,
    TextStyle? listCaption,
    TextStyle? cardTitle,
    TextStyle? cardSubtitle,
    TextStyle? cardBody,
    TextStyle? badgeLarge,
    TextStyle? badgeSmall,
    TextStyle? statusActive,
    TextStyle? statusInactive,
    TextStyle? tag,
    TextStyle? cartItemName,
    TextStyle? cartItemPrice,
    TextStyle? cartSubtotal,
    TextStyle? cartTotal,
    TextStyle? shippingLabel,
    TextStyle? shippingValue,
    TextStyle? profileName,
    TextStyle? profileEmail,
    TextStyle? profileLabel,
    TextStyle? profileValue,
    TextStyle? menuItem,
    TextStyle? menuLabel,
    TextStyle? orderNumber,
    TextStyle? orderDate,
    TextStyle? orderStatus,
    TextStyle? orderTotal,
    TextStyle? orderItemName,
    TextStyle? orderItemQty,
    TextStyle? reviewAuthor,
    TextStyle? reviewDate,
    TextStyle? reviewText,
    TextStyle? ratingValue,
    TextStyle? ratingCount,
    TextStyle? modalTitle,
    TextStyle? modalBody,
    TextStyle? modalAction,
    TextStyle? dialogTitle,
    TextStyle? dialogMessage,
    TextStyle? timerLarge,
    TextStyle? timerSmall,
    TextStyle? offerBadge,
    TextStyle? priceStrikethrough,
    TextStyle? link,
    TextStyle? linkSmall,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return AppTextStyles(
      robotoBlack: robotoBlack ?? this.robotoBlack,
      robotoBold: robotoBold ?? this.robotoBold,
      robotoMedium: robotoMedium ?? this.robotoMedium,
      robotoRegular: robotoRegular ?? this.robotoRegular,
      robotoLight: robotoLight ?? this.robotoLight,
      robotoThin: robotoThin ?? this.robotoThin,
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      headingSmall: headingSmall ?? this.headingSmall,
      subheading: subheading ?? this.subheading,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      bodyTiny: bodyTiny ?? this.bodyTiny,
      bodyMicro: bodyMicro ?? this.bodyMicro,
      bodyLargeBold: bodyLargeBold ?? this.bodyLargeBold,
      bodyMediumBold: bodyMediumBold ?? this.bodyMediumBold,
      bodySmallBold: bodySmallBold ?? this.bodySmallBold,
      bodyLargeMedium: bodyLargeMedium ?? this.bodyLargeMedium,
      bodyMediumMedium: bodyMediumMedium ?? this.bodyMediumMedium,
      bodySmallMedium: bodySmallMedium ?? this.bodySmallMedium,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      appBarSubtitle: appBarSubtitle ?? this.appBarSubtitle,
      appBarAction: appBarAction ?? this.appBarAction,
      bottomNavActive: bottomNavActive ?? this.bottomNavActive,
      bottomNavInactive: bottomNavInactive ?? this.bottomNavInactive,
      drawerItem: drawerItem ?? this.drawerItem,
      drawerHeader: drawerHeader ?? this.drawerHeader,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      buttonText: buttonText ?? this.buttonText,
      buttonLink: buttonLink ?? this.buttonLink,
      inputLabel: inputLabel ?? this.inputLabel,
      inputText: inputText ?? this.inputText,
      inputPlaceholder: inputPlaceholder ?? this.inputPlaceholder,
      inputHelper: inputHelper ?? this.inputHelper,
      inputError: inputError ?? this.inputError,
      productName: productName ?? this.productName,
      productNameLarge: productNameLarge ?? this.productNameLarge,
      productPrice: productPrice ?? this.productPrice,
      productPriceLarge: productPriceLarge ?? this.productPriceLarge,
      productPriceStrike: productPriceStrike ?? this.productPriceStrike,
      productDiscount: productDiscount ?? this.productDiscount,
      productDescription: productDescription ?? this.productDescription,
      productBrand: productBrand ?? this.productBrand,
      listTitle: listTitle ?? this.listTitle,
      listSubtitle: listSubtitle ?? this.listSubtitle,
      listCaption: listCaption ?? this.listCaption,
      cardTitle: cardTitle ?? this.cardTitle,
      cardSubtitle: cardSubtitle ?? this.cardSubtitle,
      cardBody: cardBody ?? this.cardBody,
      badgeLarge: badgeLarge ?? this.badgeLarge,
      badgeSmall: badgeSmall ?? this.badgeSmall,
      statusActive: statusActive ?? this.statusActive,
      statusInactive: statusInactive ?? this.statusInactive,
      tag: tag ?? this.tag,
      cartItemName: cartItemName ?? this.cartItemName,
      cartItemPrice: cartItemPrice ?? this.cartItemPrice,
      cartSubtotal: cartSubtotal ?? this.cartSubtotal,
      cartTotal: cartTotal ?? this.cartTotal,
      shippingLabel: shippingLabel ?? this.shippingLabel,
      shippingValue: shippingValue ?? this.shippingValue,
      profileName: profileName ?? this.profileName,
      profileEmail: profileEmail ?? this.profileEmail,
      profileLabel: profileLabel ?? this.profileLabel,
      profileValue: profileValue ?? this.profileValue,
      menuItem: menuItem ?? this.menuItem,
      menuLabel: menuLabel ?? this.menuLabel,
      orderNumber: orderNumber ?? this.orderNumber,
      orderDate: orderDate ?? this.orderDate,
      orderStatus: orderStatus ?? this.orderStatus,
      orderTotal: orderTotal ?? this.orderTotal,
      orderItemName: orderItemName ?? this.orderItemName,
      orderItemQty: orderItemQty ?? this.orderItemQty,
      reviewAuthor: reviewAuthor ?? this.reviewAuthor,
      reviewDate: reviewDate ?? this.reviewDate,
      reviewText: reviewText ?? this.reviewText,
      ratingValue: ratingValue ?? this.ratingValue,
      ratingCount: ratingCount ?? this.ratingCount,
      modalTitle: modalTitle ?? this.modalTitle,
      modalBody: modalBody ?? this.modalBody,
      modalAction: modalAction ?? this.modalAction,
      dialogTitle: dialogTitle ?? this.dialogTitle,
      dialogMessage: dialogMessage ?? this.dialogMessage,
      timerLarge: timerLarge ?? this.timerLarge,
      timerSmall: timerSmall ?? this.timerSmall,
      offerBadge: offerBadge ?? this.offerBadge,
      priceStrikethrough: priceStrikethrough ?? this.priceStrikethrough,
      link: link ?? this.link,
      linkSmall: linkSmall ?? this.linkSmall,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  @override
  AppTextStyles lerp(covariant AppTextStyles? other, double t) => this;
}

extension AppTextDecorators on TextStyle {
  TextStyle underline([Color? color]) => copyWith(
    decoration: TextDecoration.underline,
    decorationColor: color ?? this.color,
  );

  TextStyle lineThrough([Color? color]) => copyWith(
    decoration: TextDecoration.lineThrough,
    decorationColor: color ?? this.color,
  );

  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withHeight(double height) => copyWith(height: height);

  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
}

extension AppTextStylesContextX on BuildContext {
  AppTextStyles get textStyle {
    final theme = Theme.of(this);
    final ext = theme.extension<AppTextStyles>();
    if (ext != null) return ext;
    assert(() {
      debugPrint(
        '[AppTextStyles] Missing ThemeExtension<AppTextStyles> in ThemeData.extensions; using fallback.',
      );
      return true;
    }());
    return AppTextStyles.build(theme.brightness);
  }
}
