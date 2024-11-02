import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zetaton_wallpaper/core/helpers/navigation.dart';
import 'package:zetaton_wallpaper/features/home/data/models/image_model.dart';

import '../controller/favorite_provider.dart';
import '../../../core/common_widgets/preview_page.dart';
import '../../../core/common_widgets/image_card.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({
    super.key,
    required this.favoriteImgs, required this.provider,
  });

  final List<ImageModel> favoriteImgs;
  final FavoriteProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: MasonryGridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        itemCount: favoriteImgs.length,
        itemBuilder: (context, index) {
          double height = (index % 10 + 1) * 100;
          final img = favoriteImgs[index];
          return ImageCard(
            height: height,
            imageModel: img,
            onFavoriteTap: (img) {
              provider.removeFromFavorites(img);
            },
            onTap: () {
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
    );
  }
}
