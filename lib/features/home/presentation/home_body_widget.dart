import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_elevated_button.dart';
import 'package:zetaton_wallpaper/core/helpers/navigation.dart';
import 'package:zetaton_wallpaper/features/home/controller/home_provider.dart';
import '../data/models/image_model.dart';
import '../../../core/common_widgets/image_card.dart';
import '../../../core/common_widgets/preview_page.dart';


class HomeBody extends StatelessWidget {
  final HomeProvider provider;
  const HomeBody({
    super.key, required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: MasonryGridView.count(
            controller: provider.scrollController,
            itemCount: provider.images.length,
            shrinkWrap: true,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              ImageModel img = provider.images[index];
              double height = (index + 1 % 5 + 1) * 100;
              return ImageCard(
                height: height,
                imageModel: img,
                onFavoriteTap: (img) {
                  provider.toggleFavorite(img);
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
