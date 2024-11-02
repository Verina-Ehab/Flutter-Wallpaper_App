import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../contants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.textInputAction,
    this.labelText,
    this.keyboardType,
    this.controller,
    super.key,
    this.onChanged,
    this.onSave,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.prefix,
    this.onEditingComplete,
    this.autofocus,
    this.focusNode,
    this.hintText,
    this.padding = 24,
    this.border = true,
    this.textAlignVertical,
    this.textAlign,
    this.contentPadding,
    this.maxLines,
    this.inputFormatters,
    this.onTapOutside,
  });

  final void Function(String)? onChanged;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? labelText;
  final String? hintText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool? border;
  final double? padding;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: padding!,
      ),
      child: TextFormField(
        onTapOutside: onTapOutside,
        inputFormatters: inputFormatters ?? [],
        maxLines: maxLines ?? 1,
        textAlignVertical: textAlignVertical,
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        onSaved: onSave,
        autofocus: autofocus ?? false,
        validator: validator,
        obscureText: obscureText ?? false,
        // obscuringCharacter: '*',
        onEditingComplete: onEditingComplete,
        cursorColor: MyColors.greylight,
        decoration: border == false
            ? InputDecoration(
                // filled: true,
                // fillColor: MyColors.black,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                hintText: hintText,
                // hintStyle: MyTextTheme.lightTextTheme.bodySmall,
                prefix: prefix,
                // prefixIconColor: MyColors.text,
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: suffixIcon,
                      )
                    : null,
                labelText: labelText,
                // labelStyle: MyTextTheme.lightTextTheme.headlineLarge,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              )
            : InputDecoration(
                filled: true,
                fillColor: MyColors.greyOpacity,
                // isDense: true,
                // contentPadding: EdgeInsets.symmetric(horizontal: 3.h),
                hintText: hintText,
                // hintStyle: MyTextTheme.lightTextTheme.bodySmall,
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: suffixIcon,
                      )
                    : null,
                labelText: labelText,
                // labelStyle: MyTextTheme.lightTextTheme.headlineLarge,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
        // onTapOutside: (event) => FocusScope.of(context).unfocus(),
        // style: MyTextTheme.lightTextTheme.titleLarge,
      ),
    );
  }
}
