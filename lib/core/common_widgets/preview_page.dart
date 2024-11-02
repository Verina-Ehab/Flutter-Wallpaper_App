import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/contants/colors.dart';

import '../../features/home/data/data_source/home_remote_data_source.dart';

class PreviewPage extends StatelessWidget {
  final String imageUrl;
  final int imageId;

  const PreviewPage({super.key, required this.imageUrl, required this.imageId});

  @override
  Widget build(BuildContext context) {
    HomeRemoteDataSource repo = HomeRemoteDataSourceImp();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CachedNetworkImage(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.purple,
        foregroundColor: MyColors.white,
        shape: const CircleBorder(),
        onPressed: () {
          repo.downloadImage(
              imageUrl: imageUrl, imageId: imageId, context: context);
        },
        child: const Icon(Icons.download),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
