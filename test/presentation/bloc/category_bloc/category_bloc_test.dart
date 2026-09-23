import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late CategoryBloc bloc;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    bloc = CategoryBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('CategoryBloc SWR Tests', () {
    const tCachedCategory = CategoryEntity(
      id: '1',
      name: 'Cached Electronics',
      slug: 'electronics',
      isSpecial: false,
      icon: '',
      children: [],
    );

    const tFreshCategory = CategoryEntity(
      id: '1',
      name: 'Fresh Electronics',
      slug: 'electronics',
      isSpecial: false,
      icon: '',
      children: [],
    );

    test('initial state has status initial', () {
      expect(bloc.state.status, CategoryStatus.initial);
      expect(bloc.state.categories, isNull);
    });

    blocTest<CategoryBloc, CategoryState>(
      'SWR: emits cached categories immediately, then updates with fresh network categories',
      build: () {
        when(() => mockRepository.getCachedCategories())
            .thenAnswer((_) async => [tCachedCategory]);
        when(() => mockRepository.getAllCategories(forceRefresh: true))
            .thenAnswer((_) async => const Right([tFreshCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(const CategoryEvent.getCategories()),
      expect: () => [
        const CategoryState(
          status: CategoryStatus.success,
          categories: [tCachedCategory],
        ),
        const CategoryState(
          status: CategoryStatus.success,
          categories: [tFreshCategory],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCachedCategories()).called(1);
        verify(() => mockRepository.getAllCategories(forceRefresh: true)).called(1);
      },
    );

    blocTest<CategoryBloc, CategoryState>(
      'SWR: emits cached categories immediately and keeps them if network fails',
      build: () {
        when(() => mockRepository.getCachedCategories())
            .thenAnswer((_) async => [tCachedCategory]);
        when(() => mockRepository.getAllCategories(forceRefresh: true))
            .thenAnswer((_) async => const Left(AppErrorEntity(message: 'Network error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const CategoryEvent.getCategories()),
      expect: () => [
        const CategoryState(
          status: CategoryStatus.success,
          categories: [tCachedCategory],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCachedCategories()).called(1);
        verify(() => mockRepository.getAllCategories(forceRefresh: true)).called(1);
      },
    );

    blocTest<CategoryBloc, CategoryState>(
      'Cache miss: emits loading, then success when network returns',
      build: () {
        when(() => mockRepository.getCachedCategories())
            .thenAnswer((_) async => null);
        when(() => mockRepository.getAllCategories(forceRefresh: true))
            .thenAnswer((_) async => const Right([tFreshCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(const CategoryEvent.getCategories()),
      expect: () => [
        const CategoryState(
          status: CategoryStatus.loading,
        ),
        const CategoryState(
          status: CategoryStatus.success,
          categories: [tFreshCategory],
        ),
      ],
    );
  });
}
