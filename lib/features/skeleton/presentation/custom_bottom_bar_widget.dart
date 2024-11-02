// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zetaton_wallpaper/core/contants/colors.dart';

import '../providers/skeleton_provider.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkeletonProvider>();
    // final provider = Provider.of<NavBarProvider>(context);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: NavigationBar(
        selectedIndex: provider.selectedPage,
        onDestinationSelected: (value) => provider.changePage(value),
        destinations: const [
          NavigationDestination(
              icon: CustomIcon(
                icon: Icons.home,
              ),
              label: ''),
          NavigationDestination(
              icon: CustomIcon(icon: Icons.favorite), label: ''),
          NavigationDestination(
              icon: CustomIcon(icon: Icons.search), label: ''),
          NavigationDestination(
              icon: CustomIcon(icon: Icons.settings), label: ''),
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  const CustomIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? MyColors.white,
      size: size ?? 35,
    );
  }
}
