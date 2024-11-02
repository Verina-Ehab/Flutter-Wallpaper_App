import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/loading_widget.dart';
import 'custom_bottom_bar_widget.dart';
import '../providers/skeleton_provider.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkeletonProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  provider.logOut(context);
                },
                icon: const Icon(Icons.logout)),
          )
        ],
      ),
      body: Visibility(
        visible: provider.isLoading,
        replacement: provider.pages[provider.selectedPage],
        child: const LoadingWidget(),
      ),
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
