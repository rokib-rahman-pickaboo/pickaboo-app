enum PagesName {
  splashScreen(title: "Splash Screen", path: "/"),

  loginScreen(title: "Login Screen", path: "/login"),
  signUpScreen(title: "Sign Up Screen", path: "/sign-up"),
  forgotPasswordScreen(
    title: "Forgot Password Screen",
    path: "/forgot-password",
  ),
  forgotPasswordConfirmScreen(
    title: "Forgot Password Confirm Screen",
    path: "/forgot-password-confirm",
  ),

  registrationScreen(title: "Registration Screen", path: "/registration"),
  registrationDetailScreen(
    title: "Registration Detail Screen",
    path: "/registration-detail",
  ),

  homeScreen(title: "Home Screen", path: "/home"),
  dashboardScreen(title: "Dashboard Screen", path: "/dashboard"),
  categoryScreen(title: "Category Screen", path: "/category"),

  productShopScreen(title: "Product Shop Screen", path: "/product-shop"),
  productDetailScreen(title: "Product Detail Screen", path: "/product-detail"),

  cartScreen(title: "Cart Screen", path: "/cart"),
  cartScreenGuest(title: "Cart Screen Guest", path: "/cart-guest"),

  wishListScreen(title: "Wish List Screen", path: "/wish-list"),

  orderListScreen(title: "Order List Screen", path: "/order-list"),
  orderDetailsScreen(title: "Order Details Screen", path: "/order-details"),
  orderPlacedScreen(title: "Order Placed Screen", path: "/order-placed"),
  orderFailedScreen(title: "Order Failed Screen", path: "/order-failed"),
  orderCancelledScreen(
    title: "Order Cancelled Screen",
    path: "/order-cancelled",
  ),

  paymentReviewScreen(title: "Payment Review Screen", path: "/payment-review"),
  paymentOrderSummaryScreen(
    title: "Payment Order Summary Screen",
    path: "/payment-order-summary",
  ),
  paymentMethodScreen(title: "Payment Method Screen", path: "/payment-method"),
  savePaymentScreen(title: "Save Payment Screen", path: "/save-payment"),
  addCardScreen(title: "Add Card Screen", path: "/add-card"),

  addressScreen(title: "Address Screen", path: "/address"),
  newAddressScreen(title: "New Address Screen", path: "/new-address"),
  newAddressCartScreen(
    title: "New Address Cart Screen",
    path: "/new-address-cart",
  ),
  changeAddressScreen(title: "Change Address Screen", path: "/change-address"),

  reviewScreen(title: "Review Screen", path: "/review"),
  yourReviewScreen(title: "Your Review Screen", path: "/your-review"),
  writeReviewScreen(title: "Write Review Screen", path: "/write-review"),

  ticketMainScreen(title: "Ticket Main Screen", path: "/ticket-main"),
  ticketDetailScreen(title: "Ticket Detail Screen", path: "/ticket-detail"),
  createTicketScreen(title: "Create Ticket Screen", path: "/create-ticket"),

  accountInformationScreen(
    title: "Account Information Screen",
    path: "/account-information",
  ),
  editAccountInformationScreen(
    title: "Edit Account Information Screen",
    path: "/edit-account-information",
  ),
  settingScreen(title: "Setting Screen", path: "/setting"),
  clubPointScreen(title: "Club Point Screen", path: "/club-point"),

  termsScreen(title: "Terms and Condition Screen", path: "/terms"),
  contactUsScreen(title: "Contact Us Screen", path: "/contact-us"),
  searchScreen(title: "Search Screen", path: "/search"),
  notificationListScreen(
    title: "Notification List Screen",
    path: "/notification-list",
  ),

  knowledgeBaseScreen(title: "Knowledge Base Screen", path: "/knowledge-base"),
  knowledgeBaseDetailsScreen(
    title: "Knowledge Base Details Screen",
    path: "/knowledge-base-details",
  ),

  referralScreen(title: "Referral Screen", path: "/referral"),
  referralCodeScreen(title: "Referral Code Screen", path: "/referral-code");

  const PagesName({required this.title, required this.path});
  final String title;
  final String path;
}
