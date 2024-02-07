import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/asset_styles.dart';

final theme = ThemeData(
  fontFamily: 'PlusJakartaSans',
  colorScheme: const ColorScheme.light(background: Colors.white),
  bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
  textTheme: const TextTheme(
    displaySmall: AssetStyles.pSm,
    displayMedium: AssetStyles.pMd,
    displayLarge: AssetStyles.pLg,
    bodySmall: AssetStyles.pXs,
    bodyMedium: AssetStyles.pMd,
    bodyLarge: AssetStyles.pLg,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
  ),
);

class MyScrollBehavior extends ScrollBehavior {
  const MyScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(context) => const ClampingScrollPhysics();

  @override
  Widget buildOverscrollIndicator(context, child, details) => child;
}
