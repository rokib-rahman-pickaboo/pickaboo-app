import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cms_block/cms_block_entity.dart';

part 'cms_content_event.dart';
part 'cms_content_state.dart';
part 'cms_content_bloc.freezed.dart';

@injectable
class CmsContentBloc extends Bloc<CmsContentEvent, CmsContentState> {
  final ProductApiService apiService;

  static CmsContentState? _memoryCache;
  static DateTime? _lastFetchedTime;
  static const Duration _cacheDuration = Duration(hours: 1);

  /// Clears the global in-memory CMS cache (useful for tests or logout/refresh).
  static void clearCache() {
    _memoryCache = null;
    _lastFetchedTime = null;
  }

  /// Whether the cache is populated and has not expired.
  static bool get isCacheValid {
    if (_memoryCache == null || _lastFetchedTime == null) return false;
    return DateTime.now().difference(_lastFetchedTime!) < _cacheDuration;
  }

  CmsContentBloc(this.apiService)
    : super(
        _memoryCache ??
        const CmsContentState(
          productOffer: null,
          priceGuarantee: null,
          priceGuaranteeTc: null,
          pickabooVerified: null,
          expressDelivery: null,
          isLoading: false,
          error: null,
        ),
      ) {
    on<_LoadAll>(_onLoadAll);
    on<_LoadBlock>(_onLoadBlock);
  }

  Future<void> _onLoadAll(_LoadAll event, Emitter<CmsContentState> emit) async {
    // If cache is still fresh, serve it immediately without firing 5 network requests
    if (isCacheValid && _memoryCache != null) {
      if (state != _memoryCache) {
        emit(_memoryCache!);
      }
      return;
    }

    emit(state.copyWith(isLoading: _memoryCache == null, error: null));

    final results = await Future.wait([
      apiService.getCmsBlock(blockUrl: ApiEndpoints.productOfferUrl),
      apiService.getCmsBlock(blockUrl: ApiEndpoints.priceGuaranteeUrl),
      apiService.getCmsBlock(blockUrl: ApiEndpoints.priceGuaranteeTcUrl),
      apiService.getCmsBlock(blockUrl: ApiEndpoints.pickabooVerifiedUrl),
      apiService.getCmsBlock(blockUrl: ApiEndpoints.expressDeliveryUrl),
    ]);

    CmsBlockEntity? productOffer;
    CmsBlockEntity? priceGuarantee;
    CmsBlockEntity? priceGuaranteeTc;
    CmsBlockEntity? pickabooVerified;
    CmsBlockEntity? expressDelivery;

    results[0].fold((_) {}, (block) => productOffer = _mapToEntity(block));
    results[1].fold((_) {}, (block) => priceGuarantee = _mapToEntity(block));
    results[2].fold((_) {}, (block) => priceGuaranteeTc = _mapToEntity(block));
    results[3].fold((_) {}, (block) => pickabooVerified = _mapToEntity(block));
    results[4].fold((_) {}, (block) => expressDelivery = _mapToEntity(block));

    final newState = state.copyWith(
      productOffer: productOffer,
      priceGuarantee: priceGuarantee,
      priceGuaranteeTc: priceGuaranteeTc,
      pickabooVerified: pickabooVerified,
      expressDelivery: expressDelivery,
      isLoading: false,
    );

    _memoryCache = newState;
    _lastFetchedTime = DateTime.now();

    emit(newState);
  }

  Future<void> _onLoadBlock(
    _LoadBlock event,
    Emitter<CmsContentState> emit,
  ) async {
    final blockUrl = _getBlockUrl(event.blockType);
    final result = await apiService.getCmsBlock(blockUrl: blockUrl);

    result.fold(
      (error) => emit(
        state.copyWith(
          error: AppErrorEntity(
            message: error.message ?? 'Failed to load content',
          ),
        ),
      ),
      (block) {
        final entity = _mapToEntity(block);
        switch (event.blockType) {
          case CmsBlockType.productOffer:
            emit(state.copyWith(productOffer: entity));
            break;
          case CmsBlockType.priceGuarantee:
            emit(state.copyWith(priceGuarantee: entity));
            break;
          case CmsBlockType.priceGuaranteeTc:
            emit(state.copyWith(priceGuaranteeTc: entity));
            break;
          case CmsBlockType.pickabooVerified:
            emit(state.copyWith(pickabooVerified: entity));
            break;
          case CmsBlockType.expressDelivery:
            emit(state.copyWith(expressDelivery: entity));
            break;
        }
      },
    );
  }

  CmsBlockEntity _mapToEntity(dynamic block) {
    return CmsBlockEntity(
      id: block.id ?? 0,
      identifier: block.identifier ?? '',
      title: block.title ?? '',
      content: block.content ?? '',
      active: block.active ?? false,
      creationTime: block.creationTime ?? '',
      updateTime: block.updateTime ?? '',
    );
  }

  String _getBlockUrl(CmsBlockType type) {
    switch (type) {
      case CmsBlockType.productOffer:
        return ApiEndpoints.productOfferUrl;
      case CmsBlockType.priceGuarantee:
        return ApiEndpoints.priceGuaranteeUrl;
      case CmsBlockType.priceGuaranteeTc:
        return ApiEndpoints.priceGuaranteeTcUrl;
      case CmsBlockType.pickabooVerified:
        return ApiEndpoints.pickabooVerifiedUrl;
      case CmsBlockType.expressDelivery:
        return ApiEndpoints.expressDeliveryUrl;
    }
  }
}
