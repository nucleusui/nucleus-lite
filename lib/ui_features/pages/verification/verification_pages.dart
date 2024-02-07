import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/pin_textfield.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/personalization_first_page.dart';

class VerificationPages extends StatelessWidget {
  static const String verificationPages = "verificationPages";
  const VerificationPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryButton(
          text: "Change number",
          height: 24,
          transparent: true,
          padding: EdgeInsets.zero,
          textStyle: AssetStyles.labelMd.copyWith(
            color: AppColors.getColor(ColorKey.primary60),
            height: 0.1,
          ),
          onTap: () {},
        ),
        const SizedBox(width: 12),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Column(children: [
            const Text(
              "Enter authentication code",
              style: AssetStyles.h2,
            ),
            verticalSpace(10),
            Text.rich(
              textAlign: TextAlign.center,
              style: AssetStyles.labelMd.copyWith(fontWeight: FontWeight.w300),
              TextSpan(children: [
                const TextSpan(
                  text:
                      "Enter the 4-digit that we have sent via the phone number ",
                ),
                TextSpan(
                  text: "+62 813-8172-5977",
                  style: AssetStyles.labelMd.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            verticalSpace(30),
            PinTextField(
              onCompleted: (value) {
                debugPrint('pin value: $value');
                FocusManager().primaryFocus?.unfocus();
              },
            ),
          ]),
          const Spacer(),
          PrimaryButton(
            text: "Continue",
            onTap: () {
              nextScreen(const PersonalizationFirstPage());
            },
          ),
          verticalSpace(16),
          PrimaryButton(
            onTap: () {},
            color: AssetColors.skyLight,
            text: "Resend Code in 12s",
            textColor: AppColors.getColor(ColorKey.grey50),
          ),
          verticalSpace(20),
        ]),
      ),
    );
  }
}
