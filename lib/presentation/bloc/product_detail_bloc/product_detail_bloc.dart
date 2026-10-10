import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';
part 'product_detail_bloc.freezed.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;
  final AuthCacheManager _cacheManager;

  ProductDetailBloc(this.repository, this._analytics, this._cacheManager)
    : super(const ProductDetailState.initial()) {
    on<_Load>(_onLoad);
    on<_Refresh>(_onRefresh);
  }

  Future<int?> _getCustomerId() async {
    final raw = await _cacheManager.getUserId();
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final parsed = int.tryParse(raw);
    return parsed;
  }

  Future<String?> _resolveProductId(
    String productId,
    Emitter<ProductDetailState> emit,
  ) async {
    if (productId.isEmpty) {
      emit(const ProductDetailState.error(
        AppErrorEntity(message: 'Invalid product ID'),
      ));
      return null;
    }

    if (int.tryParse(productId) != null) return productId;

    final resolution = await repository.resolveSlug(
      slug: productId,
      type: 'product',
    );

    final resolvedId = resolution.fold((l) => null, (r) => r.id);

    if (resolvedId == null || resolvedId.isEmpty) {
      emit(const ProductDetailState.error(
        AppErrorEntity(message: 'Could not resolve product link'),
      ));
      return null;
    }

    return resolvedId;
  }

  Future<void> _onLoad(_Load event, Emitter<ProductDetailState> emit) async {
    // 1. Instant Frame 0 hydration from preview product if available
    if (event.initialProduct != null) {
      emit(ProductDetailState.loaded(
        ProductDetailEntity.fromProductEntity(event.initialProduct!),
      ));
    } else {
      emit(const ProductDetailState.loading());
    }

    // Fast path: bypass slug resolution if productId is numeric or initialProduct has a numeric id
    String? productId;
    if (int.tryParse(event.productId) != null) {
      productId = event.productId;
    } else if (event.initialProduct != null &&
        event.initialProduct!.id.isNotEmpty &&
        int.tryParse(event.initialProduct!.id) != null) {
      productId = event.initialProduct!.id;
    } else {
      productId = await _resolveProductId(event.productId, emit);
    }
    if (productId == null) return;

    // Retrieve customerId instantly from memory cache
    final customerId = await _getCustomerId();

    // Launch network request immediately without waiting for disk Hive cache
    final networkFuture = repository.getProductDetail(
      productId: productId,
      customerId: customerId,
    );

    // Concurrently check local in-memory/Hive cache for instant SWR hydration
    final cachedResult = await repository.getSavedProductDetail(productId: productId);
    cachedResult.fold((_) {}, (cachedProduct) {
      if (cachedProduct != null) {
        emit(ProductDetailState.loaded(cachedProduct));
      }
    });

    final result = await networkFuture;

    result.fold(
      (error) {
        final currentProduct = state.maybeWhen(
          loaded: (p) => p,
          orElse: () => null,
        );
        if (currentProduct == null || currentProduct.isPartial) {
          emit(ProductDetailState.error(error));
        }
      },
      (product) {
        final effectivePrice = (product.spacialPrice > 0
                ? product.spacialPrice
                : product.regularPrice)
            .toDouble();
        _analytics.logViewItem(
          id: product.id.toString(),
          name: product.name,
          price: effectivePrice,
          category: product.categoryIds.isNotEmpty ? product.categoryIds.first : null,
          categoryId: product.categoryIds.isNotEmpty ? product.categoryIds.first : null,
          brand: product.brand.isNotEmpty ? product.brand : null,
          brandId: product.brandId.isNotEmpty ? product.brandId : null,
        );
        emit(ProductDetailState.loaded(product));
      },
    );
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<ProductDetailState> emit,
  ) async {
    final productId = await _resolveProductId(event.productId, emit);
    if (productId == null) return;

    final customerId = await _getCustomerId();

    final result = await repository.getProductDetail(
      productId: productId,
      customerId: customerId,
    );

    result.fold(
      (error) {
        state.maybeWhen(
          loaded: (_) {},
          orElse: () => emit(ProductDetailState.error(error)),
        );
      },
      (product) => emit(ProductDetailState.loaded(product)),
    );
  }

}
