import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_info_entity.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/discover_category_page/discover_category_page.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/category_sidebar.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_category_skeleton_widget.dart';

class MockDiscoverCategoryBloc
    extends MockBloc<DiscoverCategoryEvent, DiscoverCategoryState>
    implements DiscoverCategoryBloc {}

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

void main() {
  late MockDiscoverCategoryBloc mockDiscoverCategoryBloc;
  late MockInternetBloc mockInternetBloc;

  setUpAll(() {
    registerFallbackValue(const DiscoverCategoryEvent.getDiscoverCategories());
  });

  setUp(() {
    mockDiscoverCategoryBloc = MockDiscoverCategoryBloc();
    mockInternetBloc = MockInternetBloc();

    when(() => mockInternetBloc.state)
        .thenReturn(const InternetState.connected('Connected'));
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => MultiBlocProvider(
        providers: [
          BlocProvider<DiscoverCategoryBloc>.value(
            value: mockDiscoverCategoryBloc,
          ),
          BlocProvider<InternetBloc>.value(
            value: mockInternetBloc,
          ),
        ],
        child: const MaterialApp(
          home: DiscoverCategoryPage(),
        ),
      ),
    );
  }

  group('DiscoverCategoryPage Tests', () {
    testWidgets(
        'shows DiscoverCategorySkeletonWidget when DiscoverCategoryBloc is in loading state',
        (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      when(() => mockDiscoverCategoryBloc.state).thenReturn(
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.loading,
          discoverCategories: null,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(DiscoverCategorySkeletonWidget), findsOneWidget);
      expect(find.text('All Categories'), findsOneWidget);
    });

    testWidgets(
        'shows categories content when DiscoverCategoryBloc is in success state',
        (tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      const tCategory = DiscoverCategoryEntity(
        entityId: 1,
        menuName: 'Computer',
        logoUrl: '',
        category: DiscoverCategoryInfoEntity(
          id: 1,
          name: 'Computer',
          slug: 'computer',
        ),
        banners: [],
        subsections: [],
      );

      when(() => mockDiscoverCategoryBloc.state).thenReturn(
        const DiscoverCategoryState(
          status: DiscoverCategoryStatus.success,
          discoverCategories: [tCategory],
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(DiscoverCategorySkeletonWidget), findsNothing);
      expect(find.byType(CategorySidebar), findsOneWidget);
      expect(find.text('Computer'), findsOneWidget);
    });
  });
}
