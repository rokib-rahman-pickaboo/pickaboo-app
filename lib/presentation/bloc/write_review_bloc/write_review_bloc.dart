import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:pickaboo/domain/repository/product_repository.dart';

part 'write_review_event.dart';
part 'write_review_state.dart';
part 'write_review_bloc.freezed.dart';

@injectable
class WriteReviewBloc extends Bloc<WriteReviewEvent, WriteReviewState> {
  final ProductRepository repository;

  WriteReviewBloc(this.repository) : super(const WriteReviewState.initial()) {
    on<_UpdateRating>(_onUpdateRating);
    on<_UpdateReviewText>(_onUpdateReviewText);
    on<_AddImage>(_onAddImage);
    on<_RemoveImage>(_onRemoveImage);
    on<_UpdateImages>(_onUpdateImages);
    on<_SubmitReview>(_onSubmitReview);
  }

  void _onUpdateImages(_UpdateImages event, Emitter<WriteReviewState> emit) {
    state.mapOrNull(
      initial: (currentState) {
        emit(currentState.copyWith(images: event.images));
      },
    );
  }

  void _onUpdateRating(_UpdateRating event, Emitter<WriteReviewState> emit) {
    state.mapOrNull(
      initial: (currentState) {
        switch (event.dimension) {
          case 'price':
            emit(currentState.copyWith(priceRating: event.rating));
            break;
          case 'value':
            emit(currentState.copyWith(valueRating: event.rating));
            break;
          case 'quality':
            emit(currentState.copyWith(qualityRating: event.rating));
            break;
          case 'service':
            emit(currentState.copyWith(serviceRating: event.rating));
            break;
        }
      },
    );
  }

  void _onUpdateReviewText(
    _UpdateReviewText event,
    Emitter<WriteReviewState> emit,
  ) {
    state.mapOrNull(
      initial: (currentState) {
        emit(currentState.copyWith(reviewText: event.text));
      },
    );
  }

  void _onAddImage(_AddImage event, Emitter<WriteReviewState> emit) {
    state.mapOrNull(
      initial: (currentState) {
        final newImages = List<String>.from(currentState.images)
          ..add(event.path);
        emit(currentState.copyWith(images: newImages));
      },
    );
  }

  void _onRemoveImage(_RemoveImage event, Emitter<WriteReviewState> emit) {
    state.mapOrNull(
      initial: (currentState) {
        final newImages = List<String>.from(currentState.images)
          ..removeAt(event.index);
        emit(currentState.copyWith(images: newImages));
      },
    );
  }

  Future<void> _onSubmitReview(
    _SubmitReview event,
    Emitter<WriteReviewState> emit,
  ) async {
    await state.mapOrNull(
      initial: (currentState) async {
        if (currentState.reviewText.isEmpty) {
          emit(const WriteReviewState.error("Please enter a review"));
          emit(currentState);
          return;
        }

        emit(const WriteReviewState.loading());

        List<Map<String, dynamic>> ratings = [
          {'rating_name': 'Price', 'value': currentState.priceRating},
          {'rating_name': 'Value', 'value': currentState.valueRating},
          {'rating_name': 'Quality', 'value': currentState.qualityRating},
          {'rating_name': 'Service', 'value': currentState.serviceRating},
        ];

        final result = await repository.submitReview(
          productId: event.productId,
          detail: currentState.reviewText,
          ratings: ratings,
          imagePaths: currentState.images,
        );

        result.fold(
          (failure) {
            emit(WriteReviewState.error(failure.message));
            emit(currentState);
          },
          (success) => emit(const WriteReviewState.success()),
        );
      },
    );
  }
}
