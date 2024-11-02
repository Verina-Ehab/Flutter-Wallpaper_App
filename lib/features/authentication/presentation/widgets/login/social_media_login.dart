import 'package:flutter/material.dart';
import 'package:zetaton_wallpaper/core/helpers/navigation.dart';
import 'package:zetaton_wallpaper/features/authentication/presentation/screens/register_screen.dart';

import '../../../../../core/contants/colors.dart';
import '../../../../../core/contants/imgs_pathes.dart';
import '../../../../../core/common_widgets/custom_elevated_button.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          "Or Continue With Social Account",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(
          bckgColor: MyColors.blue,
          onTap: () {},
          btnLabel: '  Facebook',
          imgName: facebook,
          imgWidth: 30,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomElevatedButton(
          bckgColor: MyColors.transparent,
          frgColor: MyColors.black,
          onTap: () {},
          btnLabel: '  Google',
          imgName: google,
          imgWidth: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't Have An Account? ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            GestureDetector(
              onTap: () =>
                  navigateReplacementTo(context, const RegisterScreen()),
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        )
      ],
    );
  }
}
