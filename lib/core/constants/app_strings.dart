/// ============================================================================
/// 📝 CENTRALIZED STATIC STRINGS & TEXT DICTIONARY FOR PICKABOO APP
/// All hardcoded and reused static strings across the app are defined here.
/// Modifying text here automatically updates it across the entire application.
/// ============================================================================
class AppStrings {
  AppStrings._();

  // ===========================================================================
  // ── 1. COMMON ACTIONS & BUTTON LABELS ─────────────────────────────────────
  // ===========================================================================
  static const String apply                 = 'Apply';
  static const String cancel                = 'Cancel';
  static const String continueText          = 'Continue';
  static const String saveChanges           = 'Save Changes';
  static const String remove                = 'Remove';
  static const String retry                 = 'Retry';
  static const String tryAgain              = 'Try Again';
  static const String goBack                = 'Go Back';
  static const String goHome                = 'Go Home';
  static const String viewAll               = 'View All';
  static const String viewMore              = 'View More';
  static const String viewLess              = 'View Less';
  static const String clearAll              = 'Clear All';
  static const String filter                = 'Filter';
  static const String searchHint            = 'Search in Pickaboo...';
  static const String learnMore             = 'Learn More';
  static const String notNow                = 'Not now';
  static const String openSettings          = 'Open Settings';

  // ===========================================================================
  // ── 2. BOTTOM NAVIGATION & ROOT TABS ──────────────────────────────────────
  // ===========================================================================
  static const String navHome               = 'Home';
  static const String navDiscover           = 'Discover';
  static const String navWishlist           = 'Wishlist';
  static const String navAccount            = 'Account';
  static const String navProfile            = 'Profile';
  static const String navSupport            = 'Support';
  static const String allCategories         = 'All Categories';
  static const String helpAndKnowledgeBase  = 'Help & Knowledge Base';
  static const String searchKnowledgeBaseHint = 'Search question';
  static const String appInformation        = 'App Information';
  static const String personalInformation   = 'Personal Information';
  static const String accountSecurity       = 'Account Security';
  static const String emailAddress          = 'Email Address';
  static const String mobileNumber          = 'Mobile Number';
  static const String gender                = 'Gender';
  static const String dateOfBirth           = 'Date of Birth';
  static const String notProvided           = 'Not provided';

  // ===========================================================================
  // ── 3. PRODUCT DETAIL PAGE (PDP) ──────────────────────────────────────────
  // ===========================================================================
  static const String pdpAvailableOffers    = 'Available Offers';
  static const String pdpPickabooAssured    = 'Pickaboo Assured';
  static const String pdpOutOfStock         = 'Out of Stock';
  static const String outOfStock            = pdpOutOfStock;
  static const String viewPrice             = 'View Price';
  static const String pdpStockOut           = 'Stock Out';
  static const String pdpSelectAllVariantOptions = 'Please select all variant options to proceed';
  static const String pdpDescription        = 'Description';
  static const String pdpAllReviews         = 'All Reviews';
  static const String pdpNoReviews          = 'No reviews yet';
  static const String pdpAddToCart          = 'Add to Cart';
  static const String pdpBuyNow             = 'Buy Now';
  static const String pdpFreeDelivery       = 'Free Delivery';

  // ===========================================================================
  // ── 4. CART & CHECKOUT ────────────────────────────────────────────────────
  // ===========================================================================
  static const String emptyCartTitle        = 'Your Cart is Empty';
  static const String emptyCartSubtitle     = 'Looks like you haven\'t added any items to your cart yet.';
  static const String clubPointsTitle       = 'Pickaboo Club';
  static const String confirmLocation       = 'Confirm Location';
  static const String addNewAddress         = 'Add New Address';
  static const String fullName              = 'Full Name';
  static const String paymentMethod         = 'Payment Method';
  static const String selectPaymentMethod   = 'Select Payment Method';
  static const String continueShopping      = 'Continue Shopping';

  // ===========================================================================
  // ── 5. FILTERS & SORTING ──────────────────────────────────────────────────
  // ===========================================================================
  static const String allBrands             = 'All Brands';
  static const String sortPriceLowToHigh    = 'Price: Low to High';
  static const String sortPriceHighToLow    = 'Price: High to Low';
  static const String sortNewestFirst       = 'Newest Arrivals';

  // ===========================================================================
  // ── 6. ACCOUNT & DASHBOARD ────────────────────────────────────────────────
  // ===========================================================================
  static const String dashboard             = 'Dashboard';
  static const String myOrders              = 'My Orders';
  static const String myOrdersSubtitle      = 'Track & view orders';
  static const String myWishlist            = 'My Wishlist';
  static const String supportTickets        = 'Support Tickets';
  static const String supportTicketsSubtitle= 'Get help & support';
  static const String pickabooClub          = 'Pickaboo Club';
  static const String clubPointsSubtitle    = 'Points & rewards';
  static const String pickabooClubSubtitle  = clubPointsSubtitle;
  static const String reviews               = 'Reviews';
  static const String reviewsSubtitle       = 'Ratings & feedback';
  static const String myReviews             = reviews;
  static const String myReviewsSubtitle     = reviewsSubtitle;
  static const String shareAndEarn          = 'Share & Earn';
  static const String shareAndEarnSubtitle  = 'Invite friends & earn reward points';
  static const String faqAndSupport         = 'FAQ & Support';
  static const String faqAndSupportSubtitle = 'Help center & frequent questions';
  static const String termsAndConditions    = 'Terms & Conditions';
  static const String termsAndConditionsSubtitle = 'Policies, terms & privacy statement';
  static const String accountInformation    = 'Account Information';
  static const String accountInformationSubtitle = 'Personal info & security details';
  static const String manageAddress         = 'Manage Address';
  static const String manageAddressSubtitle = 'Saved shipping & delivery addresses';
  static const String savedPaymentMethod    = 'Saved Payment Method';
  static const String savedPaymentMethodSubtitle = 'Credit cards & mobile wallets';
  static const String contactUs             = 'Contact Us';
  static const String contactUsSubtitle     = 'Reach Pickaboo customer support';
  static const String appSettings           = 'App Settings';
  static const String appSettingsSubtitle   = 'App preferences, language & notifications';
  static const String logout                = 'Log Out';
  static const String logoutSubtitle        = 'Sign out of your account';
  static const String loginOrRegisterTitle  = 'Login / Register';
  static const String loginOrRegisterSubtitle = 'Sign in to access your full profile & orders';
  static const String confirmLogout         = 'Confirm Logout';
  static const String logoutConfirmMessage  = 'Are you sure you want to log out of your account?';
  static const String logoutConfirmDetailedMessage =
      'Are you sure you want to log out of your Pickaboo account? You can log back in anytime.';
  static const String yesLogout             = 'Yes, Logout';
  static const String editAccountInformation= 'Edit Account Information';
  static const String editProfile           = 'Edit Profile';
  static const String cropPhoto             = 'Crop Photo';
  static const String changePhoneNumber     = 'Change Phone Number';
  static const String updatePhoneNumberSubtitle = 'Update your registered mobile number';
  static const String updateEmailSubtitle   = 'Update your registered email address';
  static const String updatePasswordSubtitle= 'Update your account login password';
  static const String savePassword          = 'Save Password';
  static const String enterNewPasswordHint  = 'Enter new password';
  static const String changePassword        = 'Change Password';
  static const String changeEmail           = 'Change Email';
  static const String createTicket          = 'Create New Ticket';
  static const String ticketDetails         = 'Ticket Details';
  static const String privacyPolicy         = 'Privacy Policy';
  static const String returnPolicy          = 'Return Policy';
  static const String notifications         = 'Notifications';
  static const String appVersion            = 'App Version';

  // ===========================================================================
  // ── 7. AUTHENTICATION & LOGIN ─────────────────────────────────────────────
  // ===========================================================================
  static const String login                 = 'Log In';
  static const String loginOrRegister       = 'LOGIN / REGISTER';
  static const String sendOtp               = 'Send OTP';
  static const String resendOtp             = 'Resend Code';

  // ===========================================================================
  // ── 8. SYSTEM FEEDBACK, SNACKBARS & ERRORS ────────────────────────────────
  // ===========================================================================
  static const String notice                = 'Notice';
  static const String success               = 'Success';
  static const String error                 = 'Error';
  static const String warning               = 'Warning';
  static const String pageNotFound          = 'Page Not Found';
  static const String somethingWentWrongTitle = 'Something Went Wrong';
  static const String somethingWentWrong    = 'Something went wrong. Please try again.';
  static const String noInternetConnection  = 'No internet connection. Please check your network.';
  static const String itemAddedToWishlist   = 'Item added to your wishlist';
  static const String operationSuccessful   = 'Operation completed successfully.';
  static const String selectDivisionCityArea = 'Please select division, city and area';
  static const String selectDivisionFirst   = 'Please select division first';
  static const String selectCityFirst       = 'Please select city first';
  static const String failedToSaveAddress   = 'Failed to save address';
  static const String enterSubject          = 'Please enter subject';
  static const String selectIssueType       = 'Please select issue type';
  static const String enterMessage          = 'Please enter message';
  static const String maxFilesAllowed       = 'Maximum 5 files allowed';
  static const String passwordRequirement   = 'Choose a strong password with at least 6 characters.';
  static const String enterCurrentPassword  = 'Enter current password';
  static const String enterConfirmPassword  = 'Enter confirm password';
  static const String passwordsDoNotMatch   = 'Passwords do not match';
  static const String passwordMinLength     = 'Password must be at least 6 characters';
  static const String pleaseEnterCurrentPassword = 'Please enter current password';
  static const String pleaseConfirmNewPassword   = 'Please confirm your new password';
  static const String couponAddedSuccessfully      = 'Coupon added successfully';
  static const String couponRemovedSuccessfully    = 'Coupon removed successfully';
  static const String pointAppliedSuccessfully     = 'Point applied successfully';
  static const String pointCanceledSuccessfully    = 'Point canceled successfully';
  static const String failedToUpdatePaymentMethod  = 'Failed to update payment method. Please try again.';
  static const String failedToConfirmOrder         = 'Failed to confirm order. Please try again.';
  static const String pleaseSelectBank             = 'Please select bank';
  static const String pleaseSelectTenure           = 'Please select tenure';

  static const String loggedOutSuccess      = 'Logged out successfully';
  static const String removeAddress         = 'Remove Address';
  static const String removeAddressConfirm  = 'Are you sure you want to remove this address?';
  static const String couldNotLoadOrderNumber = "We couldn't load your order number right now.";
  static const String yourOrderNumberIs     = 'Your order number is: ';
  static const String forgotPasswordPrompt  = 'Forgot password?';
  static const String forgotYourPasswordPrompt = 'Forgot Your Password?';
  static const String justForYou             = 'JUST FOR YOU';

  // ===========================================================================
  // ── 9. DYNAMIC FORMATTERS / TEMPLATING HELPERS ────────────────────────────
  // ===========================================================================
  static String currency(dynamic amount) => '৳$amount';
  static String itemsCount(int count) => count == 1 ? '1 Item' : '$count Items';
  static String soldCount(dynamic count) => '$count+ sold';
  static String discountTag(dynamic percent) => '-$percent%';
  static String ratingCount(dynamic count) => '($count)';
  static String reviewsCount(dynamic count) => '$count Reviews';
  static String pointsBalance(dynamic points) => '$points Points';
  static String orderId(dynamic id) => 'Order #$id';
  static String resendOtpCountdown(String countdown) => 'Resend OTP in $countdown';
}
