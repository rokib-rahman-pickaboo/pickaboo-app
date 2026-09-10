import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/auth/forgot_password_confirm_page/forgot_password_confirm_page.dart';

class MockForgotPasswordBloc
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

void main() {
  late MockForgotPasswordBloc mockForgotPasswordBloc;

  setUp(() {
    mockForgotPasswordBloc = MockForgotPasswordBloc();
    when(() => mockForgotPasswordBloc.state)
        .thenReturn(const ForgotPasswordState.initial());
  });

  Widget createWidgetUnderTest({
    bool isEmail = false,
    String value = '01712345678',
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: BlocProvider<ForgotPasswordBloc>.value(
          value: mockForgotPasswordBloc,
          child: ForgotPasswordConfirmPage(
            isEmail: isEmail,
            value: value,
          ),
        ),
      ),
    );
  }

  group('ForgotPasswordConfirmPage Tests', () {
    testWidgets('renders Enter your otp hint text and phone change style resend timer', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Check for hint text
      expect(find.text('Enter your otp'), findsOneWidget);

      // Check for phone change style timer display
      expect(find.text('Resend OTP in 05:00'), findsOneWidget);
      expect(find.byIcon(Icons.access_time_rounded), findsOneWidget);

      // Verify redundant bottom requirement text is NOT present
      expect(find.text('Must be completed within 5 minutes'), findsNothing);

      // Check for Reset Password CTA button
      expect(find.text('Reset Password'), findsOneWidget);
    });

    testWidgets('allows entering a 4-digit OTP', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      final otpField = find.widgetWithText(TextField, 'Enter your otp');
      expect(otpField, findsOneWidget);

      await tester.enterText(otpField, '1234');
      await tester.pump();

      expect(find.text('1234'), findsOneWidget);
    });

    testWidgets('timer counts down after elapsed duration', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Resend OTP in 05:00'), findsOneWidget);

      // Advance timer by 1 second
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('Resend OTP in 04:59'), findsOneWidget);

      // Advance timer by 10 more seconds
      await tester.pump(const Duration(seconds: 10));
      expect(find.text('Resend OTP in 04:49'), findsOneWidget);
    });
  });
}
