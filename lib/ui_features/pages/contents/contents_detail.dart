import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/pages/highlights/highlight_pages.dart';

class ContentDetailPages extends StatelessWidget {
  const ContentDetailPages({super.key});
  static const String contentDetail = "contentDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: screenWidth(context),
                  height: screenHeight(context) * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetPaths.imageDetail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalSpace(30),
                const Text("Basic Yoga", style: AssetStyles.h1),
                verticalSpace(20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.center,
                    style: AssetStyles.pMd,
                  ),
                ),
                verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (title: "15 Minutes", subTitle: "Duration"),
                    (title: "Beginner 1", subTitle: "Level 1")
                  ].map((e) {
                    return Column(children: [
                      Text(e.title, style: AssetStyles.labelMd),
                      Text(e.subTitle, style: AssetStyles.pMd),
                    ]);
                  }).toList(),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconRoundedButton(
                  icon: AssetPaths.iconSettings,
                  onTap: () {},
                ),
                PrimaryButton(
                  text: "Start",
                  width: 160,
                  color: AssetColors.inkDarkest,
                  onTap: () {
                    nextScreen(const HighLightsPages());
                  },
                ),
                IconRoundedButton(
                  icon: AssetPaths.iconMusic,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ]),
        PrimaryAppBar(iconColor: Colors.white, actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetPaths.iconShare),
          ),
        ]),
      ]),
    );
  }
}
