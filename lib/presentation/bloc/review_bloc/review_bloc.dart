import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/review/product_reviews_entity.dart';
import 'package:pickaboo/domain/entity/review/review_entity.dart';
import 'package:pickaboo/domain/entity/user_review/user_review_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';

@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ProductRepository repository;
  final AuthCacheManager _cacheManager;

  static const int _pageSize = 10;

  ReviewBloc(this.repository, this._cacheManager)
    : super(ReviewState(pagingState: PagingState())) {
    on<_Load>(_onLoad, transformer: sequential());
    on<_Refresh>(_onRefresh, transformer: sequential());
    on<_VoteHelpful>(_onVoteHelpful);
    on<_VoteNotHelpful>(_onVoteNotHelpful);
    on<_GetUserReviews>(_onGetUserReviews);
  }

  Future<void> _onLoad(_Load event, Emitter<ReviewState> emit) async {
    final currentState = state.pagingState;
    final int nextPageKey = (currentState.keys?.last ?? 0) + 1;

    if (currentState.isLoading || !currentState.hasNextPage) {
      return;
    }

    emit(
      state.copyWith(
        pagingState: currentState.copyWith(isLoading: true, error: null),
      ),
    );

    final result = await repository.getProductReviews(
      productId: event.productId,
      page: nextPageKey,
      pageSize: _pageSize,
      customerId: await _customerId(),
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          pagingState: currentState.copyWith(isLoading: false, error: error),
        ),
      ),
      (response) {
        final newItems = response.reviews;
        final bool isLastPage =
            newItems.isEmpty ||
            (response.totalPages > 0
                ? nextPageKey >= response.totalPages
                : newItems.length < _pageSize);

        emit(
          state.copyWith(
            summary: nextPageKey == 1 ? response : state.summary,
            pagingState: currentState.copyWith(
              isLoading: false,
              hasNextPage: !isLastPage,
              error: null,
              pages: [...currentState.pages ?? [], newItems],
              keys: [...currentState.keys ?? [], nextPageKey],
            ),
          ),
        );
      },
    );
  }

  Future<int?> _customerId() async {
    final raw = await _cacheManager.getUserId();
    if (raw == null || raw.isEmpty) return null;
    return int.tryParse(raw);
  }

  Future<void> _onRefresh(_Refresh event, Emitter<ReviewState> emit) async {
    emit(state.copyWith(pagingState: PagingState(), summary: null));
    add(ReviewEvent.load(productId: event.productId));
  }

  Future<void> _onVoteHelpful(
    _VoteHelpful event,
    Emitter<ReviewState> emit,
  ) async {
    await _vote(event.productId, event.reviewId, 'plus', emit);
  }

  Future<void> _onVoteNotHelpful(
    _VoteNotHelpful event,
    Emitter<ReviewState> emit,
  ) async {
    await _vote(event.productId, event.reviewId, 'minus', emit);
  }

  Future<void> _vote(
    String productId,
    String reviewId,
    String voteType,
    Emitter<ReviewState> emit,
  ) async {
    final pages = state.pagingState.pages;
    if (pages == null || pages.isEmpty) return;

    final current = _findReview(pages, reviewId);
    if (current == null) return;

    final isLike = voteType == 'plus';

    if (isLike && current.doLike) return;
    if (!isLike && current.doDislike) return;

    emit(state.copyWith(votingReviewId: reviewId, voteError: null));

    final result = await repository.voteReview(
      productId: productId,
      reviewId: reviewId,
      voteType: voteType,
    );

    result.fold(
      (error) => emit(
        state.copyWith(
          votingReviewId: null,
          voteError: AppErrorEntity(message: error.message),
        ),
      ),
      (_) {
        final updatedPages = pages
            .map(
              (page) => page
                  .map(
                    (review) => review.reviewId == reviewId
                        ? _applyVote(review, isLike: isLike)
                        : review,
                  )
                  .toList(),
            )
            .toList();

        emit(
          state.copyWith(
            votingReviewId: null,
            pagingState: state.pagingState.copyWith(pages: updatedPages),
          ),
        );
      },
    );
  }

  ReviewEntity? _findReview(List<List<ReviewEntity>> pages, String reviewId) {
    for (final page in pages) {
      for (final review in page) {
        if (review.reviewId == reviewId) return review;
      }
    }
    return null;
  }

  ReviewEntity _applyVote(ReviewEntity review, {required bool isLike}) {
    final switchingFromLike = !isLike && review.doLike;
    final switchingFromDislike = isLike && review.doDislike;

    final likeCount = isLike
        ? review.likeCount + 1
        : (switchingFromLike ? review.likeCount - 1 : review.likeCount);
    final dislikesCount = isLike
        ? (switchingFromDislike
              ? review.dislikesCount - 1
              : review.dislikesCount)
        : review.dislikesCount + 1;

    return review.copyWith(
      likeCount: likeCount < 0 ? 0 : likeCount,
      dislikesCount: dislikesCount < 0 ? 0 : dislikesCount,
      doLike: isLike,
      doDislike: !isLike,
    );
  }

  Future<void> _onGetUserReviews(
    _GetUserReviews event,
    Emitter<ReviewState> emit,
  ) async {
    emit(
      state.copyWith(isUserReviewsLoading: true, userReviewsError: null),
    );

    final result = await repository.getUserReviews();

    result.fold(
      (error) => emit(
        state.copyWith(
          isUserReviewsLoading: false,
          userReviewsError: AppErrorEntity(message: error.message),
        ),
      ),
      (reviews) => emit(
        state.copyWith(isUserReviewsLoading: false, userReviews: reviews),
      ),
    );
  }
}
