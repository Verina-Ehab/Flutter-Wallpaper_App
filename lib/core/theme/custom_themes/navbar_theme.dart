import 'package:flutter/material.dart';

import '../../contants/colors.dart';

class MyNavBarTheme {
  MyNavBarTheme._();

  static NavigationBarThemeData lightNavBarTheme = NavigationBarThemeData(
    // height: 100,
    backgroundColor: MyColors.black,
    indicatorColor: MyColors.whiteOpacity,
  );

  static NavigationBarThemeData darkNavBarTheme = NavigationBarThemeData(
    backgroundColor: MyColors.purple,
    indicatorColor: MyColors.whiteOpacity,
  );
}
