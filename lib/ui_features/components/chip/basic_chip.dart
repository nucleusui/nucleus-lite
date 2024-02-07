import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class BasicChip extends StatelessWidget {
  const BasicChip({
    super.key,
    this.border = false,
    this.alignment,
    required this.text,
    this.bgColor,
    this.style,
    this.padding,
    this.margin,
    this.onTap,
    this.isActive = false,
    this.bgSecond,
  });

  final bool? border;
  final String? text;
  final Color? bgColor;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final bool isActive;
  final AlignmentGeometry? alignment;
  final Color? bgSecond;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          alignment: alignment,
          decoration: BoxDecoration(
            color: isActive
                ? AssetColors.primaryLightest
                : bgSecond ?? AssetColors.skyWhite,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive ? Colors.transparent : AssetColors.skyLighter,
            ),
          ),
          child: Text(
            text!,
            style: AssetStyles.pMd.copyWith(
              color:
                  isActive ? AssetColors.primaryBase : AssetColors.inkDarkest,
            ),
          ),
        ),
      ),
    );
  }
}
