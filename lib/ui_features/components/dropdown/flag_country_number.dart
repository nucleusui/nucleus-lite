import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage(AssetPaths.iconIdn),
            fit: BoxFit.cover,
          ),
          horizontalSpace(5),
          Text(
            "+62",
            style: AssetStyles.pMd.copyWith(fontFamily: 'Inter'),
          ),
          horizontalSpace(5),
          SvgPicture.asset(AssetPaths.iconDown)
        ],
      ),
    );
  }
}
