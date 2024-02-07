import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucleus_ui_app/ui_features/model/sort_model.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/personalization_second_page.dart';

class PersonalizationFirstPage extends StatefulWidget {
  static const String personalizationFirstPage = "personalizationFirstPage";
  const PersonalizationFirstPage({super.key});

  @override
  State<PersonalizationFirstPage> createState() =>
      _PersonalizationFirstPageState();
}

class _PersonalizationFirstPageState extends State<PersonalizationFirstPage> {
  List<SortModel> items = [
    SortModel(name: "None", status: true),
    SortModel(name: "Core Strength", status: false),
    SortModel(name: "Chest", status: false),
    SortModel(name: "Shoulder", status: false),
    SortModel(name: "Backbends", status: false),
    SortModel(name: "Traps", status: false),
    SortModel(name: "Forearms", status: false),
    SortModel(name: "Hamstring", status: false),
    SortModel(name: "Upper Back", status: false),
    SortModel(name: "Lower Back", status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [0, 2, 3].map((e) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    (e == 2) ? AssetColors.primaryBase : AssetColors.skyLight,
              ),
            );
          }).toList(),
        ),
        actions: [
          PrimaryButton(
            text: "Skip",
            height: 24,
            transparent: true,
            padding: EdgeInsets.zero,
            textStyle: AssetStyles.labelMd.copyWith(
              color: AppColors.getColor(ColorKey.primary60),
              height: 0.1,
            ),
            onTap: () => backScreenUntil(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Column(children: [
          const Text("Practice Area", style: AssetStyles.h1),
          verticalSpace(4),
          Text(
            "So we can recommend exercises",
            style: AssetStyles.labelMd.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          verticalSpace(8),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              padding: const EdgeInsets.only(top: 24),
              itemBuilder: (contex, index) {
                final data = items[index];
                return PrimaryChip(
                  text: data.name,
                  isActive: data.status,
                  actions: Visibility(
                    visible: data.status,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                        AssetPaths.iconCheck,
                        width: 14,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    final index = items.indexWhere((a) => a.name == data.name);
                    setState(() => items[index].status = !items[index].status);
                  },
                );
              },
            ),
          ),
          verticalSpace(10),
          PrimaryButton(
            text: "Select",
            onTap: () {
              nextScreen(const PersonalizationSecondPages());
            },
          ),
        ]),
      ),
    );
  }
}
