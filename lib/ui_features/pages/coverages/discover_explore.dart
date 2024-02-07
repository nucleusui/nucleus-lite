import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/post/coverage_post.dart';

class DiscoverExplorePages extends StatefulWidget {
  const DiscoverExplorePages({super.key});
  static const String discoverPages = "discoverPages";

  @override
  State<DiscoverExplorePages> createState() => _DiscoverExplorePagesState();
}

class _DiscoverExplorePagesState extends State<DiscoverExplorePages> {
  final List<Map<String, String>> coverages = [
    {
      "icon": AssetPaths.iconWho,
      "title": "IDIA and the WHO announce strategic collaboration to support",
      "imgThumb": AssetPaths.imagePostWho,
      "organization": "World Health Organization",
      "time": "17 hours ago",
      "desc":
          "The World Health Organization (WHO) and the International Development Innovation Alliance... ",
    },
    {
      "icon": AssetPaths.iconFs,
      "title":
          "Sony Just Destroyed the Competition With New Sony a1 Mirroless...",
      "imgThumb": AssetPaths.imagePostFs,
      "organization": "Fstoppers",
      "time": "Yesterday",
    },
    {
      "icon": AssetPaths.iconT3,
      "title": "iPad Air (2020) vs Samsung Galaxy Tab S7",
      "imgThumb": AssetPaths.imagePostT3,
      "organization": "T3",
      "time": "2 days ago",
    },
    {
      "icon": AssetPaths.iconT3,
      "title": "iPad Air (2020) vs Samsung Galaxy Tab S7",
      "imgThumb": AssetPaths.imagePostT3,
      "organization": "T3",
      "time": "2 days ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryAppBar(title: "Full Coverage", actions: [
            IconButton(
              icon: SvgPicture.asset(
                AssetPaths.iconSearch,
                colorFilter: ColorFilter.mode(
                  AppColors.getColor(ColorKey.primary60),
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            ),
          ]),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Coverage",
                    style: AssetStyles.h2,
                  ),
                  verticalSpace(30),
                  ...coverages.map((e) => CoveragePost(e)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
