import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/ui_features/components/chip/primary_chip.dart';

import '../../../../config/config.dart';
import '../../../../ui_features/model/sort_model.dart';

class StepFirstPerson extends StatefulWidget {
  const StepFirstPerson({super.key, required this.onTap});

  final void Function() onTap;

  @override
  State<StepFirstPerson> createState() => _StepFirstPersonState();
}

class _StepFirstPersonState extends State<StepFirstPerson> {
  String? value;
  List<SortModel> items = [
    SortModel(name: "Lose weight and increase stamina", status: true),
    SortModel(name: "Maintain weigh for health", status: false),
    SortModel(name: "Gain weight for building muscle", status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        const Text("Tell us your goal", style: AssetStyles.h1),
        verticalSpace(8),
        Text(
          "We will recommend diets and exercises that suit you",
          style: AssetStyles.labelMd.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.getColor(ColorKey.grey60),
          ),
        ),
        verticalSpace(40),
        for (final e in items)
          PrimaryChip(
            text: e.name,
            isActive: value == e.name,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            onTap: () {
              if (value != e.name) {
                value = e.name;
              } else {
                value = null;
              }
              setState(() {});
              widget.onTap();
            },
          ),
      ],
    );
  }
}
