import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_info_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late DiscoverCategoryBloc bloc;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    bloc = DiscoverCategoryBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('DiscoverCategoryBloc', () {
    const tCategory = DiscoverCategoryEntity(
      entityId: 1,
      menuName: 'Phones',
      logoUrl: '',
      category: DiscoverCategoryInfoEntity(id: 1, name: 'Phones', slug: 'phones'),
      banners: [],
      subsections: [],
    );

    test('initial state has status initial', () {
      expect(bloc.state.status, DiscoverCategoryStatus.initial);
      expect(bloc.state.error, isNull);
      expect(bloc.state.discoverCategories, isNull);
    });

    blocTest<DiscoverCategoryBloc, DiscoverCategoryState>(
      'emits [loading, success] when getDiscoverCategories succeeds',
      build: () {
        when(() => mockRepository.getDiscoverCategories())
            .thenAnswer((_) async => const Right([tCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(const DiscoverCategoryEvent.getDiscoverCategories()),
      expect: () => [
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.loading,
          error: null,
        ),
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.success,
          discoverCategories: [tCategory],
        ),
      ],
    );

    blocTest<DiscoverCategoryBloc, DiscoverCategoryState>(
      'emits [loading, error] when getDiscoverCategories fails with network error',
      build: () {
        when(() => mockRepository.getDiscoverCategories()).thenAnswer(
          (_) async => const Left(AppErrorEntity(message: 'SocketException: failed')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const DiscoverCategoryEvent.getDiscoverCategories()),
      expect: () => [
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.loading,
          error: null,
        ),
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.error,
          error: AppErrorEntity(message: 'SocketException: failed'),
        ),
      ],
    );

    blocTest<DiscoverCategoryBloc, DiscoverCategoryState>(
      'refresh resets error to null and emits loading before re-fetching',
      seed: () => const DiscoverCategoryState(
        status: DiscoverCategoryStatus.error,
        error: AppErrorEntity(message: 'Connection failed'),
      ),
      build: () {
        when(() => mockRepository.getDiscoverCategories())
            .thenAnswer((_) async => const Right([tCategory]));
        return bloc;
      },
      act: (bloc) => bloc.add(const DiscoverCategoryEvent.refresh()),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.loading,
          error: null,
        ),
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.success,
          discoverCategories: [tCategory],
        ),
      ],
    );
  });
}
