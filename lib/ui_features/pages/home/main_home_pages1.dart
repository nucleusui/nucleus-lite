import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucleus_ui_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui_app/ui_features/components/post/big_post.dart';
import 'package:nucleus_ui_app/ui_features/components/post/small_post.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';
import 'package:nucleus_ui_app/ui_features/model/posts_model.dart';

class MainHomePages extends StatefulWidget {
  const MainHomePages({super.key});
  static const String mainHomePages = "mainHomePages";

  @override
  State<MainHomePages> createState() => _MainHomePagesState();
}

class _MainHomePagesState extends State<MainHomePages> {
  int currentIndex = 0;
  int idPost = 0;
  int? selectedChip;

  final List<Posts> posts = [
    Posts(
      title: "A Plan to Rebuild the Bus Terminal Everyone Loves to Hate",
      imgThumb: AssetPaths.imageThumb1,
      time: "1h ago",
      authors: "Troy Corlson",
    ),
    Posts(
      title: "California Ends Strict Virus Restrictions as New Cases Fall",
      imgThumb: AssetPaths.imagePost1,
      time: "2h ago",
      authors: "Isabella Kwai",
    ),
    Posts(
      title: "Schools Were Set to Reopen. Then the Teachers’ Union Stepped In.",
      imgThumb: AssetPaths.imagePost2,
      time: "3h ago",
      authors: "Tracey Trully",
    ),
    Posts(
      title: "Do Curfews Slow the Coronavirus?",
      imgThumb: AssetPaths.imagePost3,
      time: "4h ago",
      authors: "Gina Kolata",
    ),
  ];
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryNavBar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          physics: const ClampingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Good Morning", style: AssetStyles.h1),
                      verticalSpace(5),
                      const Text(
                        "Monday, January 25, 2021",
                        style: AssetStyles.pMd,
                      ),
                    ],
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  const Image(image: AssetImage(AssetPaths.imageMatahari)),
                  verticalSpace(5),
                  const Text(
                    "28°C",
                    style: AssetStyles.labelMd,
                  ),
                ]),
              ]),
            ),
            verticalSpace(15),
            Divider(
              height: 1,
              thickness: 0.5,
              color: AppColors.getColor(ColorKey.grey20),
            ),
            verticalSpace(20),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 8,
                children: ["World", "U.S", "Politics", "Tech", "Science"]
                    .asMap()
                    .entries
                    .map((e) {
                  return PrimaryChip(
                    height: 32,
                    text: e.value,
                    alignment: Alignment.center,
                    isActive: selectedChip == e.key,
                    onTap: () => setState(() => selectedChip = e.key),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  );
                }).toList(),
              ),
            ),
            verticalSpace(5),
            if (posts.isNotEmpty) BigPost(posts.first),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: Column(
                children: posts.map((e) {
                  if (idPost != 0) {
                    idPost++;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SmallPost(e),
                    );
                  } else {
                    idPost++;
                  }
                  return const SizedBox();
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
