import 'package:flutter/material.dart';

import '../../../config/config.dart';

class ThumbnailGallery extends StatelessWidget {
  const ThumbnailGallery(this.data, {super.key, this.width = 0, this.widget});

  final double width;
  final Widget? widget;
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(children: [
          Image.asset(
            data["images"]!,
            width: width,
            fit: BoxFit.cover,
          ),
          verticalSpace(10),
          Align(
            alignment:
                data["desc"] != null ? Alignment.centerLeft : Alignment.center,
            child: Text(
              data["title"]!,
              style: AssetStyles.labelSm.copyWith(
                fontSize: data["desc"] != null ? 16 : 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          if (data["desc"] != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                data["desc"]!,
                style: AssetStyles.pXs.copyWith(
                  color: AssetColors.inkLight,
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
