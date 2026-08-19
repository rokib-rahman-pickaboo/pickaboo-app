# Pickaboo — Flutter App

E-commerce app for Pickaboo (Bangladesh), backed by a Magento 2 REST API. Flutter rewrite of the previous React Native app; version tracks continue from it (iOS `16.1.6+47`, Android `7.0.5 / 70005`).

- Dart SDK: `^3.9.2` (Flutter 3.35+)
- Platforms: Android (`com.pickaboo.app`), iOS
- Architecture: Clean Architecture + BLoC

## Quick start

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # freezed / json / injectable
flutter run                                                # staging backend by default
```

## Environments

The backend is chosen at **build time**, not by build mode — a plain `--release` build still points at staging.

| Command | Backend |
| --- | --- |
| `flutter run` / `flutter build apk --release` | staging (`gcpadmin.pickaboo.com`) |
| `flutter build apk --release --dart-define=ENV=production` | production |

Defined in `lib/core/endpoints/api_endpoints.dart` (`String.fromEnvironment('ENV')`). All endpoint paths live in that one class.

## `ApiEndpoints` — the single URL registry

`lib/core/endpoints/api_endpoints.dart` holds every URL the app talks to. It is the only file in `lib/` that keeps its comments, because the API surface it documents isn't discoverable anywhere else. Nothing else in the codebase hardcodes a path — API services reference these constants.

**Shape.** Two kinds of members:

- `static const String x = '/rest/…'` — fixed paths.
- `static String x({required T y}) => '/rest/…/$y'` — paths with segments or query params, e.g. `productDetailUrl(productId:)`, `applyCouponUrl(cartId:, coupon:)`, `cardBinApplyUrl(orderId:)`.

Paths are **relative**; the host comes from the Dio client (`baseUrl` for Magento, `barikoiBaseUrl` for the maps client), so a path must never include a domain.

**Environment switching.** `_env` is read once via `String.fromEnvironment('ENV')`, defaulting to `staging`, and drives two values:

- `baseUrl` → `_productionDomainUrl` / `_stagingDomainUrl` (both currently `gcpadmin.pickaboo.com`; `www.pickaboo.com` and the older staging hosts are kept commented for quick swaps)
- `searchaniseApiKey` → production vs staging search index, so a staging build can't query the production index

Build mode is deliberately not part of this decision — see [Environments](#environments).

**Groups, in file order.** auth / customer-check · home feed, banners, offers, popups · category, brand and special-category storefronts (`categoryKey` and `brandKey` accept either a numeric id or a slug) · product detail (by id or slug) · support & helpdesk articles · CMS content pages (terms, privacy, return policy) · Searchanise search · authenticated cart, coupons, reward points, save-for-later · guest cart + merge · checkout (estimate shipping, estimate-by-address-id, shipping-information, payment select, order place) · OTP / registration / social login / profile / password · address city+area lookups · referrals · FCM + notification list · wishlist · orders (list, detail, cancel, reorder) · saved bKash agreements · related/recommended products, banners, promo sliders · reviews and review votes · EMI, CEMI, delivery charge · product-detail CMS blocks · discover category, flash sales · Barikoi autocomplete + reverse geocode · payment gateways (bKash, Nagad, City, BRAC, MTB, SSLCommerz, EBL) · card-BIN discount · WebView callback URLs.

**Things worth knowing before editing it**

- `estimateShippingByAddressIdUrl` is preferred over `estimateShippingUrl` for saved addresses — the backend resolves region/postcode itself, so options actually differ per address.
- `reviewVotesUrl` exists because `productReviewsUrl` omits vote counts; the repository merges the two by `review_id`.
- EBL needs `/rest/default/` in its path — use `eblPaymentProcessUrl` rather than composing it.
- Gateway callback URLs (`bkash*CallbackUrl`, `nagadCallbackUrl`) intentionally use the **production** domain regardless of `ENV`, because the gateways must be able to redirect to them. `PaymentWebView` intercepts these paths. Nagad's slug is misspelled `nagod` on purpose — it matches the web codebase.
- `barikoiApiKey` is committed in this file (marked `// replace this`), as is the Searchanise key. Treat both as public-client keys, not secrets.
- Several members are `static String` (mutable) rather than `static const` for no particular reason; prefer `const` for anything new.

## Builds

```bash
flutter build apk --release --dart-define=ENV=production
flutter build appbundle --release --dart-define=ENV=production
flutter build ipa --release --dart-define=ENV=production
```

Android release signing is configured in `android/app/build.gradle.kts` against `android/app/pickaboo-app.keystore`. Firebase config (`google-services.json` / `GoogleService-Info.plist`) and `lib/firebase_options.dart` must be present for the app to boot — `main()` initialises Firebase before `runApp`.

Splash screens: `dart run flutter_native_splash:create` (config at the bottom of `pubspec.yaml`).

## Project layout

```
lib/
  core/          cross-cutting: endpoints, cache, theme, colors, network, utils, enums
  data/          api_service/ (Dio calls) · model/ (wire DTOs) · mapper/ (DTO → entity)
                 repository/ (impls) · local_data_source/ · interceptors/ · services/
  domain/        entity/ (pure models) · repository/ (abstract contracts)
  presentation/  bloc/ · ui/pages/ · ui/widgets/ · navigation/ (go_router)
  di/            injectable modules (Dio, secure storage, connectivity, app init)
  main.dart      bootstrap: crash reporting → cache → Firebase → DI → push → runApp
test/            mirrors lib/ (repository, api_service, bloc, mapper tests)
```

Roughly: 17 repositories, 30 API services, 77 entities, 56 mappers, 70+ blocs, 70+ pages.

## Architecture

```
UI (page/widget)
  → Bloc  (events in, states out)
    → Repository (domain contract)
      → ApiService (Dio)  |  LocalDataSource (Hive / GetStorage)
        → Model (JSON DTO) --mapper--> Entity
```

Rules that hold across the codebase:

- **Layer direction**: `presentation → domain ← data`. UI never imports `data/model`; it only sees `domain/entity`.
- **Error flow**: `Either<AppErrorEntity, T>` (dartz). API services return `Either<ErrorResponse, Model>`; repositories map both sides to domain types. No exceptions cross a repository boundary.
- **State**: BLoC (`flutter_bloc`) with freezed events/states. Long-running or order-critical handlers set an explicit transformer (`droppable()` for place-order, `restartable()` for shipping estimates, `sequential()` for payment-method sync).
- **DI**: `injectable` + `get_it`. Annotate (`@injectable`, `@LazySingleton(as: X)`), then regenerate `injection.config.dart`. Resolve with `getIt<T>()`; blocs are provided per-route in `presentation/navigation/route.dart`.
- **Codegen**: freezed + json_serializable for models/states, injectable for DI. `*.g.dart` / `*.freezed.dart` are generated — never edit, and they're excluded from analysis.

## Networking & auth

`lib/di/network_module.dart` builds two Dio clients:

- default — `ApiEndpoints.baseUrl`, 40s timeouts, `AuthInterceptor`, certificate pinning
- `@Named('barikoi')` — Barikoi maps/geocoding

`AuthInterceptor` attaches `Authorization: Bearer <token>` unless the request opts out with `extra: {'noAuth': true}` (some gateway callbacks reject customer tokens). On a 401 for an authenticated request it clears the session, wipes local caches and routes to login — once, guarded against concurrent 401s.

## Storage tiers

| Tier | Used for |
| --- | --- |
| `flutter_secure_storage` (`CacheManager`) | auth token only |
| `GetStorage` (`FastCacheManager`) | non-secret keys — synchronous reads, no crypto/platform hop |
| `Hive` (`local_data_source/*`) | cached API payloads, TTL'd — see below |

`FastCacheManager.init()` runs before anything else in `main()` and performs a one-time migration of non-secret values out of secure storage, plus purging of retired keys.

### Hive payload caches

| Cache | Box (`core/constants/db_constants.dart`) | TTL | Hive typeId |
| --- | --- | --- | --- |
| Home feed (`/rest/V1/new-homepageapi`) | `home-content-database` | 30 min | 16 |
| Categories | `category-database` | 24 h | 2 |
| Product detail | `product-detail-database` | 24 h | 31 |
| User profile | `user-profile-database` | 24 h | 8 |
| Helpdesk tickets | `ticket-database` | 30 min | 18 |

Each cache is three parts: a `…CacheWrapper` freezed+Hive model in `data/model/cache/` holding the payload plus `cachedAt` (with an `isExpired` / `timeUntilExpiration` extension), a `…LocalDataSource` pair in `data/local_data_source/`, and the read/write calls inside the repository. Adapters are registered in `di/app_init_module.dart` — a new cache needs an unused `typeId` there.

**Repository pattern** — every cached call follows the same shape:

```dart
Future<Either<AppErrorEntity, T>> getX({bool forceRefresh = false}) async {
  if (!forceRefresh) {
    final cached = await _localDataSource.getXIfValid();   // null when absent/expired
    if (cached != null) return right(cached.toEntity());
  }
  final result = await apiService.getX();
  return result.fold((l) => left(l.toEntity()), (r) {
    _localDataSource.insertX(r);                            // fire-and-forget write
    return right(r.toEntity());
  });
}
```

`getXIfValid()` clears the box itself when the entry is expired, so an expired read costs one Hive open and returns `null`.

**`forceRefresh` convention**: the initial load of a screen passes nothing (cache-first); pull-to-refresh and error-retry pass `forceRefresh: true` (network-only). `home_page.dart` follows exactly this — `initState` → `getFeedContent()`, `_onRefresh` and the retry button → `getFeedContent(forceRefresh: true)`. Sending `true` from `initState` silently disables the cache, which is how the home cache was dormant before.

The auth 401 handler in `AuthInterceptor` wipes the profile and ticket boxes on session loss; the home/category/product caches are public content and survive logout.

## Navigation

`go_router` with a `StatefulShellRoute` for the bottom nav. Route paths are constants in `presentation/navigation/route_constants.dart`; typed helpers live in `navigation_extensions.dart` (`context.goToPaymentMethod(...)`, `context.pushToBrandProduct(...)`). Deep links are handled by `app_links` via `deep_link_resolver_page.dart`.

## Checkout flow (the most stateful part)

`CheckoutBloc` drives: `loadCheckout` → address selection → `estimateShipping` → `selectShippingMethod` (`saveShippingInformation`) → `placeOrder` → gateway (bKash / Nagad / City / BRAC / EBL / MTB / SSLCommerz / EMI / COD) → confirm.

Changing the shipping address clears the previously estimated methods and re-estimates; estimates carry a token so a superseded response can never repopulate the options list.

## Testing

```bash
flutter test
flutter analyze
```

39 test files under `test/`, mirroring `lib/` — repositories and API services (mocktail + Dio mocks), blocs (`bloc_test`), and mappers.

## Conventions

- Sizing via `flutter_screenutil` (`16.w`, `12.h`, `14.sp`, `8.r`).
- Colors/text styles through context extensions: `context.colors.primary`, `context.textStyle.bodyMediumBold`. No raw `Color(0x…)` in widgets unless it's a one-off brand colour.
- Debug logging is wrapped in `if (kDebugMode)`.
- Analyzer directives (`// ignore: …`) are the only comments kept in `lib/`; the rest of the source is intentionally comment-free.

## Tools

`tools/postman/` — Postman collection and curl reproductions used to chase backend 500s.
