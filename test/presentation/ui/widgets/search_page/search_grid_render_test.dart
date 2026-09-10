import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/mapper/search_mapper/search_mapper.dart';
import 'package:pickaboo/data/model/search_response/search_response.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/search_page/search_results.dart';

class MockSearchBloc extends Mock implements SearchBloc {}

void main() {
  testWidgets('renders search results grid with real products without unbounded crash', (tester) async {
    const jsonStr = '''{
      "totalItems": 178,
      "startIndex": 0,
      "itemsPerPage": 5,
      "currentItemCount": 2,
      "items": [
        {
          "product_id": "71080",
          "original_product_id": "71080",
          "title": "TV Wall Mount For 32\\"",
          "description": "Universal Ultra-Thin LCD/Plasma Television Mounting Bracket.",
          "link": "https://gcpadmin.pickaboo.com/32-wall-mount-for-tv.html",
          "price": "590.0000",
          "list_price": "690.0000",
          "quantity": "1",
          "product_code": "WMTV32DRM",
          "image_link": "https://gcpadmin.pickaboo.com/media/catalog/product/placeholder/default/Pickaboo-plholder-thumb.png"
        },
        {
          "product_id": "6554",
          "original_product_id": "6554",
          "title": "Fast Link USB TV Card for Laptop - White",
          "description": "Only for Windows PC FM Radio",
          "link": "https://gcpadmin.pickaboo.com/usb-tv-card-for-laptop.html",
          "price": "1200.0000",
          "list_price": "1300.0000",
          "quantity": "1",
          "product_code": "PRSTVBEA",
          "image_link": "https://gcpadmin.pickaboo.com/media/catalog/product/placeholder/default/Pickaboo-plholder-thumb.png"
        }
      ]
    }''';

    final searchResponse = SearchResponse.fromJson(jsonDecode(jsonStr));
    final products = searchResponse.toDomain().products;

    final mockBloc = MockSearchBloc();
    final state = SearchState(
      pagingState: PagingState<int, ProductEntity>(
        isLoading: false,
        hasNextPage: false,
        pages: [products],
        keys: [0],
      ),
      facets: const [],
      suggestions: const ['tv'],
      categories: const [],
    );

    when(() => mockBloc.state).thenReturn(state);
    when(() => mockBloc.stream).thenAnswer((_) => Stream.value(state));

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: BlocProvider<SearchBloc>.value(
              value: mockBloc,
              child: CustomScrollView(
                slivers: [
                  SearchResults(isGridView: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('TV Wall Mount'), findsOneWidget);
    expect(find.textContaining('Fast Link USB TV Card'), findsOneWidget);
  });
}
