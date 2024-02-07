import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui_app/ui_features/model/sort_model.dart';

class SortModalPages extends StatefulWidget {
  const SortModalPages({super.key});
  static const String sortModalPages = "sortModalPages";

  @override
  State<SortModalPages> createState() => _SortModalPagesState();
}

class _SortModalPagesState extends State<SortModalPages> {
  final List<SortModel> sortData = [
    SortModel(name: "Custom", status: false),
    SortModel(name: "Relevance", status: true),
    SortModel(name: "Most Recent", status: false),
    SortModel(name: "Lowest Price", status: false),
    SortModel(name: "Highest Price", status: false),
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
            child: Text("Sort", style: AssetStyles.h2),
          ),
          verticalSpace(20),
          ...sortData.map((e) {
            return InkWell(
              onTap: () => setInnerState(() => e.status = !e.status),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.name, style: AssetStyles.pMd),
                    if (e.status) SvgPicture.asset(AssetPaths.iconCheck),
                  ],
                ),
              ),
            );
          }),
          verticalSpace(32),
        ]);
      }),
    );
  }
}
