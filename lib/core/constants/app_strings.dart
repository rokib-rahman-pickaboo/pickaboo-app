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
  static const String applyNow              = 'Apply Now';
  static const String cancel                = 'Cancel';
  static const String done                  = 'Done';
  static const String confirm               = 'Confirm';
  static const String continueText          = 'Continue';
  static const String save                  = 'Save';
  static const String saveChanges           = 'Save Changes';
  static const String edit                  = 'Edit';
  static const String delete                = 'Delete';
  static const String remove                = 'Remove';
  static const String close                 = 'Close';
  static const String back                  = 'Back';
  static const String retry                 = 'Retry';
  static const String tryAgain              = 'Try Again';
  static const String goBack                = 'Go Back';
  static const String goHome                = 'Go Home';
  static const String viewAll               = 'View All';
  static const String seeAll                = 'See All';
  static const String seeMore               = 'See More';
  static const String seeLess               = 'See Less';
  static const String viewMore              = 'View More';
  static const String viewLess              = 'View Less';
  static const String showMore              = 'Show More';
  static const String showLess              = 'Show Less';
  static const String clear                 = 'Clear';
  static const String clearAll              = 'Clear All';
  static const String clearFilter           = 'Clear Filter';
  static const String reset                 = 'Reset';
  static const String filter                = 'Filter';
  static const String sort                  = 'Sort';
  static const String sortBy                = 'Sort By';
  static const String search                = 'Search';
  static const String searchHint            = 'Search in Pickaboo...';
  static const String copy                  = 'Copy';
  static const String copied                = 'Copied';
  static const String share                 = 'Share';
  static const String submit                = 'Submit';
  static const String learnMore             = 'Learn More';
  static const String ok                    = 'OK';
  static const String yes                   = 'Yes';
  static const String no                    = 'No';
  static const String notNow                = 'Not now';
  static const String openSettings          = 'Open Settings';

  // ===========================================================================
  // ── 2. BOTTOM NAVIGATION & ROOT TABS ──────────────────────────────────────
  // ===========================================================================
  static const String navHome               = 'Home';
  static const String navDiscover           = 'Discover';
  static const String navCategory           = 'Category';
  static const String navCategories         = 'Categories';
  static const String navCart               = 'Cart';
  static const String navWishlist           = 'Wishlist';
  static const String navAccount            = 'Account';
  static const String navProfile            = 'Profile';
  static const String navSupport            = 'Support';
  static const String navOffers             = 'Offers';
  static const String navMore               = 'More';
  static const String allCategories         = 'All Categories';
  static const String helpAndKnowledgeBase  = 'Help & Knowledge Base';
  static const String searchKnowledgeBaseHint = 'Search question';
  static const String directChannels        = 'Direct Channels';
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
  static const String pdpEmiAvailable       = 'EMI Available';
  static const String pdpEmiStartingFrom    = 'EMI starting from';
  static const String pdpViewEmiPlans       = 'View Plans';
  static const String pdpPickabooAssured    = 'Pickaboo Assured';
  static const String pdpOfficialWarranty   = '100% Official Warranty';
  static const String pdpBrandWarranty      = 'Brand Warranty';
  static const String pdpFastDelivery       = 'Super Fast Delivery';
  static const String pdpStandardDelivery   = 'Standard Delivery';
  static const String pdpSevenDaysReturn    = '7 Days Replacement Warranty';
  static const String pdpProtectionPlan     = 'Pickaboo Care Protection Plan';
  static const String pdpAddProtectionPlan  = 'Add Protection Plan';
  static const String pdpInStock            = 'In Stock';
  static const String pdpOutOfStock         = 'Out of Stock';
  static const String outOfStock            = pdpOutOfStock;
  static const String viewPrice             = 'View Price';
  static const String pdpSoldOut            = 'Sold Out';
  static const String pdpStockOut           = 'Stock Out';
  static const String pdpQuantity           = 'Quantity';
  static const String pdpSelectVariant      = 'Select Variant';
  static const String pdpSelectAllVariantOptions = 'Please select all variant options to proceed';
  static const String pdpProductDetails     = 'Product Details';
  static const String pdpSpecifications     = 'Specifications';
  static const String pdpViewAllSpecifications = 'View All Specification';
  static const String pdpDescription        = 'Description';
  static const String pdpViewFullDescription = 'View Full Description';
  static const String pdpCustomerReviews    = 'Customer Reviews';
  static const String pdpRatingsAndReviews  = 'Ratings & Reviews';
  static const String pdpVerifiedBuyer      = 'Verified Buyer';
  static const String pdpWriteReview        = 'Write a Review';
  static const String pdpAllReviews         = 'All Reviews';
  static const String pdpNoReviews          = 'No reviews yet';
  static const String pdpQuestionsAndAnswers= 'Questions & Answers';
  static const String pdpViewAllQuestionsAndAnswers = 'View All Questions and Answers';
  static const String pdpAskQuestion        = 'Ask a Question';
  static const String pdpFrequentlyBought   = 'Frequently Bought Together';
  static const String pdpSimilarProducts    = 'Similar Products';
  static const String pdpYouMayAlsoLike     = 'You May Also Like';
  static const String pdpCompareProducts    = 'Compare Products';
  static const String pdpAddToCart          = 'Add to Cart';
  static const String pdpBuyNow             = 'Buy Now';
  static const String pdpDeliverTo          = 'Deliver to';
  static const String pdpChangeLocation     = 'Change';
  static const String pdpDeliveryTimeEst    = 'Estimated Delivery';
  static const String pdpEstimatedDays      = '2-3 Business Days';
  static const String pdpCashOnDelivery     = 'Cash on Delivery Available';
  static const String pdpFreeDelivery       = 'Free Delivery';
  static const String pdpFlashSale          = 'Flash Sale';
  static const String pdpEndsIn             = 'Ends in';
  static const String pdpHours              = 'h';
  static const String pdpMinutes            = 'm';
  static const String pdpSeconds            = 's';
  static const String pdpSoldSuffix         = 'sold';
  static const String pdpSkuPrefix          = 'SKU:';
  static const String pdpBrandPrefix        = 'Brand:';

  // ===========================================================================
  // ── 4. CART & CHECKOUT ────────────────────────────────────────────────────
  // ===========================================================================
  static const String cartTitle             = 'My Cart';
  static const String shoppingCart          = 'Shopping Cart';
  static const String emptyCartTitle        = 'Your Cart is Empty';
  static const String emptyCartSubtitle     = 'Looks like you haven\'t added any items to your cart yet.';
  static const String startShopping         = 'Start Shopping';
  static const String proceedToCheckout     = 'Proceed to Checkout';
  static const String orderSummary          = 'Order Summary';
  static const String subtotal              = 'Subtotal';
  static const String deliveryCharge        = 'Delivery Charge';
  static const String shippingAndHandling   = 'Shipping and Handeling';
  static const String discount              = 'Discount';
  static const String couponDiscount        = 'Coupon Discount';
  static const String clubPointsDiscount    = 'Club Points Discount';
  static const String totalAmount           = 'Total Amount';
  static const String grandTotal            = 'Grand Total';
  static const String payableAmount         = 'Payable Amount';
  static const String vatInclusive          = 'VAT Inclusive';
  static const String applyCoupon           = 'Apply Coupon';
  static const String enterCouponCode       = 'Enter Coupon Code';
  static const String couponApplied         = 'Coupon Applied Successfully';
  static const String removeCoupon          = 'Remove';
  static const String clubPointsTitle       = 'Pickaboo Club';
  static const String useClubPoints         = 'Use Club Points';
  static const String enterPointsToRedeem   = 'Enter points to redeem';
  static const String availablePoints       = 'Available Points:';
  static const String shippingAddress       = 'Shipping Address';
  static const String selectAddress         = 'Select Delivery Address';
  static const String confirmLocation       = 'Confirm Location';
  static const String addNewAddress         = 'Add New Address';
  static const String editAddress           = 'Edit Address';
  static const String defaultAddress        = 'Default';
  static const String makeDefaultAddress    = 'Make this default address';
  static const String fullName              = 'Full Name';
  static const String phoneNumber           = 'Phone Number';
  static const String alternativePhone      = 'Alternative Phone Number';
  static const String division              = 'Division';
  static const String district              = 'District';
  static const String upazilaThana          = 'Upazila / Thana';
  static const String fullAddress           = 'Detailed Address';
  static const String addressPlaceholder    = 'House no, road no, area details...';
  static const String addressLabelHome      = 'Home';
  static const String addressLabelOffice    = 'Office';
  static const String paymentMethod         = 'Payment Method';
  static const String selectPaymentMethod   = 'Select Payment Method';
  static const String onlinePayment         = 'Online Payment';
  static const String bKashPayment          = 'bKash Online Payment';
  static const String nagadPayment          = 'Nagad Online Payment';
  static const String cardPayment           = 'Credit / Debit Card';
  static const String emiPayment            = '0% EMI Financing';
  static const String placeOrder            = 'Place Order';
  static const String confirmOrder          = 'Confirm Order';
  static const String payNow                = 'Pay Now';
  static const String orderSuccessTitle     = 'Order Placed Successfully!';
  static const String orderSuccessSubtitle  = 'Thank you for shopping with Pickaboo. Your order has been confirmed.';
  static const String orderIdLabel          = 'Order ID:';
  static const String trackOrder            = 'Track Order';
  static const String continueShopping      = 'Continue Shopping';

  // ===========================================================================
  // ── 5. FILTERS & SORTING ──────────────────────────────────────────────────
  // ===========================================================================
  static const String filterTitle           = 'Filter';
  static const String filterBy              = 'Filter By';
  static const String allFilters            = 'All Filters';
  static const String allBrands             = 'All Brands';
  static const String noFilterAvailable     = 'No filter available';
  static const String sortPriceLowToHigh    = 'Price: Low to High';
  static const String sortPriceHighToLow    = 'Price: High to Low';
  static const String sortNewestFirst       = 'Newest Arrivals';
  static const String sortPopular           = 'Popularity';
  static const String sortDiscount          = 'Discount: High to Low';
  static const String sortRating            = 'Customer Rating';
  static const String filterCategory        = 'Categories';
  static const String filterBrand           = 'Brands';
  static const String filterPriceRange      = 'Price Range';
  static const String minPrice              = 'Min Price';
  static const String maxPrice              = 'Max Price';
  static const String filterAvailability    = 'Availability';
  static const String filterInStockOnly     = 'In Stock Only';
  static const String filterWarranty        = 'Warranty';
  static const String filterRatingStars     = 'Ratings';

  // ===========================================================================
  // ── 6. ACCOUNT & DASHBOARD ────────────────────────────────────────────────
  // ===========================================================================
  static const String accountTitle          = 'My Account';
  static const String myOrders              = 'My Orders';
  static const String orderHistory          = 'Order History';
  static const String orderDetails          = 'Order Details';
  static const String myWishlist            = 'My Wishlist';
  static const String wishlistEmptyTitle    = 'Your Wishlist is Empty';
  static const String wishlistEmptySubtitle = 'Explore products and tap the heart icon to save your favorites!';
  static const String myReviews             = 'My Reviews';
  static const String clubPointsBalance     = 'Club Points Balance';
  static const String savedAddresses        = 'Saved Addresses';
  static const String accountInformation    = 'Account Information';
  static const String changePassword        = 'Change Password';
  static const String changeEmail           = 'Change Email';
  static const String currentPassword       = 'Current Password';
  static const String newPassword           = 'New Password';
  static const String confirmPassword       = 'Confirm Password';
  static const String supportTickets        = 'Support Tickets';
  static const String createTicket          = 'Create New Ticket';
  static const String ticketDetails         = 'Ticket Details';
  static const String helpAndFaq            = 'Help & FAQ';
  static const String contactUs             = 'Contact Us';
  static const String termsAndConditions    = 'Terms & Conditions';
  static const String privacyPolicy         = 'Privacy Policy';
  static const String returnPolicy          = 'Return Policy';
  static const String returnAndRefundPolicy = 'Return & Refund Policy';
  static const String emiPolicy             = 'EMI Policy';
  static const String appSettings           = 'App Settings';
  static const String notifications         = 'Notifications';
  static const String appVersion            = 'App Version';
  static const String logout                = 'Log Out';
  static const String logoutConfirmTitle    = 'Log Out from Pickaboo?';
  static const String logoutConfirmMessage  = 'Are you sure you want to log out of your account?';

  // ===========================================================================
  // ── 7. AUTHENTICATION & LOGIN ─────────────────────────────────────────────
  // ===========================================================================
  static const String login                 = 'Log In';
  static const String loginOrRegister       = 'LOGIN / REGISTER';
  static const String loginTitle            = 'Welcome to Pickaboo';
  static const String loginSubtitle         = 'Enter your mobile number to continue';
  static const String sendOtp               = 'Send OTP';
  static const String verifyOtp             = 'Verify OTP';
  static const String enterOtpCode          = 'Enter 4-Digit Verification Code';
  static const String otpSentTo             = 'We have sent a verification code to';
  static const String resendOtp             = 'Resend Code';
  static const String resendIn              = 'Resend in';
  static const String orContinueWith        = 'Or continue with';
  static const String continueWithGoogle    = 'Continue with Google';
  static const String continueWithFacebook  = 'Continue with Facebook';
  static const String continueWithApple     = 'Continue with Apple';
  static const String continueAsGuest       = 'Continue as Guest';
  static const String agreedToTerms         = 'By continuing, you agree to Pickaboo\'s Terms & Conditions and Privacy Policy.';

  // ===========================================================================
  // ── 8. SYSTEM FEEDBACK, SNACKBARS & ERRORS ────────────────────────────────
  // ===========================================================================
  static const String notice                = 'Notice';
  static const String success               = 'Success';
  static const String error                 = 'Error';
  static const String warning               = 'Warning';
  static const String pageNotFound          = 'Page Not Found';
  static const String somethingWentWrong    = 'Something went wrong. Please try again.';
  static const String noInternetConnection  = 'No internet connection. Please check your network.';
  static const String itemAddedToCart       = 'Item added to cart successfully';
  static const String itemAddedToWishlist   = 'Item added to your wishlist';
  static const String itemRemovedFromWishlist = 'Item removed from your wishlist';
  static const String copiedToClipboard     = 'Copied to clipboard';
  static const String fillRequiredFields    = 'Please fill all required fields';
  static const String invalidPhoneNumber    = 'Please enter a valid phone number';
  static const String invalidOtp            = 'Invalid verification code. Please try again.';
  static const String operationSuccessful   = 'Operation completed successfully.';
  static const String operationFailed       = 'Operation failed. Please try again.';
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
  static const String enterNewPassword      = 'Enter new password';
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
  static const String failedToLoadEmiOptions       = 'Failed to load EMI options. Please try again.';
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
