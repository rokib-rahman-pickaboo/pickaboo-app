import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/cart_api_service.dart';
import 'package:pickaboo/data/api_service/checkout_api_service.dart';
import 'package:pickaboo/data/mapper/cart_mapper/cart_mapper.dart';
import 'package:pickaboo/data/mapper/cart_mapper/checkout_emi_mapper.dart';
import 'package:pickaboo/data/mapper/cart_mapper/checkout_mapper.dart';
import 'package:pickaboo/data/mapper/error_mapper.dart';
import 'package:pickaboo/data/mapper/card_bin_status_mapper.dart';
import 'package:pickaboo/domain/entity/card_bin_status/card_bin_status_entity.dart';
import 'package:pickaboo/data/model/cart/add_cart_item_request/add_cart_item_request.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/checkout/shipping_method_entity.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';
import 'package:pickaboo/data/mapper/card_bin_mapper.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';
import 'package:pickaboo/data/mapper/card_bin_verify_mapper.dart';
import 'package:pickaboo/domain/entity/card_bin_remove/card_bin_remove_entity.dart';
import 'package:pickaboo/data/mapper/card_bin_remove_mapper.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';

/// Concrete implementation of [CartRepository].
///
/// Orchestrates shopping cart mutations, quote lifecycle management (guest & authenticated),
/// promotional discounts, shipping estimation, and multi-gateway checkout processing.
///
/// ### Architecture & Gateway Integrations:
/// - **Quote Partitioning:** Seamlessly delegates between authenticated customer quotes
///   (`/carts/mine`) and anonymous guest quotes (`/guest-carts/{cartId}`).
/// - **Option Mapping:** Transparently segments configurable attributes (`configurable_item_options`)
///   from add-on customizations (`custom_options`) in Magento payloads.
/// - **Stock Validation:** Backend inventory limits are enforced synchronously during item mutations;
///   exceeding available stock throws HTTP 400 (`Not enough items for sale`).
/// - **Payment Pipelines:** Orchestrates bKash tokenized checkout & recurring agreements,
///   promotional Card BIN discount campaigns, Eastern Bank Limited (EBL) gateway, Nagad callbacks,
///   and Bank EMI / Consumer EMI (CEMI) tenure selection.
@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  @override
  final CartApiService apiService;
  final CheckoutApiService checkoutApiService;
  CartRepositoryImpl(this.apiService, this.checkoutApiService);

  /// Creates a fresh authenticated quote on Magento and returns the masked quote ID.
  @override
  Future<Either<AppErrorEntity, String>> createCart() async {
    final result = await apiService.createCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Fetches basic customer cart contents (line items, simple totals).
  @override
  Future<Either<AppErrorEntity, CartEntity>> getBasicCart() async {
    final result = await apiService.getBasicCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Fetches authoritative checkout totals including delivery fees, discounts, and applied club points.
  @override
  Future<Either<AppErrorEntity, CheckoutEntity>> getCartCheckout() async {
    final result = await apiService.getCartCheckout();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Adds an item to the authenticated customer's cart.
  ///
  /// Maps [configurableOptions] into Magento's `extension_attributes` structure,
  /// cleanly separating variant attributes from custom add-on choices.
  ///
  /// If requested quantity exceeds warehouse stock, Magento rejects with HTTP 400
  /// (`Not enough items for sale`).
  @override
  Future<Either<AppErrorEntity, CartItemEntity>> addItem({
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  }) async {
    ProductOption? productOption;
    if (configurableOptions != null && configurableOptions.isNotEmpty) {
      final configOptions = configurableOptions
          .where((e) => !e.isCustomOption)
          .map((e) => MOption(optionId: e.optionId, optionValue: e.optionValue))
          .toList();

      final customOptions = configurableOptions
          .where((e) => e.isCustomOption)
          .map((e) => MOption(optionId: e.optionId, optionValue: e.optionValue))
          .toList();

      if (configOptions.isNotEmpty || customOptions.isNotEmpty) {
        productOption = ProductOption(
          extensionAttributes: ExtensionAttributes(
            configurableItemOptions: configOptions.isNotEmpty
                ? configOptions
                : null,
            customOptions: customOptions.isNotEmpty ? customOptions : null,
          ),
        );
      }
    }

    final request = AddCartItemRequest(
      cartItem: CartItem(
        sku: sku,
        qty: qty,
        quoteId: quoteId,
        productType: productType,
        productOption: productOption,
      ),
    );

    final result = await apiService.addItem(request: request);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Updates the quantity of an existing line item in the customer's cart.
  @override
  Future<Either<AppErrorEntity, CartItemEntity>> updateItem({
    required int itemId,
    required int qty,
    required String quoteId,
  }) async {
    final result = await apiService.updateItem(
      itemId: itemId,
      qty: qty,
      quoteId: quoteId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Removes an item from the customer's cart.
  @override
  Future<Either<AppErrorEntity, bool>> deleteItem({required int itemId}) async {
    final result = await apiService.deleteItem(itemId: itemId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Applies a promotional coupon code to the specified cart quote.
  @override
  Future<Either<AppErrorEntity, bool>> applyCoupon({
    required String cartId,
    required String coupon,
  }) async {
    final result = await apiService.applyCoupon(cartId: cartId, coupon: coupon);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Removes any active coupon code from the cart quote.
  @override
  Future<Either<AppErrorEntity, bool>> removeCoupon({
    required String cartId,
  }) async {
    final result = await apiService.removeCoupon(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Applies Pickaboo club points deduction to the cart.
  @override
  Future<Either<AppErrorEntity, bool>> applyRewardPoints({
    required String cartId,
    required int pointAmount,
  }) async {
    final result = await apiService.applyRewardPoints(
      cartId: cartId,
      pointAmount: pointAmount,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Empties all items from the active quote.
  @override
  Future<Either<AppErrorEntity, bool>> emptyCart({
    required String quoteId,
  }) async {
    final result = await apiService.emptyCart(quoteId: quoteId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Moves a cart item into the customer's wishlist for later purchase.
  @override
  Future<Either<AppErrorEntity, bool>> saveForLater({
    required int customerId,
    required String cartId,
    required int itemId,
  }) async {
    final result = await apiService.saveForLater(
      customerId: customerId,
      cartId: cartId,
      itemId: itemId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Creates an anonymous guest quote and returns the masked quote ID.
  @override
  Future<Either<AppErrorEntity, String>> createGuestCart() async {
    final result = await apiService.createGuestCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Fetches guest cart contents by [cartId].
  @override
  Future<Either<AppErrorEntity, CartEntity>> getGuestCart({
    required String cartId,
  }) async {
    final result = await apiService.getGuestCart(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Adds an item to an anonymous guest cart quote.
  @override
  Future<Either<AppErrorEntity, CartItemEntity>> addGuestItem({
    required String cartId,
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  }) async {
    ProductOption? productOption;
    if (configurableOptions != null && configurableOptions.isNotEmpty) {
      final configOptions = configurableOptions
          .where((e) => !e.isCustomOption)
          .map((e) => MOption(optionId: e.optionId, optionValue: e.optionValue))
          .toList();

      final customOptions = configurableOptions
          .where((e) => e.isCustomOption)
          .map((e) => MOption(optionId: e.optionId, optionValue: e.optionValue))
          .toList();

      if (configOptions.isNotEmpty || customOptions.isNotEmpty) {
        productOption = ProductOption(
          extensionAttributes: ExtensionAttributes(
            configurableItemOptions: configOptions.isNotEmpty
                ? configOptions
                : null,
            customOptions: customOptions.isNotEmpty ? customOptions : null,
          ),
        );
      }
    }

    final request = AddCartItemRequest(
      cartItem: CartItem(
        sku: sku,
        qty: qty,
        quoteId: quoteId,
        productType: productType,
        productOption: productOption,
      ),
    );

    final result = await apiService.addGuestItem(
      cartId: cartId,
      request: request,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Updates quantity of an item within a guest cart quote.
  @override
  Future<Either<AppErrorEntity, CartItemEntity>> updateGuestItem({
    required String cartId,
    required int itemId,
    required int qty,
    required String quoteId,
  }) async {
    final result = await apiService.updateGuestItem(
      cartId: cartId,
      itemId: itemId,
      qty: qty,
      quoteId: quoteId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Removes an item from an anonymous guest cart.
  @override
  Future<Either<AppErrorEntity, bool>> deleteGuestItem({
    required String cartId,
    required int itemId,
  }) async {
    final result = await apiService.deleteGuestItem(
      cartId: cartId,
      itemId: itemId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Migrates and merges guest cart line items into the customer's authenticated quote upon sign-in.
  @override
  Future<Either<AppErrorEntity, bool>> mergeGuestCart({
    required String guestCartId,
    required int customerId,
    required int storeId,
  }) async {
    final result = await apiService.mergeGuestCart(
      guestCartId: guestCartId,
      customerId: customerId,
      storeId: storeId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Estimates shipping methods and delivery fees for the specified delivery [address].
  @override
  Future<Either<AppErrorEntity, List<ShippingMethodEntity>>>
  estimateShippingMethods({required AddressEntity address}) async {
    final result = await checkoutApiService.estimateShippingMethods(
      address: address,
    );
    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  /// Saves the selected shipping address, carrier code, and shipping method to the quote,
  /// returning available payment methods and updated order totals.
  @override
  Future<Either<AppErrorEntity, PaymentMethodsEntity>> saveShippingInformation({
    required AddressEntity address,
    required String carrierCode,
    required String methodCode,
    AddressEntity? billingAddress,
  }) async {
    final result = await checkoutApiService.saveShippingInformation(
      address: address,
      carrierCode: carrierCode,
      methodCode: methodCode,
      billingAddress: billingAddress,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Retrieves available payment methods and totals for the given [cartId].
  @override
  Future<Either<AppErrorEntity, PaymentMethodsEntity>> getPaymentInfo({
    required String cartId,
  }) async {
    final result = await checkoutApiService.getPaymentInfo(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Selects and locks a payment method on the quote before order placement.
  @override
  Future<Either<AppErrorEntity, bool>> selectPaymentMethod({
    required String cartId,
    required String method,
  }) async {
    final result = await checkoutApiService.selectPaymentMethod(
      cartId: cartId,
      method: method,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Converts the active shopping cart quote into a placed Magento order.
  ///
  /// Returns the newly generated numeric [orderId].
  @override
  Future<Either<AppErrorEntity, String>> placeOrder({
    required String cartId,
    required String paymentMethodCode,
  }) async {
    final result = await checkoutApiService.placeOrder(
      cartId: cartId,
      paymentMethodCode: paymentMethodCode,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Updates payment method and gateway on an existing order (used in retry payment flows).
  @override
  Future<Either<AppErrorEntity, bool>> updateOrderPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  }) async {
    final result = await checkoutApiService.updateOrderPayment(
      orderId: orderId,
      paymentMethod: paymentMethod,
      paymentGateway: paymentGateway,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Confirms that cash on delivery or paid order was acknowledged by the backend.
  @override
  Future<Either<AppErrorEntity, bool>> confirmOrder({
    required String orderId,
  }) async {
    final result = await checkoutApiService.confirmOrder(orderId: orderId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r == 'Success'));
  }

  /// Fetches initial authentication token for bKash payment gateway.
  @override
  Future<Either<AppErrorEntity, String>> bkashGetInitialToken() async {
    final result = await checkoutApiService.bkashGetInitialToken();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Initiates bKash recurring payment agreement creation for 1-click checkout.
  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashCreateAgreement({
    required String idToken,
    required String userId,
    required String returnPath,
  }) async {
    final result = await checkoutApiService.bkashCreateAgreement(
      idToken: idToken,
      userId: userId,
      returnPath: returnPath,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Finalizes and binds the bKash payment agreement after OTP and PIN confirmation.
  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashExecuteAgreement({
    required String idToken,
    required String paymentId,
  }) async {
    final result = await checkoutApiService.bkashExecuteAgreement(
      idToken: idToken,
      paymentId: paymentId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Creates a bKash payment charge using either standard gateway or a saved [agreementId].
  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashCreatePayment({
    required String idToken,
    required String agreementId,
    required String amount,
    required String orderId,
    required String returnPath,
  }) async {
    final result = await checkoutApiService.bkashCreatePayment(
      idToken: idToken,
      agreementId: agreementId,
      amount: amount,
      orderId: orderId,
      returnPath: returnPath,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Executes and settles a bKash payment charge.
  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashExecutePayment({
    required String idToken,
    required String paymentId,
  }) async {
    final result = await checkoutApiService.bkashExecutePayment(
      idToken: idToken,
      paymentId: paymentId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Initializes digital payment gateway order and retrieves redirection gateway URL.
  @override
  Future<Either<AppErrorEntity, String>> createDigitalOrder({
    required String orderId,
    required String paymentMethodCode,
    String? paymentGateway,
    String? returnPath,
  }) async {
    final result = await checkoutApiService.createDigitalOrder(
      orderId: orderId,
      paymentMethodCode: paymentMethodCode,
      paymentGateway: paymentGateway,
      returnPath: returnPath,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Persists a verified bKash agreement to customer profile for future 1-click checkout.
  @override
  Future<Either<AppErrorEntity, bool>> bkashAgreementSave({
    required String orderId,
    required String paymentId,
    required String trxId,
    required String phoneNumber,
    required String agreementId,
    required String userId,
    bool isSaved = false,
  }) async {
    final result = await checkoutApiService.bkashAgreementSave(
      orderId: orderId,
      paymentId: paymentId,
      trxId: trxId,
      phoneNumber: phoneNumber,
      agreementId: agreementId,
      userId: userId,
      isSaved: isSaved,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Initiates Eastern Bank Limited (EBL) Mastercard/Visa payment session.
  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> createEblOrder({
    required String orderId,
  }) async {
    final result = await checkoutApiService.createEblOrder(orderId: orderId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Fetches bank EMI installment plans and tenures for the quote.
  @override
  Future<Either<AppErrorEntity, CheckoutEmiEntity>> getEmiDetails({
    required String quoteId,
    required String orderId,
  }) async {
    final result = await checkoutApiService.getEmiDetails(
      quoteId: quoteId,
      orderId: orderId,
    );
    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.toEntity()),
    );
  }

  /// Updates quote with chosen Bank EMI installment tenure and bank name.
  @override
  Future<Either<AppErrorEntity, bool>> updateEmiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  }) async {
    final result = await checkoutApiService.updateEmiQuote(
      quoteId: quoteId,
      orderId: orderId,
      bankName: bankName,
      tenureMonths: tenureMonths,
      paymentMethod: paymentMethod,
      paymentMode: paymentMode,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Fetches Consumer EMI (CEMI) details and eligible installment plans.
  @override
  Future<Either<AppErrorEntity, CheckoutEmiEntity>> getCemiDetails({
    required String quoteId,
    required String orderId,
  }) async {
    final result = await checkoutApiService.getCemiDetails(
      quoteId: quoteId,
      orderId: orderId,
    );
    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.toEntity()),
    );
  }

  /// Updates quote with chosen Consumer EMI (CEMI) tenure and provider parameters.
  @override
  Future<Either<AppErrorEntity, bool>> updateCemiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  }) async {
    final result = await checkoutApiService.updateCemiQuote(
      quoteId: quoteId,
      orderId: orderId,
      bankName: bankName,
      tenureMonths: tenureMonths,
      paymentMethod: paymentMethod,
      paymentMode: paymentMode,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Processes Nagad payment callback parameters after user completes transaction in webview.
  @override
  Future<Either<AppErrorEntity, bool>> nagadFinalizePayment({
    required Map<String, String> callbackParams,
  }) async {
    final result = await checkoutApiService.nagadFinalizePayment(
      callbackParams: callbackParams,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  /// Verifies whether the order is eligible for Card BIN bank discounts.
  @override
  Future<Either<AppErrorEntity, CardBinVerifyEntity>> verifyCardBin({
    required String orderId,
  }) async {
    final result = await checkoutApiService.verifyCardBin(
      orderId: orderId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Applies a bank promotional discount based on the card's 6-digit BIN prefix.
  @override
  Future<Either<AppErrorEntity, CardBinEntity>> applyCardBin({
    required String orderId,
    required String cardBin,
  }) async {
    final result = await checkoutApiService.applyCardBin(
      orderId: orderId,
      cardBin: cardBin,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Removes an applied Card BIN discount from an order.
  @override
  Future<Either<AppErrorEntity, CardBinRemoveEntity>> removeCardBin({
    required String orderId,
  }) async {
    final result = await checkoutApiService.removeCardBin(
      orderId: orderId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  /// Fetches status and active campaigns for Card BIN discount promotions.
  @override
  Future<Either<AppErrorEntity, CardBinStatusEntity>> getCardBinStatus() async {
    final result = await checkoutApiService.getCardBinStatus();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }
}

