import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/helper/form_validator.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/pages/verification/verification_pages.dart';

class SigninPagesByEmail extends StatefulWidget {
  static const String signEmail = "SignInPagesByEmail";
  const SigninPagesByEmail({super.key});

  @override
  State<SigninPagesByEmail> createState() => _SigninPagesByEmailState();
}

class _SigninPagesByEmailState extends State<SigninPagesByEmail> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text = "juinal.william@gmail.com";
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Log In"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryTextField(
                  key: const Key('email'),
                  controller: email,
                  labelText: "Email",
                  hintText: "example@org.com",
                  textInputType: TextInputType.emailAddress,
                  validator: FormValidator.email,
                ),
                const SizedBox(height: 20),
                PrimaryTextField(
                  key: const Key('password'),
                  controller: password,
                  labelText: "Password",
                  isPassword: true,
                  validator: FormValidator.password,
                ),
                PrimaryButton(
                  text: "Forgot password?",
                  transparent: true,
                  padding: EdgeInsets.zero,
                  textStyle: AssetStyles.labelMd.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () => debugPrint("Forgot password"),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: AssetStyles.pXs.copyWith(fontSize: 13),
              children: [
                const TextSpan(text: "By continuing, you agree to our "),
                TextSpan(
                  text: "Terms of Service ",
                  style: const TextStyle(color: AssetColors.primaryBase),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => debugPrint("Term Of Service"),
                ),
                const TextSpan(text: "and "),
                TextSpan(
                  text: "Privacy Policy.",
                  style: const TextStyle(color: AssetColors.primaryBase),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint("Pripacy Policy");
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            text: "Log In",
            onTap: () {
              nextScreenByName(VerificationPages.verificationPages);
            },
          ),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }
}
