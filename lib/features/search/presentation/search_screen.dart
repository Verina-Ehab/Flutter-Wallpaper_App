import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_layout.dart';
import 'package:zetaton_wallpaper/core/common_widgets/loading_widget.dart';
import 'package:zetaton_wallpaper/features/home/controller/home_provider.dart';
import 'package:zetaton_wallpaper/features/search/controller/search_provider.dart';

import 'widgets/search_result.dart';
import 'widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return CustomLayout(
        firstString: "Search",
        secString:
            "Searching through hundreds of photos will be so much easier",
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchTextField(
                provider: provider,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            provider.isLoading
                ? const LoadingWidget()
                : SearchResult(homeProvider: homeProvider, provider: provider,),
          ],
        ),
      );
    });
  }
}


