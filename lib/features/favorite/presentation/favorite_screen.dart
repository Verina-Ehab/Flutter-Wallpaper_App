import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_layout.dart';
import 'package:zetaton_wallpaper/core/common_widgets/loading_widget.dart';
import 'package:zetaton_wallpaper/features/home/data/models/image_model.dart';

import '../../../core/helpers/snackbar.dart';
import '../controller/favorite_provider.dart';
import 'favorite_body_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      firstString: "Favorits",
      secString: "You've marked all of these as a favorite!",
      widget: Consumer<FavoriteProvider>(
        builder: (context, provider, child) {
          return StreamBuilder<List<ImageModel>>(
            stream: provider.getFavoriteImgs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final favoriteImgs = snapshot.data!;
                if (favoriteImgs.isEmpty) {
                  return const Center(
                    heightFactor: 30,
                    child: Text('No favorite wallpapers yet'),
                  );
                } else {
                  return FavoriteBody(favoriteImgs: favoriteImgs, provider: provider,);
                }
              } else if (snapshot.hasError) {
                showErrorSnackBar(
                    context: context, message: 'Error: ${snapshot.error}');
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const LoadingWidget();
              }
            },
          );
        },
      ),
    );
  }
}

