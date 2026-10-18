import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';
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

  List<WishlistEntity>? _cachedItems;
  List<WishlistEntity>? get cachedItems => _cachedItems;

  WishlistBloc(this._repository, this._analytics)
    : super(const WishlistState.initial()) {
    on<Started>(_onStarted);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  Future<void> _onStarted(Started event, Emitter<WishlistState> emit) async {
    if (_cachedItems == null) {
      emit(const WishlistState.loading());
    }
    final result = await _repository.getWishlist();
    result.fold(
      (error) {
        if (_cachedItems == null) {
          emit(
            WishlistState.error(
              error.message ?? 'Failed to load wishlist',
            ),
          );
        }
      },
      (items) {
        _cachedItems = items;
        emit(WishlistState.loaded(items));
      },
    );
  }

  Future<void> _onAddToWishlist(
    AddToWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    final result = await _repository.addToWishlist(event.productId);

    result.fold(
      (error) {
        emit(
          WishlistState.error(
            error.message ?? 'Failed to add to wishlist',
          ),
        );
      },
      (success) async {
        if (success) {
          _analytics.logAddToWishlist(id: event.productId.toString());
          emit(
            const WishlistState.actionSuccess(
              'Product added to wishlist successfully.',
            ),
          );
          final refreshResult = await _repository.getWishlist();
          refreshResult.fold(
            (_) {},
            (items) {
              _cachedItems = items;
              emit(WishlistState.loaded(items));
            },
          );
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
    final previousItems = _cachedItems;

    // Optimistically update memory and UI immediately
    if (previousItems != null) {
      _cachedItems = previousItems
          .where((item) => item.productId != event.productId)
          .toList();
      emit(WishlistState.loaded(_cachedItems!));
    }

    final result = await _repository.removeFromWishlist(event.productId);

    result.fold(
      (error) {
        // Rollback on error
        if (previousItems != null) {
          _cachedItems = previousItems;
          emit(WishlistState.loaded(previousItems));
        }
        emit(
          WishlistState.error(
            error.message ?? 'Failed to remove from wishlist',
          ),
        );
      },
      (success) async {
        if (success) {
          emit(
            const WishlistState.actionSuccess(
              'Product removed from wishlist successfully.',
            ),
          );
          // Silently sync server state
          final refreshResult = await _repository.getWishlist();
          refreshResult.fold(
            (_) {},
            (items) {
              _cachedItems = items;
              emit(WishlistState.loaded(items));
            },
          );
        } else {
          if (previousItems != null) {
            _cachedItems = previousItems;
            emit(WishlistState.loaded(previousItems));
          }
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
