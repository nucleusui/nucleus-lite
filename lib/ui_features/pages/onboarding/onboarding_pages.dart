import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/pages/signin_signup/signin_pages_by_number.dart';

class OnboardingPages extends StatelessWidget {
  static const String onBoardingPages = "onBoardingPages";
  const OnboardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(24, kToolbarHeight, 24, 32),
        child: Column(children: [
          const _OnBoardingPage(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 4, 5].map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (e == 5) ? AssetColors.primaryBase : AssetColors.skyLight,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            text: "Create Account",
            padding: const EdgeInsets.symmetric(horizontal: 32),
            onTap: () => nextScreen(const SignInPagesByNumber()),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Have an account?",
                style: AssetStyles.pMd.copyWith(
                  color: AssetColors.inkDarker,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: " Log in",
                style: AssetStyles.pMd.copyWith(
                  color: AssetColors.primaryBase,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    nextScreen(const SignInPagesByNumber());
                  },
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

class _OnBoardingPage extends StatelessWidget {
  const _OnBoardingPage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(children: [
            const TextSpan(text: "you", style: AssetStyles.h2),
            TextSpan(
              text: "learn",
              style: AssetStyles.h2.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
          ]),
        ),
        const Spacer(),
        const Image(
          image: AssetImage(AssetPaths.imageOnFirst1),
          fit: BoxFit.contain,
        ),
        const Spacer(),
        Text(
          "Create brilliant learning pathways",
          style: AssetStyles.h2.copyWith(fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
