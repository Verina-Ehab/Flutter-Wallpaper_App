import 'package:flutter/material.dart';

import '../../contants/colors.dart';
import 'text_theme.dart';

class MyTextFormField {
  MyTextFormField._();

  static InputDecorationTheme lightTextFormField = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.grey,
    suffixIconColor: MyColors.grey,
    // fillColor: MyColors.greyOpacity,
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    labelStyle: MyTextTheme.lightTextTheme.bodyMedium,
    hintStyle: MyTextTheme.lightTextTheme.labelLarge,
    errorStyle: MyTextTheme.lightTextTheme.labelMedium,
    //
    floatingLabelStyle: MyTextTheme.lightTextTheme.bodyMedium,
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.greylight)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.greylight)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.purple)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: MyColors.orange)),
  );

  static InputDecorationTheme darkTextFormField = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MyColors.grey,
    suffixIconColor: MyColors.grey,
    // fillColor: MyColors.greyOpacity,
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    labelStyle: MyTextTheme.darkTextTheme.bodyMedium,
    hintStyle: MyTextTheme.darkTextTheme.labelLarge,
    errorStyle: MyTextTheme.darkTextTheme.labelMedium,
    //
    floatingLabelStyle: MyTextTheme.darkTextTheme.bodyMedium,
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.greylight)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.greylight)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.white)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: MyColors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 2, color: MyColors.orange)),
  );
}
