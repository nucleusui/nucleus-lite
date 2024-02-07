import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/pages/location/location_pages.dart';

class StepTwoPerson extends StatelessWidget {
  const StepTwoPerson({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    controllerEmail.text = "juinal.william@gmail.com";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          verticalSpace(40),
          const Text(
            "What’s your email address?",
            style: AssetStyles.labelLg,
          ),
          verticalSpace(16),
          PrimaryTextField(
            controller: controllerEmail,
            textInputType: TextInputType.emailAddress,
            hintText: "input email address",
            labelText: "Email",
          ),
          verticalSpace(50),
        ],
        const Spacer(),
        PrimaryButton(
          onTap: () {
            nextScreen(const ChooseLocationPages());
          },
          text: "Continue",
        ),
        verticalSpace(20),
      ],
    );
  }
}
