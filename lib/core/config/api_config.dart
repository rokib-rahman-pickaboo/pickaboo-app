/// Application environment and domain configuration.
///
/// Controls the active backend host ([baseUrl]) and switches between production
/// and staging/testing environments.
///
/// ### Pre-Release Checklist:
/// - **Production Build:** Set [isProduction] to `true`. This switches [baseUrl] to [productionURL]
///   and automatically switches Searchanise catalog indexing in [ApiEndpoints.searchaniseApiKey]
///   to production (`6W7Z0N7U0T`).
/// - **Staging/QA Build:** Set [isProduction] to `false` to point to [developmentURL] (`gcpbeta.pickaboo.com`).
///
/// ### Domain Notes:
/// - Staging uses `https://gcpbeta.pickaboo.com` for active development and QA testing.
/// - Legacy staging `https://gcpadmin.pickaboo.com` is preserved as an alternative fallback.
/// - Media CDNs differ between environments: Staging serves images from `cdntest.pickaboo.com`,
///   while production serves from `storage.googleapis.com/pickaboo-prod` or `cdn.pickaboo.com`.
class ApiConfig {
  ApiConfig._();

  /// Environment switch:
  /// - `true`: Production environment (LIVE - https://www.pickaboo.com)
  /// - `false`: Staging / Development environment (TESTING - https://gcpbeta.pickaboo.com)
  static const bool isProduction = true;

  /// Production backend domain (LIVE customer traffic).
  static const String productionURL = 'https://www.pickaboo.com';

  /// Development / Staging backend domain (QA and feature verification).
  static const String developmentURL = 'https://gcpbeta.pickaboo.com';

  /// Active base URL automatically chosen by the [isProduction] toggle.
  static const String baseUrl = isProduction ? productionURL : developmentURL;
}

