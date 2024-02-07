import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';

class HighLightsPages extends StatelessWidget {
  static const String highlightsPages = "highlightsPages";
  const HighLightsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssetColors.bgHighLight,
      body: Stack(children: [
        const Align(
          alignment: Alignment.bottomCenter,
          child: Image(
            image: AssetImage(AssetPaths.imageHighlight),
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
        ),
        Column(children: [
          Expanded(
            child: Column(children: [
              const PrimaryAppBar(title: "Highlights"),
              verticalSpace(32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "How New York region\nbecame the new epicenter ",
                  style: AssetStyles.h2,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Is New York City unique in the country’s\ncoronavirus fight — or is it just one of the\nfirst?",
                  style: AssetStyles.pSm,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "by John Cassidy  ·  March 5, 2020",
                  style: AssetStyles.labelSm,
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3, 4, 5].asMap().entries.map((e) {
              return Container(
                width: 50,
                height: 3,
                color: e.key < 2 ? AssetColors.skyWhite : AssetColors.textGrey,
                margin: const EdgeInsets.only(right: 10),
              );
            }).toList(),
          ),
          verticalSpace(20),
        ]),
      ]),
    );
  }
}
