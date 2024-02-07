import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';
import 'package:nucleus_ui_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';

class MainSettingPages extends StatefulWidget {
  const MainSettingPages({super.key});
  static const String mainSettingPages = "mainSettingPages";

  @override
  State<MainSettingPages> createState() => _MainSettingPagesState();
}

class _MainSettingPagesState extends State<MainSettingPages> {
  int currentIndex = 0;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(AssetPaths.imageAvatar1),
              ),
              horizontalSpace(20),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "William",
                      style: AssetStyles.h2,
                    ),
                    Text(
                      "william@studioalva.co",
                      style: AssetStyles.pMd,
                    ),
                  ]),
            ]),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              text: "View Profile",
              height: 40,
              color: AssetColors.primaryLightest,
              textStyle: AssetStyles.pMd
                  .copyWith(color: AppColors.getColor(ColorKey.primary60)),
              onTap: () {},
            ),
          ),
          verticalSpace(20),
          ...[
            (
              icon: AssetPaths.iconPlace,
              title: "Address",
              onTap: () {
                debugPrint("Hello Address");
              },
            ),
            (
              icon: AssetPaths.iconPayment,
              title: "Payment Method",
              onTap: () {},
            ),
            (
              icon: AssetPaths.iconHelp,
              title: "Help",
              onTap: () {},
            ),
            (
              icon: AssetPaths.iconSettings,
              title: "Settings",
              onTap: () {},
            ),
          ].map((f) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(f.icon),
                  ),
                  horizontalSpace(20),
                  Text(f.title, style: AssetStyles.pMd),
                ]),
              ),
            );
          }),
          verticalSpace(16),
          const PrimaryDivider(),
          verticalSpace(16),
          ...['About', 'Logout'].map((e) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.centerLeft,
                child: Text(e, style: AssetStyles.pMd),
              ),
            );
          }),
        ]),
      ),
      bottomNavigationBar: PrimaryNavBar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
