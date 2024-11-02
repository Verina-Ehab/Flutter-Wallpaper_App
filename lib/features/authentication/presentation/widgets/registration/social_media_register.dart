import 'package:flutter/material.dart';

import '../../../../../core/contants/colors.dart';
import '../../../../../core/contants/imgs_pathes.dart';
import '../../../../../core/helpers/navigation.dart';
import '../../../../../core/common_widgets/custom_elevated_button.dart';
import '../../screens/login_screen.dart';

class SocialMediaRegister extends StatelessWidget {
  const SocialMediaRegister({
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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomElevatedButton(
                bckgColor: MyColors.blue,
                onTap: () {},
                btnLabel: '  Facebook',
                imgName: facebook,
                imgWidth: 30,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: CustomElevatedButton(
                bckgColor: MyColors.transparent,
                frgColor: MyColors.black,
                onTap: () {},
                btnLabel: '  Google',
                imgName: google,
                imgWidth: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already Have An Account? ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            GestureDetector(
              onTap: () => navigateReplacementTo(context, const LoginScreen()),
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
