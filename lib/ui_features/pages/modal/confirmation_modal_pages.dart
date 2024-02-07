import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class ConfirmationModalPages extends StatefulWidget {
  const ConfirmationModalPages({super.key});
  static const String confirmationModalPages = "confirmationModalPages";

  @override
  State<ConfirmationModalPages> createState() => _ConfirmationModalPagesState();
}

class _ConfirmationModalPagesState extends State<ConfirmationModalPages> {
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
}

Future<void> _showBottomSheet(BuildContext context) {
  return primarySheetDefault(
    context,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(children: [
        const Text(
          "Remove Item ?",
          style: AssetStyles.h2,
        ),
        verticalSpace(8),
        const Text(
          "Are you sure want to remove this item from\nyour cart?",
          style: AssetStyles.pMd,
          textAlign: TextAlign.center,
        ),
        verticalSpace(40),
        PrimaryButton(
          onTap: () {},
          text: "Remove Item",
        ),
        verticalSpace(20),
        PrimaryButton(
          text: "Cancel",
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
