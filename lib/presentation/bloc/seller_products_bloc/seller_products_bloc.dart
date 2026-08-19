import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/seller_products/seller_products_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'seller_products_event.dart';
part 'seller_products_state.dart';
part 'seller_products_bloc.freezed.dart';

@injectable
class SellerProductsBloc
    extends Bloc<SellerProductsEvent, SellerProductsState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;

  static const int _pageSize = 10;

  SellerProductsBloc(this.repository, this._analytics)
    : super(SellerProductsState(pagingState: PagingState())) {
    on<_GetProducts>(_onGetProducts);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onGetProducts(
    _GetProducts event,
    Emitter<SellerProductsState> emit,
  ) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(state.copyWith(pagingState: currentState.copyWith(isLoading: true)));

    final result = await repository.getSellerProducts(
      shopUrl: event.shopUrl,
      currentPage: nextPageKey,
      pageSize: _pageSize,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.isEmpty || newItems.length < _pageSize;

        final sellerData = nextPageKey == 1 ? response : state.sellerData;

        if (nextPageKey == 1) {
          _analytics.logEvent(
            name: 'view_item_list',
            parameters: {
              'item_list_id': event.shopUrl,
              'item_list_name': response.vendorName,
            },
          );
        }

        emit(
          state.copyWith(
            sellerData: sellerData,
            pagingState: currentState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [...currentState.pages ?? [], newItems],
              keys: [...currentState.keys ?? [], nextPageKey],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(
    _Refresh event,
    Emitter<SellerProductsState> emit,
  ) async {
    emit(state.copyWith(pagingState: PagingState(), sellerData: null));
    add(SellerProductsEvent.getProducts(shopUrl: event.shopUrl));
  }
}
