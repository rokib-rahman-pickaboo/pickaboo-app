import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockRepository;
  late WriteReviewBloc bloc;

  setUp(() {
    mockRepository = MockProductRepository();
    bloc = WriteReviewBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('WriteReviewBloc', () {
    test('initial state is correct', () {
      expect(bloc.state, const WriteReviewState.initial());
    });

    blocTest<WriteReviewBloc, WriteReviewState>(
      'emits [loading, success] when submitReview is successful',
      build: () {
        when(() => mockRepository.submitReview(
              productId: any(named: 'productId'),
              detail: any(named: 'detail'),
              ratings: any(named: 'ratings'),
              imagePaths: any(named: 'imagePaths'),
            )).thenAnswer((_) async => const Right(true));
        return bloc;
      },
      seed: () => const WriteReviewState.initial(
        reviewText: 'Great product',
      ),
      act: (bloc) => bloc.add(const WriteReviewEvent.submitReview('123')),
      expect: () => [
        const WriteReviewState.loading(),
        const WriteReviewState.success(),
      ],
      verify: (_) {
        verify(() => mockRepository.submitReview(
              productId: '123',
              detail: 'Great product',
              ratings: [
                {'rating_name': 'Price', 'value': 5},
                {'rating_name': 'Value', 'value': 5},
                {'rating_name': 'Quality', 'value': 5},
                {'rating_name': 'Service', 'value': 5},
              ],
              imagePaths: [],
            )).called(1);
      },
    );

    blocTest<WriteReviewBloc, WriteReviewState>(
      'emits [error] when reviewText is empty',
      build: () => bloc,
      seed: () => const WriteReviewState.initial(
        reviewText: '',
      ),
      act: (bloc) => bloc.add(const WriteReviewEvent.submitReview('123')),
      expect: () => [
        const WriteReviewState.error('Please enter a review'),
        const WriteReviewState.initial(reviewText: ''),
      ],
    );

    blocTest<WriteReviewBloc, WriteReviewState>(
      'emits [loading, error, initial] when submitReview fails',
      build: () {
        when(() => mockRepository.submitReview(
              productId: any(named: 'productId'),
              detail: any(named: 'detail'),
              ratings: any(named: 'ratings'),
              imagePaths: any(named: 'imagePaths'),
            )).thenAnswer((_) async => const Left(AppErrorEntity(message: 'Failed to submit')));
        return bloc;
      },
      seed: () => const WriteReviewState.initial(
        reviewText: 'Great product',
      ),
      act: (bloc) => bloc.add(const WriteReviewEvent.submitReview('123')),
      expect: () => [
        const WriteReviewState.loading(),
        const WriteReviewState.error('Failed to submit'),
        const WriteReviewState.initial(reviewText: 'Great product'),
      ],
    );
  });
}
