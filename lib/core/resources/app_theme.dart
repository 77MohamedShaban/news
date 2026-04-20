import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.lightSecondaryColor),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: ColorsManager.lightSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.lightPrimaryColor,
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightSecondaryColor,
      secondary: ColorsManager.lightPrimaryColor,
      onSecondary: ColorsManager.greyColor,
      onPrimaryContainer: ColorsManager.lightSecondaryColor,
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.lightSecondaryColor,
      thickness: 1.h,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.lightPrimaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.lightSecondaryColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.greyColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.darkSecondaryColor),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: ColorsManager.darkSecondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.darkPrimaryColor,
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.darkSecondaryColor,
      secondary: ColorsManager.darkPrimaryColor,
      onSecondary: ColorsManager.greyColor,
      onPrimaryContainer: ColorsManager.darkSecondaryColor,
    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.darkSecondaryColor,
      thickness: 1.h,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.darkPrimaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.darkSecondaryColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.greyColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
