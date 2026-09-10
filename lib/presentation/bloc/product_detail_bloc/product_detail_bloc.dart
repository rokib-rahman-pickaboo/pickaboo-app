import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
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
    if (kDebugMode) {
      print('[ProductDetailBloc] 🔑 _getCustomerId: raw="${raw ?? 'null'}"');
    }
    if (raw == null || raw.isEmpty) {
      if (kDebugMode) {
        print(
          '[ProductDetailBloc] ⚠️  customerId=null — userId not in cache. '
          'User may be logged in but getUserProfile() was never called.',
        );
      }
      return null;
    }
    final parsed = int.tryParse(raw);
    if (kDebugMode) {
      print('[ProductDetailBloc] ✅ customerId=$parsed');
    }
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
    emit(const ProductDetailState.loading());

    final productId = await _resolveProductId(event.productId, emit);
    if (productId == null) return;

    final customerId = await _getCustomerId();
    if (kDebugMode) {
      print(
        '[ProductDetailBloc] _onLoad → productId=$productId  customerId=$customerId',
      );
    }

    final result = await repository.getProductDetail(
      productId: productId,
      customerId: customerId,
    );

    result.fold(
      (error) => emit(ProductDetailState.error(error)),
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
    if (kDebugMode) {
      print(
        '[ProductDetailBloc] _onRefresh → productId=$productId  customerId=$customerId',
      );
    }

    final result = await repository.getProductDetail(
      productId: productId,
      customerId: customerId,
    );

    result.fold(
      (error) => emit(ProductDetailState.error(error)),
      (product) => emit(ProductDetailState.loaded(product)),
    );
  }

}
