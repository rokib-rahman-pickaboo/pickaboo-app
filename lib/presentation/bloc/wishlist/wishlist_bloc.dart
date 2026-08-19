import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/repository/wishlist_repository.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_state.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

export 'wishlist_event.dart';
export 'wishlist_state.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository _repository;
  final AnalyticsService _analytics;

  WishlistBloc(this._repository, this._analytics)
    : super(const WishlistState.initial()) {
    on<Started>(_onStarted);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  Future<void> _onStarted(Started event, Emitter<WishlistState> emit) async {
    emit(const WishlistState.loading());
    final result = await _repository.getWishlist();
    result.fold(
      (error) => emit(
        WishlistState.error(
          error.message ?? 'Failed to load wishlist',
        ),
      ),
      (items) => emit(WishlistState.loaded(items)),
    );
  }

  Future<void> _onAddToWishlist(
    AddToWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistState.loading());
    final result = await _repository.addToWishlist(event.productId);

    result.fold(
      (error) {
        emit(
          WishlistState.error(
            error.message ?? 'Failed to add to wishlist',
          ),
        );
      },
      (success) {
        if (success) {
          _analytics.logAddToWishlist(id: event.productId.toString());
          emit(
            const WishlistState.actionSuccess(
              'Product added to wishlist successfully.',
            ),
          );
          add(const WishlistEvent.started());
        } else {
          emit(const WishlistState.error('Failed to add to wishlist'));
        }
      },
    );
  }

  Future<void> _onRemoveFromWishlist(
    RemoveFromWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(const WishlistState.loading());
    final result = await _repository.removeFromWishlist(event.productId);

    result.fold(
      (error) => emit(
        WishlistState.error(
          error.message ?? 'Failed to remove from wishlist',
        ),
      ),
      (success) {
        if (success) {
          emit(
            const WishlistState.actionSuccess(
              'Product removed from wishlist successfully.',
            ),
          );
          add(const WishlistEvent.started());
        } else {
          emit(
            const WishlistState.error(
              'Failed to remove from wishlist',
            ),
          );
        }
      },
    );
  }
}
