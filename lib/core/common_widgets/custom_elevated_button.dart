import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/contants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? bckgColor;
  final Color? frgColor;
  final String? imgName;
  final double? imgWidth;
  final String btnLabel;

  const CustomElevatedButton(
      {super.key,
      this.onTap,
      this.bckgColor,
      this.imgName,
      this.imgWidth,
      required this.btnLabel,
      this.frgColor = MyColors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bckgColor ?? MyColors.purple,
            foregroundColor: frgColor ?? MyColors.white),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgName != null
                ? Image.asset(
                    imgName!,
                    width: imgWidth ?? 0,
                  )
                : const SizedBox(),
            Text(btnLabel),
          ],
        ));
  }
}
