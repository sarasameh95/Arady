import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary ,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.tertiary)),
   brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: AppColors.black,
    backgroundColor: AppColors.tertiary),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary,).copyWith(
      primary: AppColors.primary, // Ensure primary color is not changed
      surfaceTint: Colors.transparent,
      secondary:AppColors.tertiary , //onSecondary: AppColors.tertiary ,
      error: AppColors.error, //onError: Colors.redAccent,
      surface: AppColors.primaryBackground, //onSurface: AppColors.primaryBackground
    ),

    useMaterial3: true,
   // fontFamily: AppStrings.fonts.primaryFontFamily,

    textTheme:  TextTheme(
      /*  labelLarge: TextStyle(
            fontSize: 18,
            color: ColorManager.darkGrey,
            fontWeight: FontWeight.bold
        ),
        labelMedium: TextStyle(
            fontSize: 12,
            color: ColorManager.darkPrimary,
            fontWeight: FontWeight.bold
        ),
        headlineMedium: TextStyle(
            color: ColorManager.offWhite,
            fontSize: ScreenSizeManager.resize(
                originalSize: ScreenSizeManager.basicTextSize,
                resizeWidth: true,
                minSize: 16,
                maxSize: 30)),
        headlineLarge: TextStyle(
            color: ColorManager.darkPrimary,
            fontWeight: FontWeight.bold,
            fontSize: ScreenSizeManager.resize(
                originalSize: ScreenSizeManager.basicTextSize20,
                resizeWidth: true,
                minSize: 20.0.dy,
                maxSize: 30.0.dy))*/
      // button
    ),
  );
}*/


abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.money,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: false,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}