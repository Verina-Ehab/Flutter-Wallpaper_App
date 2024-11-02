import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/contants/colors.dart';


  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        backgroundColor: MyColors.green,
      ),
    );
  }

  void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        backgroundColor: MyColors.red,
      ),
    );
  }

