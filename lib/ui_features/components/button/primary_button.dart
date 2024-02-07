import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 48,
    this.width = double.infinity,
    this.color,
    this.textColor,
    this.radius = 30,
    this.loading = false,
    this.transparent = false,
    this.padding,
    this.textStyle,
    this.border,
  });

  final double height;
  final double width;
  final String text;
  final Color? color;
  final Color? textColor;
  final Function()? onTap;
  final double radius;
  final bool loading;
  final bool transparent;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final BorderSide? border;

  @override
  State<PrimaryButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<PrimaryButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.padding != null || widget.transparent ? null : widget.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        onHover: (value) {
          if (kIsWeb || Platform.isMacOS) setState(() => isHover = value);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius)),
          padding: widget.padding,
          shadowColor: Colors.transparent,
          side: widget.border,
          surfaceTintColor: widget.transparent
              ? Colors.transparent
              : AppColors.getColor(ColorKey.primary20),
          foregroundColor: widget.transparent
              ? Colors.white
              : AppColors.getColor(ColorKey.primary100),
          disabledBackgroundColor: widget.transparent
              ? Colors.transparent
              : AppColors.getColor(ColorKey.grey40),
          backgroundColor: widget.transparent
              ? Colors.transparent
              : isHover
                  ? widget.color ?? AppColors.getColor(ColorKey.primary70)
                  : widget.loading
                      ? AppColors.getColor(ColorKey.primary20)
                      : widget.color ?? AppColors.getColor(ColorKey.primary60),
        ),
        child: widget.loading
            ? CupertinoActivityIndicator(
                color: AppColors.getColor(ColorKey.primary70))
            : Text(
                widget.text,
                style: widget.textStyle ??
                    AssetStyles.labelMd
                        .copyWith(color: widget.textColor ?? Colors.white),
              ),
      ),
    );
  }
}
