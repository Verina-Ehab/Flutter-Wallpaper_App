import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_elevated_button.dart';

showAlertDialog({
  required String title,
  required String content,
  required BuildContext context,
  String? firstBtnLabel,
  String? secBtnLabel,
  void Function()? firstOnTap,
  void Function()? secOnTap,
}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: Text(content, textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,),
      actions: [
        firstBtnLabel != null
            ? CustomElevatedButton(
                btnLabel: firstBtnLabel,
                onTap: firstOnTap,
              )
            : const SizedBox(),
        const SizedBox(
          height: 10.0,
        ),
        secBtnLabel != null
            ? CustomElevatedButton(
                btnLabel: secBtnLabel,
                onTap: secOnTap,
              )
            : const SizedBox(),
      ],
    ),
  );
}
