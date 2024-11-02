import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_text_form_field.dart';
import 'package:zetaton_wallpaper/core/contants/colors.dart';
import 'package:zetaton_wallpaper/features/search/controller/search_provider.dart';

class SearchTextField extends StatelessWidget {
  final SearchProvider provider;
  const SearchTextField({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: provider.focusNode,
      autofocus: false,
      controller: provider.searchEditingController,
      hintText: 'Search',
      suffixIcon: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: MyColors.purple,
        ),
        child: IconButton(
          onPressed: () {
            provider.focusNode.unfocus();

            provider.getImagesBySearch();
          },
          icon: const Icon(
            Icons.search,
            color: MyColors.white,
          ),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-9]'),
        ),
      ],
    );
  }
}
