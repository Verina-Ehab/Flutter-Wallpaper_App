import 'package:flutter/material.dart';

import '../../contants/colors.dart';
import 'text_theme.dart';

class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: MyColors.black,
    side: const BorderSide(color: MyColors.greylight),
    textStyle: MyTextTheme.lightTextTheme.titleMedium,
    padding: const EdgeInsets.symmetric(vertical: 15, ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));


  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: MyColors.white,
    side: const BorderSide(color: MyColors.greylight),
    textStyle: MyTextTheme.lightTextTheme.titleMedium,
    padding: const EdgeInsets.symmetric(vertical: 15,),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}
