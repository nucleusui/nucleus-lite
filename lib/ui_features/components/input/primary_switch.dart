import 'package:flutter/cupertino.dart';
import 'package:nucleus_ui_app/config/config.dart';

class PrimarySwitch extends StatelessWidget {
  const PrimarySwitch({
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
      child: CupertinoSwitch(
        value: value,
        onChanged: onChange,
        activeColor: AppColors.getColor(ColorKey.primary60),
      ),
    );
  }
}
