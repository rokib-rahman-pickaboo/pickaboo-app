// ============================================================================
// 🎨 CENTRALIZED APP ASSETS CATALOG
// All static asset file paths across the app must be referenced from [AppAssets].
// No raw string paths allowed in UI components.
// ============================================================================

class AppAssets {
  AppAssets._();

  // ── Navigation & Bar Icons ──
  static const String navHome = 'assets/new/svg/home_icon.svg';
  static const String navDiscover = 'assets/new/svg/discover_icon.svg';
  static const String navSupport = 'assets/new/svg/support_icon.svg';
  static const String navProfile = 'assets/new/svg/profile_icon.svg';
  static const String navBack = 'assets/new/svg/back_nav_icon.svg';
  static const String navForward = 'assets/new/svg/forward_icon.svg';
  static const String navDrawer = 'assets/new/svg/drawer_icon.svg';
  static const String navCart = 'assets/new/svg/cart_icon.svg';
  static const String navSearch = 'assets/new/svg/search_icon.svg';
  static const String navClose = 'assets/new/svg/close_icon.svg';
  static const String navFilter = 'assets/new/svg/filter_icon.svg';
  static const String navSort = 'assets/new/svg/short_icon.svg';
  static const String navGrid = 'assets/new/svg/grid_icon.svg';
  static const String navList = 'assets/new/svg/list_icon.svg';

  // ── Brand & Logos ──
  static const String logoNew = 'assets/images/pickaboo_new_logo.png';
  static const String logoLogin = 'assets/images/pickaboo-login-logo.png';
  static const String logoMascot = 'assets/new/svg/pickaboo_icon.svg';
  static const String splashGif = 'assets/gif/splash-image.gif';
  static const String splashSmall = 'assets/new/svg/pickaboo_splash_sm.png';
  static const String splashAndroid12 = 'assets/new/svg/pickaboo_splash_android12.png';
  static const String splashFull = 'assets/new/svg/pickaboo_splash.png';

  // ── Social Auth Icons ──
  static const String google = 'assets/new/svg/google_icon.svg';
  static const String facebook = 'assets/new/svg/facebook_icon.svg';
  static const String apple = 'assets/new/svg/apple_icon.svg';

  // ── Payment Methods ──
  static const String bkash = 'assets/new/svg/payment/bkash_icon.svg';
  static const String nagad = 'assets/new/svg/payment/nagad_icon.svg';
  static const String amex = 'assets/new/svg/payment/amex_icon.svg';
  static const String visaMastercard = 'assets/new/svg/payment/visa_mastercard_icon.svg';
  static const String pickabooMastercard = 'assets/new/svg/payment/pickaboo_mastercard_icon.svg';
  static const String cashOnDelivery = 'assets/new/svg/payment/cash_on_delivery_icon.svg';
  static const String emiPayment = 'assets/new/svg/payment/emi_icon.svg';
  static const String emi = 'assets/new/svg/emi_icon.svg';
  static const String pdpEmi = 'assets/new/svg/emi.svg';

  // ── Product Details & Specifications ──
  static const String detailAnswer = 'assets/new/svg/detail/answer_icon.svg';
  static const String detailAssured = 'assets/new/svg/detail/assured_icon.svg';
  static const String detailBrand = 'assets/new/svg/detail/brand_icon.svg';
  static const String detailClubPoint = 'assets/new/svg/detail/club_point_icon.svg';
  static const String detailDelivery = 'assets/new/svg/detail/delivery_icon.svg';
  static const String detailDimensions = 'assets/new/svg/detail/dimensions_icon.svg';
  static const String detailDoor = 'assets/new/svg/detail/door_icon.svg';
  static const String detailEmi = 'assets/new/svg/detail/emi_icon.svg';
  static const String detailExpressDelivery = 'assets/new/svg/detail/express_delivery_icon.svg';
  static const String detailFreezer = 'assets/new/svg/detail/freezer_icon.svg';
  static const String detailMinus = 'assets/new/svg/detail/minus_icon.svg';
  static const String detailOffer = 'assets/new/svg/detail/offer_icon.svg';
  static const String detailProtection = 'assets/new/svg/detail/pickaboo_protection_icon.svg';
  static const String detailPlus = 'assets/new/svg/detail/plus_icon.svg';
  static const String detailQuestion = 'assets/new/svg/detail/question_icon.svg';
  static const String detailRefrigerator = 'assets/new/svg/detail/refrigerator_icon.svg';
  static const String detailReviewAvatar = 'assets/new/svg/detail/review_avatar_icon.svg';
  static const String detailThumbDown = 'assets/new/svg/detail/thum_down.svg';
  static const String detailThumbUp = 'assets/new/svg/detail/thum_up_icon.svg';
  static const String detailVolume = 'assets/new/svg/detail/volume_icon.svg';

  // ── Common Product & Badges ──
  static const String express = 'assets/new/svg/express_icon.svg';
  static const String expressPdp = 'assets/new/svg/express_icon_pdp.svg';
  static const String expressSmallPng = 'assets/new/express_small.png';
  static const String star = 'assets/new/svg/star_icon.svg';
  static const String compare = 'assets/new/svg/compare_icon.svg';
  static const String compared = 'assets/new/svg/compared_icon.svg';
  static const String favorite = 'assets/new/svg/favorite_icon.svg';
  static const String favorited = 'assets/new/svg/favorited_icon.svg';
  static const String location = 'assets/new/svg/location_icon.svg';
  static const String offerTag = 'assets/new/svg/offer_tag_icon.svg';
  static const String token = 'assets/new/svg/token_icon.svg';
  static const String linkShare = 'assets/new/svg/link_share_icon.svg';
  static const String camera = 'assets/new/svg/camera_icon.svg';
  static const String question = 'assets/new/svg/question_icon.svg';

  // ── Empty Views & States ──
  static const String emptyCart = 'assets/new/svg/empty_cart_icon.svg';
  static const String emptyReview = 'assets/new/svg/empty_review_icon.svg';
  static const String successCart = 'assets/images/success_cart.png';
  static const String closeCircle = 'assets/images/ic-close-2.png';
  static const String cartPng = 'assets/images/cart.png';
  static const String officialWarranty = 'assets/images/official_warranty_badge.png';
  static const String warranty = 'assets/images/warranty.png';

  // ── Trust & Peace of Mind ──
  static const String trustShield = 'assets/new/svg/warranty.svg';
  static const String trustAuthentic = 'assets/new/svg/authentic.svg';
  static const String trustDelivery = 'assets/new/svg/fast_delivery.svg';
  static const String trustReturn = 'assets/new/svg/easy_return.svg';
  static const String pickabooAssured = 'assets/new/svg/pickaboo_assured.svg';
  static const String fastDelivery = 'assets/new/svg/fast_delivery.svg';
  static const String authentic = 'assets/new/svg/authentic.svg';
  static const String easyReturn = 'assets/new/svg/easy_return.svg';
  static const String warrantySvg = 'assets/new/svg/warranty.svg';

  // ── Special & Demo ──
  static const String timerBannerDemo = 'assets/new/demo/timer_banner_demo.png';
  static const String specialTimerBackground = 'assets/new/special_timer_background.png';
}
