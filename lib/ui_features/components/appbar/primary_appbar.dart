import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/config.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    this.backgroundColor,
    this.heightAppBar = kToolbarHeight,
    this.title,
    this.leading,
    this.elevation,
    this.actions,
    this.onTapBack,
    this.titleStyle = AssetStyles.pLg,
    this.iconColor = AssetColors.primaryBase,
    this.titleWidget,
    this.systemOverlayStyle =
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    this.hideLeading = false,
    this.icon = AssetPaths.iconBack,
  });

  final Color? backgroundColor;
  final double heightAppBar;
  final String? title;
  final Widget? leading;
  final double? elevation;
  final List<Widget>? actions;
  final Function()? onTapBack;
  final TextStyle titleStyle;
  final Color iconColor;
  final Widget? titleWidget;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool hideLeading;
  final String icon;

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemOverlayStyle,
      title: titleWidget ?? Text(title ?? "", style: titleStyle),
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottomOpacity: 0,
      elevation: 0,
      actions: actions == null
          ? null
          : [
              ...actions!,
              ...[const SizedBox(width: 8)]
            ],
      leading: hideLeading
          ? null
          : leading ??
              IconButton(
                splashRadius: 15,
                onPressed: () {
                  if (onTapBack != null) {
                    onTapBack!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: SvgPicture.asset(
                  icon,
                  width: 8,
                  height: 16,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
    );
  }
}
