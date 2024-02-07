import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class InfoModalPages extends StatefulWidget {
  const InfoModalPages({super.key});
  static const String infoModalPages = "infoModalPages";

  @override
  State<InfoModalPages> createState() => _InfoModalPagesState();
}

class _InfoModalPagesState extends State<InfoModalPages> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          text: "Show Modal",
          padding: const EdgeInsets.symmetric(horizontal: 32),
          onTap: () => _showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext context) {
    return primarySheetDefault(
      context,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: Column(children: [
          const Text(
            "Introducing New Feature",
            style: AssetStyles.h2,
          ),
          verticalSpace(8),
          const Text(
            "This is a short explanation about the new\nfeature of the app.",
            style: AssetStyles.pMd,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            AssetPaths.imageModel,
            height: 220,
            width: 220,
          ),
          verticalSpace(20),
          PrimaryButton(
            onTap: () {},
            text: "Check Out",
          ),
          verticalSpace(20),
          PrimaryButton(
            text: "Maybe Later",
            height: 24,
            transparent: true,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            textStyle: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey100),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
