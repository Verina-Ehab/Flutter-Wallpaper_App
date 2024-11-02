import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_layout.dart';
import 'package:zetaton_wallpaper/features/authentication/presentation/widgets/login/login_form.dart';

import '../../../../core/common_widgets/loading_widget.dart';
import '../../controller/auth_provider.dart';
import '../widgets/social_media_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          Consumer<AuthenticationProvider>(builder: (context, provider, child) {
        return CustomLayout(
          firstString: "Let's Sign You In",
          secString: "Welcome back, You've been missed",
          widget: provider.isLoading
              ? const LoadingWidget()
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginForm(),
                    const SizedBox(
                      height: 30,
                    ),
                    const SocialMediaAuth(
                      isLogin: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
