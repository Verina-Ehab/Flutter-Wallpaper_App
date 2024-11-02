import 'package:flutter/material.dart';

import '../../contants/colors.dart';

class MyTextTheme{
  // The underscore (_) prefix in front of the constructor name indicates that it's private.
  // This means it can only be called from within the same class
  // class is intended to be a singleton, meaning there should only be one instance of the class available throughout the application.
  MyTextTheme._();

  // -- Customized Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    //for headlines
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: MyColors.black),
    //for buttons 
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.white),  


    //for black text
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.black),
    //for grey text 
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: MyColors.grey),
    //for purple text 
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.purple), 

    //for light grey text 
    labelLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: MyColors.greylight),
    //for error text
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: MyColors.red),
    //for snackbar text
    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: MyColors.white),

  );


  // -- Customized Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    // headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: MyColors.white),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: MyColors.white),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.white),

    // titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold, color: MyColors.white),
    // titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: MyColors.white),
    // titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: MyColors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.white),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: MyColors.grey),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.purple),

    labelLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: MyColors.greylight),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: MyColors.red),
    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: MyColors.white),

  );

}