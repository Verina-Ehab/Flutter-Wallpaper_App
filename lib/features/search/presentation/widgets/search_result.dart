import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zetaton_wallpaper/features/home/controller/home_provider.dart';
import 'package:zetaton_wallpaper/features/search/controller/search_provider.dart';

import '../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../core/common_widgets/image_card.dart';
import '../../../../core/common_widgets/preview_page.dart';
import '../../../../core/helpers/navigation.dart';
import '../../../home/data/models/image_model.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.homeProvider,
    required this.provider,
  });

  final HomeProvider homeProvider;
  final SearchProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        MasonryGridView.count(
          controller: provider.scrollController,
          itemCount: provider.images.length,
          shrinkWrap: true,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            ImageModel img = provider.images[index];
            double height = (index % 10 + 1) * 100;
            return ImageCard(
              height: height,
              imageModel: img,
              onFavoriteTap: (img) {
                homeProvider.toggleFavorite(img);
              },
              onTap: () {
                FocusScope.of(context).unfocus();
                navigateTo(
                  context,
                  PreviewPage(
                    imageId: img.id,
                    imageUrl: img.portraitPath,
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 10),
        provider.images.isNotEmpty
            ? CustomElevatedButton(
                onTap: () {
                  provider.loadMorePages();
                },
                btnLabel: 'Load More',
              )
            : const SizedBox(),
      ],
    );
  }
}
