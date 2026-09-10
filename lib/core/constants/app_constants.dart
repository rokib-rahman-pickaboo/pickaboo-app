export 'package:pickaboo/core/constants/app_strings.dart';

class AppConstants {
  static const double minEmiAmount = 5000.0;

  static const int minCartQuantity = 1;

  static const int maxCartQuantity = 10;

  /// Google OAuth Web Client ID (used as serverClientId on Android & Web)
  static const String googleAndroidWebClientId =
      '72825511182-rgt3jj91nkfja7l6mvehtf37bfmf2l50.apps.googleusercontent.com';

  /// Google OAuth iOS Client ID
  static const String googleIosClientId =
      '72825511182-7f62gjla12auq85srbbda6b0gjpdkr70.apps.googleusercontent.com';

  /// Facebook App ID
  static const String facebookAppId = '799101504642406';
}
