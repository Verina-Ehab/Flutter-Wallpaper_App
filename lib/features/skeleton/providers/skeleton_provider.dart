import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/helpers/navigation.dart';

import '../../../core/helpers/alert_dialog.dart';
import '../../authentication/controller/auth_provider.dart';
import '../../favorite/presentation/favorite_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../search/presentation/search_screen.dart';
import '../../setting/setting_screen.dart';

class SkeletonProvider extends ChangeNotifier {
  int selectedPage = 0;
  AuthenticationProvider authProvider = AuthenticationProvider();

  List<Widget> pages = const [
    HomeScreen(),
    FavoriteScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  void changePage(int newValue) {
    selectedPage = newValue;
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    showAlertDialog(
        firstBtnLabel: "OK",
        firstOnTap: () async {
          navigateBack(context);
          startLoading();
          await authProvider.logOut();
          stopLoading();
        },
        secBtnLabel: "Cancel",
        secOnTap: () => navigateBack(context),
        title: "Log out?",
        content: "Are you sure?",
        context: context);
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
