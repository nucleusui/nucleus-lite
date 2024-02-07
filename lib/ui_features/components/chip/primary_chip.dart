import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    super.key,
    this.text = "",
    this.height = 48,
    this.radius = 100,
    this.onTap,
    this.isActive = false,
    this.alignment = Alignment.center,
    this.padding,
    this.actions,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final double height;
  final double radius;
  final bool isActive;
  final Function()? onTap;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;
  final Widget? actions;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor ??
                (isActive
                    ? AppColors.getColor(ColorKey.primary60)
                    : onTap == null
                        ? AppColors.getColor(ColorKey.grey20)
                        : AppColors.getColor(ColorKey.primary20)),
          ),
          child: Stack(alignment: Alignment.centerRight, children: [
            Align(
              alignment: alignment,
              child: Text(
                text,
                style: AssetStyles.labelMd.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: textColor ??
                      (isActive
                          ? Colors.white
                          : onTap == null
                              ? AppColors.getColor(ColorKey.grey50)
                              : AppColors.getColor(ColorKey.primary70)),
                ),
              ),
            ),
            if (actions != null) actions!,
          ]),
        ),
      ),
    );
  }
}
