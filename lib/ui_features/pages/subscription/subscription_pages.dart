import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';

class SubScriptionPages extends StatelessWidget {
  const SubScriptionPages({super.key});
  static const String subscriptionPages = "subscriptionPages";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      appBar: PrimaryAppBar(hideLeading: true, actions: [
        PrimaryButton(
          text: "Skip",
          height: 24,
          transparent: true,
          padding: EdgeInsets.zero,
          textColor: AppColors.getColor(ColorKey.primary60),
          onTap: () => Navigator.pop(context),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Get unlimited access to our programs.",
              style: AssetStyles.h2,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Take the first step towards a healthier and\nhappier life.",
              style: AssetStyles.pSm,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(32),
          CarouselSlider(
            options: CarouselOptions(
              initialPage: 1,
              disableCenter: true,
              enlargeCenterPage: true,
              aspectRatio: 1,
              height: 352,
              enableInfiniteScroll: false,
            ),
            items: [1, 2, 3].map((e) {
              return Container(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  const Text(
                    "POPULAR",
                    style: AssetStyles.pXs,
                  ),
                  verticalSpace(15),
                  const Text(
                    "Exercise Class",
                    style: AssetStyles.labelLg,
                  ),
                  verticalSpace(15),
                  const Text(
                    "\$60.99",
                    style: AssetStyles.h0,
                  ),
                  verticalSpace(15),
                  const Text(
                    "For 1 Year",
                    style: AssetStyles.pXs,
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52),
                    child: Text(
                      "iOS, Android, Apple TV, Roku,\nAmazon Fire TV, web browser",
                      style: AssetStyles.pXs,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(20),
                  PrimaryButton(
                    onTap: () {},
                    width: screenWidth(context),
                    color: AssetColors.primaryBase,
                    text: "Subscribe",
                    height: 50,
                  ),
                ]),
              );
            }).toList(),
          ),
          verticalSpace(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "You will be charged \$9.99 (monthly plan) or \$60.99\n(annual plan) through your iTunes account. You can\ncancel at any time if your not satisfied.",
              style: AssetStyles.pXs,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
