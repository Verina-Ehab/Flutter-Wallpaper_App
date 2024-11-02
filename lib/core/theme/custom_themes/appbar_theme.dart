import 'package:flutter/material.dart';

import '../../contants/colors.dart';
import 'text_theme.dart';

class MyAppBarTheme{
  MyAppBarTheme._();

  static AppBarTheme lightAppBarTheme= AppBarTheme(
    // elevation: 0,
    // centerTitle: true,
    // scrolledUnderElevation: 0,
    backgroundColor: MyColors.transparent,
    surfaceTintColor: MyColors.transparent,
    iconTheme: const IconThemeData(color: MyColors.grey, size: 24),
    actionsIconTheme: const IconThemeData(color: MyColors.grey, size: 24),
    titleTextStyle: MyTextTheme.darkTextTheme.headlineMedium,
  );

  static AppBarTheme darkAppBarTheme= AppBarTheme(
    // elevation: 0,
    // centerTitle: true,
    // scrolledUnderElevation: 0,
    backgroundColor: MyColors.transparent,
    surfaceTintColor: MyColors.transparent,
    iconTheme: const IconThemeData(color: MyColors.white, size: 24),
    actionsIconTheme: const IconThemeData(color: MyColors.white, size: 24),
    titleTextStyle: MyTextTheme.lightTextTheme.headlineMedium,
  );
}