// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../../../core/helpers/form_validator.dart';
import '../../../controller/auth_provider.dart';
import '../../../../../core/common_widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<AuthProvider>();
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) => validateEmail(value),
              // onChanged: (value) {
              //   provider.email = value;
              // },
            ),
            CustomTextFormField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
              validator: (value) => validatePassword(value),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Your Password ? ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider.startLoading();
                    authProvider.logInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                        context);
                    authProvider.stopLoading();
                  }
                },
                btnLabel: "Login"),
          ],
        ));
  }
}
