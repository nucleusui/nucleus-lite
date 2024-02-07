import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui_app/ui_features/model/categories_model.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';

class SearchPages extends StatefulWidget {
  const SearchPages({super.key});
  static const String searchPages = "searchPages";

  @override
  State<SearchPages> createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  int currentIndex = 0;
  TextEditingController search = TextEditingController();

  final List<NavbarModel> navbars = [
    NavbarModel(title: "Feed"),
    NavbarModel(title: "Title"),
    NavbarModel(title: "Title"),
    NavbarModel(title: "Title"),
    NavbarModel(title: "Title"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: PrimaryTextField(
              controller: search,
              hintText: "Search",
              height: 44,
              borderRadius: BorderRadius.circular(100),
              contentPadding: const EdgeInsets.only(top: 12),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(16, 1, 8, 0),
                child: SvgPicture.asset(
                  width: 16,
                  height: 16,
                  AssetPaths.iconSearch,
                ),
              ),
              fillColor: AssetColors.skyLighter,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, top: 1, left: 8),
                child: SvgPicture.asset(
                  AssetPaths.iconVoice,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Recent Search",
                      style: AssetStyles.labelLg
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  verticalSpace(10),
                  ...[
                    Categories(category: "Burger King"),
                    Categories(category: "Gong Cha"),
                  ].map((e) => _ItemList(e.category)),
                  verticalSpace(24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Categories",
                      style: AssetStyles.labelLg
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  verticalSpace(10),
                  ...[
                    Categories(category: "Asian"),
                    Categories(category: "Breakfast"),
                    Categories(category: "Burger"),
                    Categories(category: "Chicken"),
                    Categories(category: "Chinese"),
                    Categories(category: "Sweets"),
                  ].map((e) => _ItemList(e.category)),
                ],
              ),
            ),
          ),
          PrimaryNavBar(
            index: currentIndex,
            data: navbars,
            onTap: (index) => setState(() => currentIndex = index),
          )
        ]),
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Text(
          text,
          style: AssetStyles.pMd,
        ),
      ),
    );
  }
}
