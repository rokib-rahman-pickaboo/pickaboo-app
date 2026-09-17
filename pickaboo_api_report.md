# 📡 Pickaboo Application — Complete API Report & Postman Guide

This report provides a comprehensive, production-grade API catalog for the entire Pickaboo application, accompanied by ready-to-import **Postman Collection v2.1** and **Environment** files.

---

## 🚀 Quick Start: Importing into Postman

### Files Generated in Workspace:
1. **[pickaboo_api_postman_collection.json](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/pickaboo_api_postman_collection.json)**
   - Contains **139 endpoints** organized into **16 functional categories**.
   - Configured with request parameters, realistic request bodies, headers, and dynamic variables.
   - Built-in **Postman Test scripts** automatically capture and store:
     - `token` (Bearer token upon login/social login)
     - `cartId` (Customer active cart ID)
     - `guestCartId` (Guest cart ID)
     - `orderId` (Placed order ID)
2. **[pickaboo_postman_environment_staging.json](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/pickaboo_postman_environment_staging.json)**
   - Pre-configured for **Staging / Testing**: `https://gcpbeta.pickaboo.com`
   - Includes Searchanise staging key, Barikoi API key, and sample IDs.
3. **[pickaboo_postman_environment_production.json](file:///Users/pickaboomacmini/Projects/Pickaboo%20Flutter%20Applications/Pickaboo-App/pickaboo_postman_environment_production.json)**
   - Pre-configured for **Production (LIVE)**: `https://www.pickaboo.com`
   - Includes Searchanise production key and Barikoi API key.

### How to Import:
1. Open **Postman**.
2. Click the **Import** button in the top left.
3. Drag & drop **`pickaboo_api_postman_collection.json`** and **`pickaboo_postman_environment_staging.json`** (or browse to project root).
4. In the top right environment dropdown, select **`Pickaboo Staging (GCP Beta)`**.
5. Run **`01. Authentication & Authorization -> Customer Login (Phone & Password)`** — the auth token is automatically extracted and populated into `{{token}}` for all protected endpoints!

---

## 🌐 Environment & Base URLs

| Environment | Base URL | Notes |
| :--- | :--- | :--- |
| **Staging (GCP Beta)** | `https://gcpbeta.pickaboo.com` | Current active development server |
| **Staging (GCP Admin)**| `https://gcpadmin.pickaboo.com` | Secondary testing backend |
| **Production (LIVE)** | `https://www.pickaboo.com` | Production Magento 2 instance |
| **Search Engine** | `https://searchserverapi.com` | Searchanise SaaS search & recommendations |
| **Geocoding / Places** | `https://barikoi.xyz/v2/api` | Barikoi Bangladesh address lookup & reverse geocoding |

---

## 🗂️ API Modules Summary (16 Modules, 139 Endpoints)

| # | Module | Endpoints | Auth Required? | Primary Description |
|---|---|:---:|:---:|---|
| **01** | **Authentication & Authorization** | 11 | Mixed | Phone OTP, password login, registration, password reset, social login (Google/Apple/FB), customer verification |
| **02** | **User Profile & Account** | 11 | Yes | Customer details, profile image, password change, phone/email updates with OTP, Club points balance, referral history & invite |
| **03** | **Addresses & Geography** | 8 | Mixed | Customer address book (CRUD), Bangladesh administrative divisions/cities/areas, Barikoi place autocomplete & reverse geocoding |
| **04** | **Home Feed, Banners & CMS** | 16 | No | Dynamic homepage feeds, top carousel banners, active promo banners, category banners, flash sales, CMS static blocks (guarantee, express, popup) |
| **05** | **Catalog, Products & Storefront** | 15 | No | Full category hierarchy tree, category product listings with filters & sorting, brand pages, PDP details, flash sale item data, delivery charges, EMI details |
| **06** | **Search (Searchanise)** | 3 | No | Instant full-text search, live auto-suggestions, category-scoped search, price sorting, attribute facets |
| **07** | **Cart & Coupons** | 17 | Mixed | Customer & guest cart lifecycle, item add/update/delete, coupon apply/remove, reward club points redemption, save-for-later, guest cart merge |
| **08** | **Checkout & Order Placement** | 8 | Yes | Shipping method estimation (by address or saved ID), shipping carrier save, payment method selection, order placement, DM order place |
| **09** | **Card BIN & EMI Calculations** | 8 | Mixed | Bank credit card BIN eligibility checks, BIN discount apply/remove, multi-bank EMI tenure calculation, Cardless EMI (CEMI) |
| **10** | **Payment Gateways** | 15 | Mixed | bKash tokenized agreement creation/execution/payment, Nagad gateway execution & callback, City Bank, BRAC Bank, MTB, SSLCommerz, and EBL |
| **11** | **Orders & Tracking** | 4 | Yes | Paginated order history, item level tracking details, order cancellation, and 1-click past order reordering |
| **12** | **Reviews & Ratings** | 5 | Mixed | Paginated product reviews with photos, review helpful/unhelpful votes, photo review submission (multipart), customer's submitted reviews |
| **13** | **Wishlist** | 3 | Yes | Customer wishlist items listing, add product to wishlist, remove item from wishlist |
| **14** | **Push Notifications** | 5 | Yes | FCM device token registration/unsubscription, in-app notification inbox, mark read, mark all as read |
| **15** | **Helpdesk & Support Tickets** | 6 | Yes | Customer support ticket list, department selection, ticket creation with file attachments, thread reply, ticket close |
| **16** | **Knowledge Base & Legal** | 7 | No | Help center FAQ categories, article listing & search, Terms & Conditions, Privacy Policy, Return Policy |

---

## 📋 Comprehensive Endpoint Reference

### 01. Authentication & Authorization
- `POST /rest/V1/customer-check/exist` — Check if mobile number is already registered.
- `POST /rest/default/V1/integration/mobile/token` — Login with phone & password; returns Magento Bearer token.
- `POST /rest/all/V1/sendotp` — Sends SMS OTP code to mobile phone.
- `POST /rest/all/V1/validateOtp` — Validates SMS OTP code.
- `POST /rest/default/V1/customersignupafterotpv` — Completes customer account registration with verified OTP.
- `POST /rest/V1/dcastalia-emailverification/sendcode` — Sends email verification PIN code.
- `POST /rest/V1/dcastalia-emailverification/checkcode` — Validates email verification PIN code.
- `POST /rest/V1/dcastalia-forgetpassword/forgetpasswordnew` — Request OTP to reset forgotten password.
- `POST /rest/V1/dcastalia-forgetpassword/resetpassword` — Submit new password with OTP code.
- `POST /rest/V1/dcastalia-socialintegration/login` — Sign in / Register via Google, Apple, or Facebook access tokens.
- `GET /rest/default/V1/customers/me` — Fetch authenticated customer profile data.

### 02. User Profile & Account
- `GET /rest/default/V1/customers/me` — Fetch customer details.
- `GET /rest/V1/customers/image/mine` — Fetch customer profile avatar URL.
- `PUT /rest/V1/dcastalia-address/customers/me` — Update name, gender, date of birth.
- `PUT /rest/V1/customers/me/password` — Change password.
- `POST /rest/V1/dcastalia-mobilelogin/sendotp` — Request OTP on new mobile number for phone change.
- `PUT /rest/V1/address/customers/me/mobile` — Update customer mobile number with OTP.
- `POST /rest/V1/dcastalia-emailverification/sendcode` — Request OTP on new email address.
- `PUT /rest/V1/address/customers/me/email` — Update customer email with OTP.
- `GET /rest/V1/clubpoints/mine?page=1&limit=10` — Customer Pickaboo Club points and history.
- `GET /rest/V1/dcastalia/referral/history?page=1&limit=10` — Referral program invites and rewards.
- `POST /rest/V1/dcastalia/referral/invite` — Send referral invite to friend.

### 03. Addresses & Geography
- `GET /rest/V1/address/customers/me/address` — List customer saved address book entries.
- `POST /rest/V1/address/customers/me/address` — Add new shipping/billing address.
- `PUT /rest/V1/address/customers/me/address` — Update existing address.
- `DELETE /rest/V1/address/customers/me/address/{id}` — Delete saved address.
- `GET /rest/default/V1/dcastalia-address/getcity?param={division}` — Get cities within division.
- `GET /rest/default/V1/dcastalia-address/getarea?param={city}` — Get areas/thanas within city.
- `GET https://barikoi.xyz/v2/api/search/autocomplete/place` — Barikoi address autocomplete suggestions.
- `GET https://barikoi.xyz/v2/api/search/reverse/geocode` — Barikoi reverse geocode GPS coordinates to BD address.

### 04. Home Feed, Banners & CMS
- `GET /rest/V1/new-homepageapi?prod_limit=10` — Main homepage dynamic content and sections.
- `GET /rest/V1/flashsales/active` — Active flash sales and countdown timers.
- `GET /rest/V1/custom-banners/homepage` — Top hero carousel banners.
- `GET /rest/V1/custom-banners/active` — Active app-wide custom banners.
- `GET /rest/V1/custom-banners/category/{categoryId}` — Category-specific promo banners.
- `GET /rest/default/V1/homepage-offers` — Curated promotional offer blocks.
- `GET /rest/default/V1/home-products?prod_limit=10&currentPage=1` — "Just For You" infinite scroll feed.
- `GET /rest/V1/discover-category` — Discover tab category icons and links.
- `GET /rest/V1/allslides?searchCriteria...` — Promotional and service guarantee slider slides.
- `GET /rest/default/V1/pickaboo-cms-block/dc-popup-adv-app` — Startup popup campaign block.
- `GET /rest/default/V1/pickaboo-cms-block/pickaboo-dc-product-offer` — PDP bank offer promo block.
- `GET /rest/default/V1/pickaboo-cms-block/best-price-guaranteed-by-pickaboo` — Price guarantee info.
- `GET /rest/default/V1/pickaboo-cms-block/best-price-guaranteed-by-pickaboo-t-and-c` — Guarantee terms.
- `GET /rest/default/V1/pickaboo-cms-block/pickaboo-verified` — Pickaboo verified trust ribbon.
- `GET /rest/default/V1/pickaboo-cms-block/delivery-options` — Express delivery policies & hours.

### 05. Catalog, Products & Storefront
- `GET /rest/V1/all-categories` — Full tree of categories, sub-categories, and menu hierarchy.
- `GET /rest/V1/categorypageapi/{categoryKey}` — Category storefront products with filters & pagination.
- `GET /rest/V1/category-id/slug/{slug}` — Resolve category slug to ID.
- `GET /rest/V1/brandpageapi/{brandKey}` — Brand storefront product listing.
- `GET /rest/V1/product/info/id/{productId}` — Detailed PDP data (attributes, variants, price, badges, warranty, EMI).
- `GET /rest/V1/product-id/slug/{slug}` — Resolve product slug to ID / info.
- `GET /rest/V1/flashsales/product/{slug}` — Flash sale item pricing and quota.
- `GET /rest/V1/seller-recommended-products/{slug}` — Recommended products on PDP.
- `GET /rest/V1/related-products/{slug}` — Related / frequently bought together products.
- `GET /rest/V1/dcastalia-vendorshop/products` — Marketplace seller shop product listing.
- `GET /rest/V1/pickaboo/delivery-charge/product?productId={productId}` — Estimated delivery fee for product.
- `GET /rest/V1/product-emi/details?id={productId}` — Bank EMI plans and monthly installment calculation.
- `GET /rest/V1/product-free-coupon/{slug}` — Free discount coupons applicable to product.

### 06. Search (Searchanise)
- `GET https://searchserverapi.com/getresults` — Real-time search with spell correction, suggestions, facets, and category filtering.

### 07. Cart & Coupons
- `POST /rest/default/V1/carts/mine/` — Initialize / retrieve authenticated customer cart.
- `GET /rest/default/V1/dcastalia-checkout/checkout` — Full cart calculation with line items, discounts, and totals.
- `POST /rest/default/V1/carts/mine/items` — Add product SKU to customer cart.
- `PUT /rest/V1/carts/mine/items/{itemId}` — Update item quantity.
- `DELETE /rest/V1/carts/mine/items/{itemId}` — Remove item from cart.
- `PUT /rest/V1/dcastalia-coupon/apply?cart_id={cartId}&coupon={coupon}&is_app=1` — Apply discount coupon.
- `DELETE /rest/V1/dcastalia-coupon/remove?cart_id={cartId}` — Remove discount coupon.
- `POST /rest/default/V1/rewards/mine/apply?cart_id={cartId}&pointAmount={points}` — Redeem club points.
- `POST /rest/V1/dcastalia-emptycart/emptycart?qouteid={cartId}` — Clear entire cart.
- `POST /rest/V1/dcastalia-saveforlater/save` — Move item to Save For Later list.
- `POST /rest/default/V1/guest-carts` — Create anonymous guest cart.
- `GET /rest/default/V1/guest-carts/{cartId}` — Get guest cart contents.
- `GET /rest/default/V1/dcastalia-checkout/checkout?cart_id={cartId}` — Get guest cart checkout details.
- `POST /rest/default/V1/guest-carts/{cartId}/items` — Add item to guest cart.
- `PUT /rest/default/V1/guest-carts/{cartId}/items/{itemId}` — Update guest cart item quantity.
- `DELETE /rest/default/V1/guest-carts/{cartId}/items/{itemId}` — Delete guest cart item.
- `PUT /rest/default/V1/guest-carts/{cartId}` — Merge guest cart into customer cart upon sign-in.

### 08. Checkout & Order Placement
- `POST /rest/default/V1/carts/mine/estimate-shipping-methods` — Estimate delivery rates for custom address.
- `POST /rest/default/V1/carts/mine/estimate-shipping-methods-by-address-id` — Estimate delivery rates using saved address ID.
- `POST /rest/default/V1/carts/mine/shipping-information` — Attach shipping address and delivery carrier to checkout.
- `GET /rest/V1/dcastalia-carts/{cartId}/shipping-information` — Fetch available payment gateways and final order totals.
- `POST /rest/V1/dccheckout/payment` — Select payment method (COD, bKash, Card, EMI).
- `POST /rest/V1/dccheckout/orderplace` — Submit and place order; returns order entity/increment ID.
- `POST /rest/V1/dcastalia-order/updateorderpayment` — Update payment status or switch payment method on existing order.
- `POST /rest/default/V1/dcastalia/dmorder-place/` — Direct message order placement confirmation.

### 09. Card BIN & EMI Calculations
- `GET /rest/V1/cardbin/status` — Check if bank Card BIN discounts are active.
- `POST /rest/V1/orders/{orderId}/cardbin/verify` — Check card BIN discount eligibility for order.
- `POST /rest/V1/orders/{orderId}/cardbin/apply` — Apply discount by credit card BIN.
- `DELETE /rest/V1/orders/{orderId}/cardbin/remove` — Remove applied Card BIN discount.
- `POST /rest/V1/dcastalia-emi/get-emi-details` — Fetch bank EMI tenure choices and interest amounts.
- `POST /rest/V1/dcastalia-emi/emiUpdateQuote` — Apply selected bank EMI plan to order.
- `POST /rest/V1/dcastalia-crdemi/get-crdemi-details` — Fetch Cardless EMI financial provider options.
- `POST /rest/V1/dcastalia-emi/cemiUpdateQuote` — Apply Cardless EMI option to order.

### 10. Payment Gateways
- `POST /rest/V1/dcastalia-mobilebkash/gettoken` — bKash API token initialization.
- `POST /rest/V1/dcastalia-mobilebkash/agreementcreate` — Initiate bKash tokenized payment agreement.
- `POST /rest/V1/dcastalia-mobilebkash/agreementexecute` — Execute bKash agreement after OTP/PIN.
- `POST /rest/V1/dcastalia-mobilebkash/paymentcreate` — Create bKash payment transaction.
- `POST /rest/V1/dcastalia-mobilebkash/paymentexecute` — Confirm bKash payment deduction.
- `POST /rest/V1/dcastalia-mobilebkash/saveagreement` — Save bKash agreement for 1-click re-use.
- `GET /rest/V1/dcastalia-mobilebkash/getagreements` — Fetch saved bKash phone numbers for customer.
- `POST /rest/V1/dcastalia-mobilebkash/deleteagreement` — Unlink / delete saved bKash agreement.
- `POST /rest/V1/dcastalia-dcastalianagadapi/paymentexecute` — Execute Nagad payment checkout session.
- `GET /rest/V1/dcastalia-dcastalianagadapi/nagadcallback` — Finalize Nagad transaction callback.
- `POST /rest/V1/dcastalia-citybank/createorder` — Generate City Bank payment gateway redirect.
- `POST /rest/V1/dcastalia-bracbank/createorder` — Generate BRAC Bank gateway redirect.
- `POST /rest/V1/mtb-gateway/createorder` — Generate Mutual Trust Bank gateway redirect.
- `POST /rest/V1/dcastalia-sslcommerz/payment/request` — Generate SSLCommerz gateway session.
- `POST /rest/default/V1/dcastalia-ebl/payment-process` — Eastern Bank payment processing.

### 11. Orders & Tracking
- `GET /rest/V1/orders/mine?limit=10&currentPage=1` — Paginated list of customer orders.
- `GET /rest/V1/orders/mine/{orderId}` — Full details of specific order (items, invoice, shipment tracking).
- `POST /rest/V1/order/cancel` — Cancel order with reason and note.
- `POST /rest/V1/dcastalia-reorderapi/reorder/{orderId}` — Re-order all items from past order.

### 12. Reviews & Ratings
- `GET /rest/V1/product/info/id/{productId}/review?page=1&pageSize=10` — Paginated reviews and ratings on product.
- `GET /rest/V1/dcastalia-reviewvote/product/votes?productId={productId}` — Helpful vote counts per review.
- `POST /rest/V1/reviews/new` — Submit product rating and review with photo attachments (multipart).
- `POST /rest/V1/dcastalia-reviewvote/reviewvote` — Vote review as helpful or not helpful.
- `GET /rest/V1/reviews/mine` — List all reviews submitted by current user.

### 13. Wishlist
- `GET /rest/V1/wishlist/items` — Get customer wishlist items.
- `POST /rest/V1/wishlist/add/{productId}` — Add product to wishlist.
- `DELETE /rest/V1/wishlist/delete?productId={productId}` — Remove product from wishlist.

### 14. Push Notifications
- `POST /rest/V1/dcastalia-pushnotification/subscriber` — Register FCM push token for Android / iOS.
- `DELETE /rest/V1/dcastalia-pushnotification/subscriber/delete?token={token}` — Unsubscribe device token.
- `GET /rest/V1/dcastalia-pushnotification/notification/list` — List customer in-app notifications.
- `PUT /rest/V1/dcastalia-pushnotification/notification/update` — Mark specific notification clicked/fetched.
- `PUT /rest/V1/dcastalia-pushnotification/notification/markasread` — Mark all notifications read.

### 15. Helpdesk & Support Tickets
- `GET /rest/V1/dcastalia-helpdesk/ticket/list` — Customer's support tickets.
- `GET /rest/V1/dcastalia-helpdesk/orderinfo` — Customer orders and departments for filing ticket.
- `GET /rest/V1/dcastalia-helpdesk/ticket/details?ticket_id={id}` — Ticket conversation thread.
- `POST /rest/V1/dcastalia-helpdesk/ticket/create` — Create ticket with department, order ID, and attachments (multipart).
- `POST /rest/V1/dcastalia-helpdesk/ticket/reply` — Send reply in existing ticket thread.
- `POST /rest/V1/dcastalia-helpdesk/ticket/close` — Close support ticket.

### 16. Knowledge Base & Legal
- `GET /rest/V1/dcastalia-help/categoryList` — Support FAQ categories.
- `GET /rest/V1/dcastalia-help/articleList?category_id={id}` — Articles in a help category.
- `GET /rest/V1/dcastalia-help/searchArticle?query_string={query}` — Search help articles.
- `GET /rest/V1/support-categories` — Alternative support categories endpoint.
- `GET /rest/V1/terms-and-conditions` — Terms and conditions.
- `GET /rest/V1/getpage/privacy-policy` — Privacy policy.
- `GET /rest/V1/getpage/return-policy` — Return policy.
