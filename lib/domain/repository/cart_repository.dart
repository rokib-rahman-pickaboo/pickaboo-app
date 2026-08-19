import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/api_service/cart_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/checkout/shipping_method_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_status/card_bin_status_entity.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_remove/card_bin_remove_entity.dart';

abstract class CartRepository {
  final CartApiService apiService;

  CartRepository(this.apiService);

  Future<Either<AppErrorEntity, String>> createCart();
  Future<Either<AppErrorEntity, CartEntity>> getBasicCart();
  Future<Either<AppErrorEntity, CheckoutEntity>> getCartCheckout();
  Future<Either<AppErrorEntity, CartItemEntity>> addItem({
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  });
  Future<Either<AppErrorEntity, CartItemEntity>> updateItem({
    required int itemId,
    required int qty,
    required String quoteId,
  });
  Future<Either<AppErrorEntity, bool>> deleteItem({required int itemId});
  Future<Either<AppErrorEntity, bool>> applyCoupon({
    required String cartId,
    required String coupon,
  });
  Future<Either<AppErrorEntity, bool>> removeCoupon({required String cartId});
  Future<Either<AppErrorEntity, bool>> applyRewardPoints({
    required String cartId,
    required int pointAmount,
  });
  Future<Either<AppErrorEntity, bool>> emptyCart({required String quoteId});
  Future<Either<AppErrorEntity, bool>> saveForLater({
    required int customerId,
    required String cartId,
    required int itemId,
  });

  Future<Either<AppErrorEntity, String>> createGuestCart();
  Future<Either<AppErrorEntity, CartEntity>> getGuestCart({
    required String cartId,
  });
  Future<Either<AppErrorEntity, CartItemEntity>> addGuestItem({
    required String cartId,
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  });
  Future<Either<AppErrorEntity, CartItemEntity>> updateGuestItem({
    required String cartId,
    required int itemId,
    required int qty,
    required String quoteId,
  });
  Future<Either<AppErrorEntity, bool>> deleteGuestItem({
    required String cartId,
    required int itemId,
  });

  Future<Either<AppErrorEntity, bool>> mergeGuestCart({
    required String guestCartId,
    required int customerId,
    required int storeId,
  });

  Future<Either<AppErrorEntity, List<ShippingMethodEntity>>>
  estimateShippingMethods({required AddressEntity address});

  Future<Either<AppErrorEntity, PaymentMethodsEntity>> saveShippingInformation({
    required AddressEntity address,
    required String carrierCode,
    required String methodCode,
    AddressEntity? billingAddress,
  });

  Future<Either<AppErrorEntity, PaymentMethodsEntity>> getPaymentInfo({
    required String cartId,
  });

  Future<Either<AppErrorEntity, bool>> selectPaymentMethod({
    required String cartId,
    required String method,
  });

  Future<Either<AppErrorEntity, String>> placeOrder({
    required String cartId,
    required String paymentMethodCode,
  });

  Future<Either<AppErrorEntity, bool>> updateOrderPayment({
    required String orderId,
    required String paymentMethod,
    String? paymentGateway,
  });

  Future<Either<AppErrorEntity, bool>> confirmOrder({required String orderId});

  Future<Either<AppErrorEntity, String>> bkashGetInitialToken();

  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashCreateAgreement({
    required String idToken,
    required String userId,
    required String returnPath,
  });

  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashExecuteAgreement({
    required String idToken,
    required String paymentId,
  });

  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashCreatePayment({
    required String idToken,
    required String agreementId,
    required String amount,
    required String orderId,
    required String returnPath,
  });

  Future<Either<AppErrorEntity, Map<String, dynamic>>> bkashExecutePayment({
    required String idToken,
    required String paymentId,
  });

  Future<Either<AppErrorEntity, bool>> bkashAgreementSave({
    required String orderId,
    required String paymentId,
    required String trxId,
    required String phoneNumber,
    required String agreementId,
    required String userId,
    bool isSaved = false,
  });

  Future<Either<AppErrorEntity, Map<String, dynamic>>> createEblOrder({
    required String orderId,
  });

  Future<Either<AppErrorEntity, String>> createDigitalOrder({
    required String orderId,
    required String paymentMethodCode,
    String? paymentGateway,
    String? returnPath,
  });

  Future<Either<AppErrorEntity, CheckoutEmiEntity>> getEmiDetails({
    required String quoteId,
    required String orderId,
  });

  Future<Either<AppErrorEntity, bool>> updateEmiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  });

  Future<Either<AppErrorEntity, CheckoutEmiEntity>> getCemiDetails({
    required String quoteId,
    required String orderId,
  });

  Future<Either<AppErrorEntity, bool>> updateCemiQuote({
    required String quoteId,
    required String orderId,
    required String bankName,
    required String tenureMonths,
    required String paymentMethod,
    required String paymentMode,
  });

  Future<Either<AppErrorEntity, bool>> nagadFinalizePayment({
    required Map<String, String> callbackParams,
  });

  Future<Either<AppErrorEntity, CardBinVerifyEntity>> verifyCardBin({
    required String orderId,
  });

  Future<Either<AppErrorEntity, CardBinEntity>> applyCardBin({
    required String orderId,
    required String cardBin,
  });

  Future<Either<AppErrorEntity, CardBinRemoveEntity>> removeCardBin({
    required String orderId,
  });

  Future<Either<AppErrorEntity, CardBinStatusEntity>> getCardBinStatus();
}
