import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import '../color/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final colors = AppColors.light();

    return ThemeData(
      brightness: Brightness.light,

      primaryColor: colors.primary,
      primaryColorDark: colors.primaryDark,
      scaffoldBackgroundColor: colors.white,

      colorScheme: ColorScheme.light(
        primary: colors.primary,
        onPrimary: colors.white,
        secondary: colors.orange,
        onSecondary: colors.white,
        tertiary: colors.aqua,
        error: colors.red,
        onError: colors.white,
        surface: colors.white,
        onSurface: colors.text,
        outline: colors.borderColor,
        shadow: colors.blackLight,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.white,
        foregroundColor: colors.text,
        surfaceTintColor: colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: colors.text),
        actionsIconTheme: IconThemeData(color: colors.text),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.white,
        elevation: 0,
        indicatorColor: colors.white,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: colors.button,
            );
          }
          return TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: colors.gray,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.button);
          }
          return IconThemeData(color: colors.gray);
        }),
      ),

      cardTheme: CardThemeData(
        color: colors.white,
        elevation: 2,
        shadowColor: colors.blackLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.borderColor, width: 1),
        ),
        margin: const EdgeInsets.all(8),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.button,
          foregroundColor: colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.button,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.button,
          side: BorderSide(color: colors.button, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: colors.text),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.highlighter,
        foregroundColor: colors.white,
        elevation: 4,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.red, width: 2),
        ),
        labelStyle: TextStyle(color: colors.gray),
        hintStyle: TextStyle(color: colors.silverChalice),
        errorStyle: TextStyle(color: colors.red),
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: colors.background,
        elevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.borderColor,
        thickness: 1,
        space: 1,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.grayLight,
        deleteIconColor: colors.gray,
        disabledColor: colors.borderColor,
        selectedColor: colors.primary,
        secondarySelectedColor: colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: TextStyle(color: colors.text),
        secondaryLabelStyle: TextStyle(color: colors.white),
        brightness: Brightness.light,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.white,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: TextStyle(
          color: colors.text,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: TextStyle(color: colors.text, fontSize: 16.sp),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        constraints: BoxConstraints(maxWidth: 640),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.mineShaft,
        contentTextStyle: TextStyle(color: colors.white),
        actionTextColor: colors.primary,
        behavior: SnackBarBehavior.fixed,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.borderColor,
        circularTrackColor: colors.borderColor,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.green;
          }
          return colors.gray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.greenBright;
          }
          return colors.borderColor;
        }),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.white;
        }),
        checkColor: WidgetStateProperty.all(colors.white),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.gray;
        }),
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: colors.progressBarActiveColor,
        inactiveTrackColor: colors.progressBarColor,
        thumbColor: colors.progressBarActiveColor,
        overlayColor: colors.progressBarActiveColor.withValues(alpha: 0.2),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: colors.text,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: colors.text,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        headlineLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: colors.text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: colors.text,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: colors.gray,
        ),

        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: colors.gray,
        ),
      ),

      iconTheme: IconThemeData(color: colors.text, size: 24),

      extensions: [AppTextStyles.build(Brightness.light), colors],

      useMaterial3: true,
    );
  }

  static ThemeData dark() {
    final colors = AppColors.dark();

    return ThemeData(
      brightness: Brightness.dark,

      primaryColor: colors.primary,
      primaryColorDark: colors.primaryDark,
      scaffoldBackgroundColor: colors.scaffoldBackground,

      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        onPrimary: colors.white,
        secondary: colors.orange,
        onSecondary: colors.white,
        tertiary: colors.aqua,
        error: colors.red,
        onError: colors.white,
        surface: colors.secondaryDark,
        onSurface: colors.text,
        outline: colors.borderColor,
        shadow: colors.blackLight,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.white,
        foregroundColor: colors.text,
        surfaceTintColor: colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: colors.text),
        actionsIconTheme: IconThemeData(color: colors.text),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.background,
        elevation: 0,
        indicatorColor: colors.background,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: colors.button,
            );
          }
          return TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: colors.gray,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.button);
          }
          return IconThemeData(color: colors.gray);
        }),
      ),

      cardTheme: CardThemeData(
        color: colors.secondaryDark,
        elevation: 2,
        shadowColor: colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.borderColor, width: 1),
        ),
        margin: const EdgeInsets.all(8),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.button,
          foregroundColor: colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.button,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.button,
          side: BorderSide(color: colors.button, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: colors.text),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.highlighter,
        foregroundColor: colors.white,
        elevation: 4,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.secondaryDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.red, width: 2),
        ),
        labelStyle: TextStyle(color: colors.silverChalice),
        hintStyle: TextStyle(color: colors.gray),
        errorStyle: TextStyle(color: colors.red),
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: colors.background,
        elevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: colors.borderColor,
        thickness: 1,
        space: 1,
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.secondaryDark,
        deleteIconColor: colors.gray,
        disabledColor: colors.borderColor,
        selectedColor: colors.primary,
        secondarySelectedColor: colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: TextStyle(color: colors.text),
        secondaryLabelStyle: TextStyle(color: colors.white),
        brightness: Brightness.dark,
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.secondaryDark,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: TextStyle(
          color: colors.text,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: TextStyle(color: colors.text, fontSize: 16.sp),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        constraints: BoxConstraints(maxWidth: 640),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.background,
        contentTextStyle: TextStyle(color: colors.white),
        actionTextColor: colors.primary,
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.borderColor,
        circularTrackColor: colors.borderColor,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.green;
          }
          return colors.gray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.greenBright;
          }
          return colors.borderColor;
        }),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.secondaryDark;
        }),
        checkColor: WidgetStateProperty.all(colors.white),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.gray;
        }),
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: colors.progressBarActiveColor,
        inactiveTrackColor: colors.progressBarColor,
        thumbColor: colors.progressBarActiveColor,
        overlayColor: colors.progressBarActiveColor.withValues(alpha: 0.2),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: colors.text,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: colors.text,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        headlineLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        headlineMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),

        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: colors.text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: colors.text,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: colors.gray,
        ),

        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: colors.gray,
        ),
      ),

      iconTheme: IconThemeData(color: colors.text, size: 24),

      extensions: [AppTextStyles.build(Brightness.dark), colors],

      useMaterial3: true,
    );
  }
}
