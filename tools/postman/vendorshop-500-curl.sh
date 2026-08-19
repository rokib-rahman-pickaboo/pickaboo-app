#!/usr/bin/env bash
#
# Diagnoses the 500 from GET /rest/V1/dcastalia-vendorshop/products.
#
# Context: the Flutter app 500s loading the brand/seller page for
# shopUrl=final-shop1684744680. The request it sends is identical to the RN
# app's (path, params, no auth) — but the two apps point at different hosts:
# RN is hardcoded to production, Flutter defaults to staging. So this failure
# has never been exercised by RN.
#
# Run:  bash tools/postman/vendorshop-500-curl.sh [healthy-vendor-slug]
#
set -uo pipefail

STAGING="https://gcpadmin.pickaboo.com"
PROD="https://www.pickaboo.com"
PATH_="/rest/V1/dcastalia-vendorshop/products"

SHOP="final-shop1684744680"   # the vendor that fails
HEALTHY="${1:-}"              # any vendor known to work
PAGE=1
SIZE=10                       # RN's APP_CONSTANT.PRODUCT_LIMIT

# No Authorization header anywhere below: both apps call this endpoint as a
# guest (RN passes token="", Flutter sets noAuth:true).

hit() {
  local label="$1" url="$2"; shift 2
  printf '\n\033[1m%s\033[0m\n%s\n' "$label" "$url"
  curl -sS -o /tmp/vendorshop.out -w 'HTTP %{http_code}  %{time_total}s\n' "$@" "$url"
  head -c 600 /tmp/vendorshop.out; echo
}

hit "1. Staging — failing vendor (baseline; expect 500)" \
  "$STAGING$PATH_?shopUrl=$SHOP&currentPage=$PAGE&pageSize=$SIZE" \
  -H 'Accept: application/json' -H 'Content-Type: application/json'

hit "2. Production — same vendor (staging-only? 404 here is plausible)" \
  "$PROD$PATH_?shopUrl=$SHOP&currentPage=$PAGE&pageSize=$SIZE" \
  -H 'Accept: application/json' -H 'Content-Type: application/json'

# Flutter's AuthInterceptor adds Accept: application/json to every request;
# RN sends only Content-Type. This is the one remaining client difference.
hit "3. Staging — no Accept header (rules out content negotiation)" \
  "$STAGING$PATH_?shopUrl=$SHOP&currentPage=$PAGE&pageSize=$SIZE" \
  -H 'Content-Type: application/json'

if [ -n "$HEALTHY" ]; then
  hit "4. Staging — healthy vendor (DECISIVE: data vs module)" \
    "$STAGING$PATH_?shopUrl=$HEALTHY&currentPage=$PAGE&pageSize=$SIZE" \
    -H 'Accept: application/json' -H 'Content-Type: application/json'
else
  printf '\n\033[1m4. SKIPPED\033[0m — pass a known-good vendor slug as $1.\n'
  printf '   This is the request that actually settles it.\n'
fi

hit "5. Staging — pageSize=20 (what Flutter sent before this session)" \
  "$STAGING$PATH_?shopUrl=$SHOP&currentPage=1&pageSize=20" \
  -H 'Accept: application/json' -H 'Content-Type: application/json'

cat <<'EOF'

──────────────────────────────────────────────────────────────
How to read it
  4 = 200, 1 = 500  → this vendor's data is bad. Nothing to fix in the app.
  4 = 500, 1 = 500  → module-level bug. Get the Magento exception log.
  3 = 200, 1 = 500  → the Accept header is the trigger; scope it out of this call.
  5 = 500, 1 = 200  → page size mattered; the 20→10 fix already landed.
  1 = 200           → transient. Nothing to chase.
──────────────────────────────────────────────────────────────
EOF
