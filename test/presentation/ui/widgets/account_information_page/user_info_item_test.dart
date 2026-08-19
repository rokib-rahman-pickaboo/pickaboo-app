import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/user_info_item.dart';
import 'package:pickaboo/core/color/app_colors.dart';

// Helper to wrap widget with necessary providers/themes
Widget _makeTestableWidget(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (_, _) => MaterialApp(
      theme: ThemeData(extensions: [AppColors.light()]),
      home: Builder(
        builder: (context) {
          return Scaffold(body: child);
        },
      ),
    ),
  );
}

void main() {
  testWidgets('UserInfoItem renders correctly', (WidgetTester tester) async {
    // Arrange
    const icon = Icons.person;
    const title = 'Test Title';
    const value = 'Test Value';

    // Act
    await tester.pumpWidget(
      _makeTestableWidget(
        const UserInfoItem(icon: icon, title: title, value: value),
      ),
    );
    await tester.pumpAndSettle();

    // Assert
    expect(find.text(title), findsOneWidget);
    expect(find.text(value), findsOneWidget);
    expect(find.byIcon(icon), findsOneWidget);
  });

  testWidgets('UserInfoItem shows divider by default', (
    WidgetTester tester,
  ) async {
    // Act
    await tester.pumpWidget(
      _makeTestableWidget(
        const UserInfoItem(icon: Icons.person, title: 'Title', value: 'Value'),
      ),
    );
    await tester.pumpAndSettle();

    // Assert
    // Finding Container by color or check widget tree structure is tricky.
    // We can verify that we have a Container that likely represents the divider.
    // Or check if we have 2 Containers (one for main column, one for divider).
    // A more robust way is to check the Column children count.

    final column = tester.widget<Column>(find.byType(Column).first);
    // Row + Divider = 2 children
    expect(column.children.length, 2);
  });

  testWidgets('UserInfoItem hides divider when showDivider is false', (
    WidgetTester tester,
  ) async {
    // Act
    await tester.pumpWidget(
      _makeTestableWidget(
        const UserInfoItem(
          icon: Icons.person,
          title: 'Title',
          value: 'Value',
          showDivider: false,
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Assert
    final column = tester.widget<Column>(find.byType(Column).first);
    // Only Row = 1 child
    expect(column.children.length, 1);
  });
}
