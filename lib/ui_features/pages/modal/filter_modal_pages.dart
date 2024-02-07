import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucleus_ui_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui_app/ui_features/model/sort_model.dart';

class FilterModalPages extends StatefulWidget {
  const FilterModalPages({super.key});
  static const String filterModalPages = "filterModalPages";

  @override
  State<FilterModalPages> createState() => _FilterModalPagesState();
}

class _FilterModalPagesState extends State<FilterModalPages> {
  final List<SortModel> sortData = [
    SortModel(name: "All Categories", status: false),
    SortModel(name: "Smart Watches", status: true),
    SortModel(name: "Cell Phones & Accessories", status: true),
    SortModel(name: "Sporting Goods", status: false),
    SortModel(name: "Computer", status: false),
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryButton(
          text: "Show Modal",
          padding: const EdgeInsets.symmetric(horizontal: 32),
          onTap: () => _showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext context) {
    return primarySheetDefault(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Filter", style: AssetStyles.h2),
          ),
          verticalSpace(20),
          ...sortData.map((e) {
            return InkWell(
              onTap: () => setInnerState(() => e.status = !e.status),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                child: Row(children: [
                  Text(e.name, style: AssetStyles.pMd),
                  const Spacer(),
                  PrimaryCheckBox(
                    value: e.status,
                    onChange: (vale) =>
                        setInnerState(() => e.status = !e.status),
                  ),
                ]),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(children: [
              PrimaryButton(
                onTap: () {},
                text: "Show 340 Result",
              ),
              verticalSpace(20),
              PrimaryButton(
                text: "Reset",
                height: 24,
                transparent: true,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                textStyle: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {},
              ),
            ]),
          ),
        ]);
      }),
    );
  }
}
