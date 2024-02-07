import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/pages/onboarding/onboarding_pages.dart';

class GetStartedPages extends StatelessWidget {
  static const String launshScreen = "launchScreen";
  const GetStartedPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssetColors.bgSecondary,
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetPaths.imageGetStarted),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: Column(children: [
              verticalSpace(32),
              Text(
                "keepyoga",
                style: AssetStyles.h2
                    .copyWith(color: AppColors.getColor(ColorKey.pastelBlue)),
              ),
              verticalSpace(20),
              Text(
                "Practice yoga whenever you want.",
                textAlign: TextAlign.center,
                style: AssetStyles.h1.copyWith(
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: "Get Started",
                color: Colors.white,
                textStyle: AssetStyles.labelButtonPrimary.copyWith(
                  color: AssetColors.inkDarkest,
                  fontWeight: FontWeight.w600,
                ),
                onTap: () => nextScreenByName(OnboardingPages.onBoardingPages),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
