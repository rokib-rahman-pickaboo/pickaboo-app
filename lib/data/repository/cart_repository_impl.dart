import 'package:flutter/foundation.dart';
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

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  @override
  final CartApiService apiService;
  final CheckoutApiService checkoutApiService;
  CartRepositoryImpl(this.apiService, this.checkoutApiService);

  @override
  Future<Either<AppErrorEntity, String>> createCart() async {
    final result = await apiService.createCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, CartEntity>> getBasicCart() async {
    final result = await apiService.getBasicCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, CheckoutEntity>> getCartCheckout() async {
    final result = await apiService.getCartCheckout();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

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

  @override
  Future<Either<AppErrorEntity, bool>> deleteItem({required int itemId}) async {
    final result = await apiService.deleteItem(itemId: itemId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, bool>> applyCoupon({
    required String cartId,
    required String coupon,
  }) async {
    final result = await apiService.applyCoupon(cartId: cartId, coupon: coupon);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, bool>> removeCoupon({
    required String cartId,
  }) async {
    final result = await apiService.removeCoupon(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

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

  @override
  Future<Either<AppErrorEntity, bool>> emptyCart({
    required String quoteId,
  }) async {
    final result = await apiService.emptyCart(quoteId: quoteId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

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

  @override
  Future<Either<AppErrorEntity, String>> createGuestCart() async {
    final result = await apiService.createGuestCart();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, CartEntity>> getGuestCart({
    required String cartId,
  }) async {
    final result = await apiService.getGuestCart(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

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

  @override
  Future<Either<AppErrorEntity, List<ShippingMethodEntity>>>
  estimateShippingMethods({required AddressEntity address}) async {
    debugPrint(
      "🔵 Repo IS calling estimateShippingMethods with address ID: ${address.id}, City: ${address.city}",
    );
    final result = await checkoutApiService.estimateShippingMethods(
      address: address,
    );
    return result.fold(
      (l) => left(l.toEntity()),
      (r) => right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<AppErrorEntity, PaymentMethodsEntity>> saveShippingInformation({
    required AddressEntity address,
    required String carrierCode,
    required String methodCode,
    AddressEntity? billingAddress,
  }) async {
    debugPrint(
      "ShippingInformationd: ${address.id}, Billing ID: ${billingAddress?.id}, Method: $carrierCode _ $methodCode",
    );
    final result = await checkoutApiService.saveShippingInformation(
      address: address,
      carrierCode: carrierCode,
      methodCode: methodCode,
      billingAddress: billingAddress,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, PaymentMethodsEntity>> getPaymentInfo({
    required String cartId,
  }) async {
    final result = await checkoutApiService.getPaymentInfo(cartId: cartId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

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

  @override
  Future<Either<AppErrorEntity, bool>> confirmOrder({
    required String orderId,
  }) async {
    final result = await checkoutApiService.confirmOrder(orderId: orderId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r == 'Success'));
  }

  @override
  Future<Either<AppErrorEntity, String>> bkashGetInitialToken() async {
    final result = await checkoutApiService.bkashGetInitialToken();
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

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

  @override
  Future<Either<AppErrorEntity, Map<String, dynamic>>> createEblOrder({
    required String orderId,
  }) async {
    final result = await checkoutApiService.createEblOrder(orderId: orderId);
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

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

  @override
  Future<Either<AppErrorEntity, bool>> nagadFinalizePayment({
    required Map<String, String> callbackParams,
  }) async {
    final result = await checkoutApiService.nagadFinalizePayment(
      callbackParams: callbackParams,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r));
  }

  @override
  Future<Either<AppErrorEntity, CardBinVerifyEntity>> verifyCardBin({
    required String orderId,
  }) async {
    final result = await checkoutApiService.verifyCardBin(
      orderId: orderId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

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

  @override
  Future<Either<AppErrorEntity, CardBinRemoveEntity>> removeCardBin({
    required String orderId,
  }) async {
    final result = await checkoutApiService.removeCardBin(
      orderId: orderId,
    );
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }

  @override
  Future<Either<AppErrorEntity, CardBinStatusEntity>> getCardBinStatus() async {
    final result = await checkoutApiService.getCardBinStatus();
    return result.fold((l) => left(l.toEntity()), (r) => right(r.toEntity()));
  }
}
