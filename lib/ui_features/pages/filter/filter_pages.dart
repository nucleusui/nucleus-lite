import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_switch.dart';

class FilterPages extends StatefulWidget {
  const FilterPages({super.key});
  static const String filterPages = "filterPages";

  @override
  State<FilterPages> createState() => _FilterPagesState();
}

class _FilterPagesState extends State<FilterPages> {
  List<bool> isChecked = [
    false,
    true,
    false,
    true,
    false,
  ];

  bool isCondition = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "Filter", actions: [
        PrimaryButton(
          text: "Reset",
          height: 24,
          transparent: true,
          padding: EdgeInsets.zero,
          textColor: AppColors.getColor(ColorKey.primary60),
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(width: 8),
      ]),
      body: Column(children: [
        verticalSpace(8),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              _FilterComboBox(
                title: "Shop Location",
                subTitle: "Anywhere",
                onTap: () {},
              ),
              verticalSpace(16),
              const PrimaryDivider(),
              verticalSpace(16),
              _FilterComboBox(
                title: "Condition",
                isActive: isCondition,
                onTap: () {
                  setState(() {
                    isCondition = !isCondition;
                  });
                },
              ),
              Visibility(
                visible: isCondition,
                child: Column(
                  children: [
                    ...['New', 'New Other', 'Unused'].asMap().entries.map((e) {
                      return InkWell(
                        onTap: () => setState(
                            () => isChecked[e.key] = !isChecked[e.key]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.value,
                                style: AssetStyles.pMd,
                              ),
                              PrimaryCheckBox(
                                value: isChecked[e.key],
                                onChange: (value) => setState(
                                    () => isChecked[e.key] = !isChecked[e.key]),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    verticalSpace(16),
                  ],
                ),
              ),
              const PrimaryDivider(),
              _FilterComboBox(
                title: "Price",
                subTitle: "Under \$100",
                onTap: () {},
              ),
              const PrimaryDivider(),
              Column(
                children: ['In Stock', 'Sale'].asMap().entries.map((e) {
                  final index = e.key + 3;
                  return Column(
                    children: [
                      verticalSpace(16),
                      InkWell(
                        onTap: () => setState(
                            () => isChecked[index] = !isChecked[index]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.value,
                                style: AssetStyles.pMd,
                              ),
                              PrimarySwitch(
                                value: isChecked[index],
                                onChange: (value) => setState(
                                    () => isChecked[index] = !isChecked[index]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      if (e.value != 'Sale') const PrimaryDivider(),
                    ],
                  );
                }).toList(),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: PrimaryButton(
            onTap: () {},
            text: "Show (32 results)",
          ),
        ),
      ]),
    );
  }
}

class _FilterComboBox extends StatelessWidget {
  const _FilterComboBox({
    this.title,
    this.subTitle,
    this.isActive = false,
    required this.onTap,
  });

  final String? title;
  final String? subTitle;
  final Function() onTap;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title!, style: AssetStyles.labelMd),
              if (subTitle != null) verticalSpace(5),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: AssetStyles.pSm
                      .copyWith(color: AppColors.getColor(ColorKey.grey50)),
                ),
            ]),
            SvgPicture.asset(
              (isActive!) ? AssetPaths.iconUp : AssetPaths.iconDown,
              width: 8,
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
