import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';

class EmptyStatePages extends StatefulWidget {
  static const String emptyStatePages = "emptyStatePages";
  const EmptyStatePages({super.key});

  @override
  State<EmptyStatePages> createState() => _EmptyStatePagesState();
}

class _EmptyStatePagesState extends State<EmptyStatePages> {
  int currentIndex = 0;
  final List<NavbarModel> navbars = [
    NavbarModel(status: true),
    NavbarModel(status: true),
    NavbarModel(status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(hideLeading: true, title: "Saved Items"),
      body: Column(children: [
        const Spacer(),
        SizedBox(
          width: screenWidth(context) * 0.65,
          child: Column(children: [
            const Image(image: AssetImage(AssetPaths.imageEmpty)),
            Text(
              "No Saved Items",
              style: AssetStyles.labelLg.copyWith(fontWeight: FontWeight.w900),
            ),
            verticalSpace(12),
            const Text(
              "Tap the heart icon near any product\nand we’ll save it here for you.",
              style: AssetStyles.pSm,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            PrimaryButton(
              onTap: () {},
              width: 170,
              text: "Discover",
            ),
          ]),
        ),
        const Spacer(),
        PrimaryNavBar(
          index: currentIndex,
          data: navbars,
          onTap: (index) => setState(() => currentIndex = index),
        )
      ]),
    );
  }
}
