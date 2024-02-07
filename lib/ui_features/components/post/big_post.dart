import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/ui_features/model/posts_model.dart';

import '../../../config/config.dart';

class BigPost extends StatelessWidget {
  const BigPost(this.data, {super.key});

  final Posts data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * 0.4,
      margin: const EdgeInsets.only(right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (ctx, constraint) {
                return Container(
                  width: constraint.maxWidth,
                  height: constraint.minHeight * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(data.imgThumb ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(12),
          Text(
            data.title ?? '',
            maxLines: 2,
            style: AssetStyles.labelMd,
          ),
          verticalSpace(8),
          Text(
            "${data.time} · by ${data.authors}",
            maxLines: 2,
            style: AssetStyles.pXs.copyWith(color: AssetColors.inkLight),
          ),
        ],
      ),
    );
  }
}
