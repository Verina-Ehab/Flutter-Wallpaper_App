import 'package:flutter/material.dart';

import 'login/social_media_login.dart';
import 'registration/social_media_register.dart';

class SocialMediaAuth extends StatelessWidget {
  final bool isLogin;
  const SocialMediaAuth({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return isLogin ? const SocialMediaLogin() : const SocialMediaRegister();
  }
}
