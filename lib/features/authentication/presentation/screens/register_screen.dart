import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/common_widgets/custom_layout.dart';
import 'package:zetaton_wallpaper/core/common_widgets/loading_widget.dart';
import '../../controller/auth_provider.dart';
import '../widgets/registration/register_form.dart';
import '../widgets/social_media_auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          Consumer<AuthenticationProvider>(builder: (context, provider, child) {
        return CustomLayout(
          firstString: "Getting Started",
          secString: "Create an account to continue",
          widget: provider.isLoading
              ? const LoadingWidget()
              : Column(
                  children: [
                    RegisterForm(),
                    const SocialMediaAuth(
                      isLogin: false,
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
