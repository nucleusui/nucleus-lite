import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';

import '../../../config/config.dart';
import '../../../ui_features/model/search_model.dart';

class SearchResultPgaes extends StatefulWidget {
  const SearchResultPgaes({super.key});

  static const String searchResult = "searchResult";

  @override
  State<SearchResultPgaes> createState() => _SearchResultPgaesState();
}

class _SearchResultPgaesState extends State<SearchResultPgaes> {
  Faker faker = Faker();
  TextEditingController search = TextEditingController();
  List<Search> searchs = [];

  @override
  void initState() {
    searchs = List.generate(20, (index) {
      return Search(
        name: faker.person.firstName(),
        avatar: "https://picsum.photos/id/${Random().nextInt(20)}/200/300",
        position: [
          Position(name: '${faker.company.position()}, ${faker.company.name()}')
        ],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          verticalSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(children: [
              Expanded(
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
                      AssetPaths.iconClose,
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ),
              horizontalSpace(15),
              PrimaryButton(
                text: "Cancel",
                height: 24,
                transparent: true,
                padding: const EdgeInsets.symmetric(horizontal: 0),
                textColor: AppColors.getColor(ColorKey.primary60),
                onTap: () => Navigator.pop(context),
              ),
            ]),
          ),
          verticalSpace(12),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: searchs.map((data) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 22.5,
                          backgroundColor:
                              AppColors.getColor(ColorKey.primary20),
                          backgroundImage: NetworkImage(data.avatar),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: AssetStyles.pMd,
                              ),
                              verticalSpace(4),
                              Text(
                                data.position.first.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AssetStyles.pSm
                                    .copyWith(color: AssetColors.inkLighter),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
