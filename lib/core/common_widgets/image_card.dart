import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../contants/colors.dart';
import '../../features/home/data/models/image_model.dart';

class ImageCard extends StatelessWidget {
  final double height;
  final ImageModel imageModel;
  final Function(ImageModel) onFavoriteTap;
  final Function() onTap;

  const ImageCard({
    super.key,
    required this.imageModel,
    required this.onFavoriteTap,
    required this.onTap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: height > 300 ? 300 : height,
              imageUrl: imageModel.portraitPath,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: imageModel.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: MyColors.red,
                        )
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    onFavoriteTap(imageModel);
                  },
                ))
          ],
        ),
      ),
    );
  }
}