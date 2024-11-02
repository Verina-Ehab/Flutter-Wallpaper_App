import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_layout.dart';
import 'package:zetaton_wallpaper/core/common_widgets/loading_widget.dart';
import 'package:zetaton_wallpaper/core/common_widgets/network_gate.dart';
import 'package:zetaton_wallpaper/features/home/controller/home_provider.dart';

import 'home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      firstString: "Home",
      widget: Consumer<HomeProvider>(builder: (context, provider, child) {
        return NetworkGate(
          onlineChild:
              provider.isLoading ? const LoadingWidget() : HomeBody(provider: provider,),
          offlineChild: Center(
            heightFactor: 30.0,
            child: Text(
              "There is no internet connection",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      }),
    );
  }
}

