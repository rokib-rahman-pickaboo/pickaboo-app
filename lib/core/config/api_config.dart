/// ============================================================================
/// 🌐 APPLICATION API & DOMAIN CONFIGURATION
/// ============================================================================
class ApiConfig {
  ApiConfig._();

  /// 🎛️ ENVIRONMENT SWITCH:
  ///  LIVE (Production: https://www.pickaboo.com) = true
  ///  STAGING (Testing: https://gcpadmin.pickaboo.com) = false
  static const bool isProduction = false;

  /// Production backend domain (LIVE)
  static const String productionURL = 'https://www.pickaboo.com';

  /// Development / Staging backend domain (TESTING)
  static const String developmentURL = 'https://gcpadmin.pickaboo.com';

  /// Active Base URL automatically chosen by the [isProduction] switch
  static const String baseUrl = isProduction ? productionURL : developmentURL;
}
