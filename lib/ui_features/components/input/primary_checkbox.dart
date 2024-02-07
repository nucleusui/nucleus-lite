import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox({
    super.key,
    required this.value,
    this.onChange,
  });

  final Function(bool?)? onChange;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: Checkbox(
        value: value,
        onChanged: onChange,
        activeColor: AppColors.getColor(ColorKey.primary60),
        side: BorderSide(color: AppColors.getColor(ColorKey.grey20)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
