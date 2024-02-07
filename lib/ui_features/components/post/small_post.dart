import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/model/posts_model.dart';

class SmallPost extends StatelessWidget {
  const SmallPost(this.data, {super.key});

  final Posts data;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.imgThumb ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
      horizontalSpace(20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              data.title ?? '',
              maxLines: 2,
              style: AssetStyles.labelSm.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalSpace(10),
            Text(
              "${data.time} · by ${data.authors}",
              maxLines: 1,
              style: AssetStyles.pXs.copyWith(color: AssetColors.inkLight),
            ),
          ],
        ),
      ),
    ]);
  }
}
