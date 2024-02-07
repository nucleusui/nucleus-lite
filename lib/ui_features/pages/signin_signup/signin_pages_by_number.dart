import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/dropdown/flag_country_number.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/pages/signin_signup/signin_pages_by_email.dart';
import 'package:nucleus_ui_app/ui_features/pages/verification/verification_pages.dart';

class SignInPagesByNumber extends StatelessWidget {
  static const String signInNumber = "signInNumber";
  const SignInPagesByNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: const PrimaryAppBar(heightAppBar: 56),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Welcome back.", style: AssetStyles.h1),
          verticalSpace(8),
          Text(
            'Log in to your account',
            style: AssetStyles.pMd.copyWith(height: 0.8),
          ),
          verticalSpace(28),
          PrimaryTextField(
            controller: numberController,
            contentPadding: const EdgeInsets.only(top: 15),
            prefixIcon: const CountryDropdown(),
            hintText: "Placeholder text",
          ),
          verticalSpace(15),
          Text(
            'You will receive an SMS verification that may apply message and data rates.',
            style: AssetStyles.pXs.copyWith(color: AssetColors.secondaryColor),
          ),
          const Spacer(),
          PrimaryButton(
            text: "Log In",
            onTap: () {
              nextScreenByName(VerificationPages.verificationPages);
            },
          ),
          verticalSpace(12),
          Center(
            child: PrimaryButton(
              text: "Use email, instead",
              height: 24,
              transparent: true,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              textColor: AppColors.getColor(ColorKey.primary60),
              onTap: () {
                nextScreenByName(SigninPagesByEmail.signEmail);
              },
            ),
          ),
          verticalSpace(24),
        ]),
      ),
    );
  }
}
