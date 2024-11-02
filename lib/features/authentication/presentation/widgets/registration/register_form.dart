// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton_wallpaper/core/helpers/form_validator.dart';

import '../../../../../core/common_widgets/custom_elevated_button.dart';
import '../../../controller/auth_provider.dart';
import '../../../../../core/common_widgets/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final provider = context.watch<AuthProvider>();
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _userNameController,
              hintText: "Username",
              validator: (value) => validateName(value),
            ),
            CustomTextFormField(
              controller: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              validator: (value) => validateEmail(value),
            ),
            CustomTextFormField(
              controller: _phoneNumberController,
              hintText: "Phone Number",
              keyboardType: TextInputType.number,
              validator: (value) => validatePhone(value),
            ),
            CustomTextFormField(
              controller: _passwordController,
              hintText: "Password",
              validator: (value) => validatePassword(value),
            ),
            CustomTextFormField(
              controller: _confirmPasswordController,
              hintText: "Confirm Password",
              validator: (value) =>
                  validateConfirmPassword(_passwordController.text, value),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    authProvider.startLoading();
                    authProvider.registerWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                        phoneNumber: _phoneNumberController.text,
                        name: _userNameController.text,
                        context: context);
                    authProvider.stopLoading();
                  }
                },
                btnLabel: "Register"),
          ],
        ));
  }
}
