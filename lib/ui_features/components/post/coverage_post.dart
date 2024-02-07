import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class CoveragePost extends StatelessWidget {
  const CoveragePost(this.data, {super.key});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(
          child: Column(children: [
            Row(children: [
              Image.asset(data["icon"]!, width: 24, height: 24),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  data["organization"]!,
                  style: AssetStyles.pSm,
                ),
              ),
            ]),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                data["title"]!,
                style: AssetStyles.labelLg,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
        ),
        horizontalSpace(12),
        Image.asset(data["imgThumb"]!, width: 100, height: 100),
      ]),
      verticalSpace(20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          data["time"]!,
          style: AssetStyles.pXs
              .copyWith(color: AppColors.getColor(ColorKey.grey50)),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.more_horiz),
        )
      ]),
      if (data["desc"] != null) ...[
        verticalSpace(20),
        Text(
          data["desc"]!,
          maxLines: 2,
          style: AssetStyles.pSm,
          overflow: TextOverflow.ellipsis,
        ),
      ],
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Divider(height: 1, thickness: 0.1),
      ),
    ]);
  }
}
