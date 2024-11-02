import 'package:flutter/material.dart';

import '../../contants/colors.dart';
import 'text_theme.dart';

class MyElevetedButtonTheme {
  MyElevetedButtonTheme._();

  // -- Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // maximumSize: Size.infinite,
      // minimumSize: Size.infinite *0.4,
        elevation: 0,
        foregroundColor: MyColors.white,
        backgroundColor: MyColors.purple,
        disabledForegroundColor: MyColors.grey,
        disabledBackgroundColor: MyColors.grey,
        side: const BorderSide(color: MyColors.greylight),
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: MyTextTheme.darkTextTheme.headlineSmall,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );

  // -- Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: MyColors.white,
        backgroundColor: MyColors.purple,
        disabledForegroundColor: MyColors.grey,
        disabledBackgroundColor: MyColors.grey,
        side: const BorderSide(color: MyColors.greylight),
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: MyTextTheme.darkTextTheme.headlineSmall,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
}
