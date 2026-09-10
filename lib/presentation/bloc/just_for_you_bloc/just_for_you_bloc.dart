import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'just_for_you_event.dart';

part 'just_for_you_state.dart';

part 'just_for_you_bloc.freezed.dart';

@injectable
class JustForYouBloc extends Bloc<JustForYouEvent, JustForYouState> {
  final ProductRepository repository;
  final AnalyticsService _analytics;

  static const int _productLimit = 10;

  JustForYouBloc(this.repository, this._analytics)
    : super(JustForYouState(pagingState: PagingState())) {
    on<_GetProduct>(_onGetProducts);
    on<_Refresh>(_onRefresh);
  }

  Future<void> _onGetProducts(
    _GetProduct event,
    Emitter<JustForYouState> emit,
  ) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(state.copyWith(pagingState: currentState.copyWith(isLoading: true)));

    final result = await repository.getJustForYouProducts(
      currentPage: nextPageKey,
      productLimit: _productLimit,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
        ),
      ),
      (response) {
        final newItems = response.products;
        final bool isLastPage = newItems.length < _productLimit;

        if (nextPageKey == 1 && newItems.isNotEmpty) {
          _analytics.logEvent(
            name: 'view_item_list',
            parameters: {
              'item_list_id': 'just_for_you',
              'item_list_name': 'Just For You',
            },
          );
        }

        emit(
          state.copyWith(
            pagingState: currentState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              pages: [
                ...currentState.pages ?? [],
                if (newItems.isNotEmpty) newItems,
              ],
              keys: [
                ...currentState.keys ?? [],
                if (newItems.isNotEmpty) nextPageKey,
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh(_Refresh event, Emitter<JustForYouState> emit) async {
    emit(state.copyWith(pagingState: PagingState()));
    add(const JustForYouEvent.getProducts());
  }
}
