import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/auth/registration_page/registration_page.dart';

class MockRegistrationBloc
    extends MockBloc<RegistrationEvent, RegistrationState>
    implements RegistrationBloc {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  late MockRegistrationBloc mockRegistrationBloc;
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockRegistrationBloc = MockRegistrationBloc();
    mockLoginBloc = MockLoginBloc();

    when(() => mockRegistrationBloc.state)
        .thenReturn(const RegistrationState.initial());
    when(() => mockLoginBloc.state).thenReturn(const LoginState.initial());
  });

  Widget createWidgetUnderTest({String phone = '01712345678'}) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<RegistrationBloc>.value(value: mockRegistrationBloc),
            BlocProvider<LoginBloc>.value(value: mockLoginBloc),
          ],
          child: RegistrationPage(phone: phone),
        ),
      ),
    );
  }

  group('RegistrationPage 5-Minute Timer Tests', () {
    testWidgets('renders phone change style 5-minute resend timer', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Check for Resend OTP in 05:00 and clock icon
      expect(find.text('Resend OTP in 05:00'), findsOneWidget);
      expect(find.byIcon(Icons.access_time_rounded), findsOneWidget);
    });

    testWidgets('countdown timer decrements properly on registration page', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Resend OTP in 05:00'), findsOneWidget);

      await tester.pump(const Duration(seconds: 1));
      expect(find.text('Resend OTP in 04:59'), findsOneWidget);

      await tester.pump(const Duration(seconds: 11));
      expect(find.text('Resend OTP in 04:48'), findsOneWidget);
    });
  });
}
