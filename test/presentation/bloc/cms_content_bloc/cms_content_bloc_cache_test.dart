import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/model/cms_block_response/cms_block_response.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';

class MockProductApiService extends Mock implements ProductApiService {}

void main() {
  late MockProductApiService mockApiService;

  setUp(() {
    mockApiService = MockProductApiService();
    CmsContentBloc.clearCache();
  });

  tearDown(() {
    CmsContentBloc.clearCache();
  });

  const dummyBlock = CmsBlockResponse(
    id: 1,
    identifier: 'test_block',
    title: 'Test Block',
    content: '<p>Test</p>',
    active: true,
  );

  test('CmsContentBloc fetches from network on first loadAll and caches result', () async {
    when(() => mockApiService.getCmsBlock(blockUrl: any(named: 'blockUrl')))
        .thenAnswer((_) async => right(dummyBlock));

    final bloc1 = CmsContentBloc(mockApiService);
    expect(bloc1.state.productOffer, isNull);

    bloc1.add(const CmsContentEvent.loadAll());
    await expectLater(
      bloc1.stream,
      emitsInOrder([
        predicate<CmsContentState>((s) => s.isLoading == true),
        predicate<CmsContentState>((s) => s.isLoading == false && s.productOffer != null),
      ]),
    );

    // Verify 5 network calls were made on first fetch
    verify(() => mockApiService.getCmsBlock(blockUrl: any(named: 'blockUrl'))).called(5);
    expect(CmsContentBloc.isCacheValid, isTrue);

    // Create a second BLoC instance (simulating navigating to another product)
    final bloc2 = CmsContentBloc(mockApiService);
    // Initial state should already be hydrated from memory cache!
    expect(bloc2.state.productOffer, isNotNull);
    expect(bloc2.state.productOffer?.title, 'Test Block');

    bloc2.add(const CmsContentEvent.loadAll());
    await Future.delayed(const Duration(milliseconds: 50));

    // No additional network calls should be made!
    verifyNever(() => mockApiService.getCmsBlock(blockUrl: any(named: 'blockUrl')));

    await bloc1.close();
    await bloc2.close();
  });

  test('CmsContentBloc.clearCache resets cache and allows fresh fetch', () async {
    when(() => mockApiService.getCmsBlock(blockUrl: any(named: 'blockUrl')))
        .thenAnswer((_) async => right(dummyBlock));

    final bloc1 = CmsContentBloc(mockApiService);
    bloc1.add(const CmsContentEvent.loadAll());
    await expectLater(
      bloc1.stream,
      emitsInOrder([
        predicate<CmsContentState>((s) => s.isLoading == true),
        predicate<CmsContentState>((s) => s.isLoading == false && s.productOffer != null),
      ]),
    );

    expect(CmsContentBloc.isCacheValid, isTrue);

    // Clear cache
    CmsContentBloc.clearCache();
    expect(CmsContentBloc.isCacheValid, isFalse);

    final bloc2 = CmsContentBloc(mockApiService);
    expect(bloc2.state.productOffer, isNull);

    bloc2.add(const CmsContentEvent.loadAll());
    await expectLater(
      bloc2.stream,
      emitsInOrder([
        predicate<CmsContentState>((s) => s.isLoading == true),
        predicate<CmsContentState>((s) => s.isLoading == false && s.productOffer != null),
      ]),
    );

    // 5 calls for bloc1 + 5 calls for bloc2 = 10 calls total
    verify(() => mockApiService.getCmsBlock(blockUrl: any(named: 'blockUrl'))).called(10);

    await bloc1.close();
    await bloc2.close();
  });
}
