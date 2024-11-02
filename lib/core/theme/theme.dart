import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/theme/custom_themes/navbar_theme.dart';

import '../contants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    // fontFamily: 'Cairo',
    brightness: Brightness.light,
    primaryColor: MyColors.white,
    scaffoldBackgroundColor: MyColors.white,
    textTheme: MyTextTheme.lightTextTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: MyElevetedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormField.lightTextFormField,
    navigationBarTheme: MyNavBarTheme.lightNavBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: MyTextTheme.darkTextTheme,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    // fontFamily: 'Cairo',
    brightness: Brightness.dark,
    primaryColor: MyColors.black,
    scaffoldBackgroundColor: MyColors.black,
    elevatedButtonTheme: MyElevetedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormField.darkTextFormField,
    navigationBarTheme: MyNavBarTheme.darkNavBarTheme,
  );

  MyAppTheme._();
}
