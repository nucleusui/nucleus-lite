import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.data,
    required this.read,
  });

  final List<Map<String, dynamic>> data;
  final bool read;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        read ? "Others" : "Unread - ${data.length}",
        textAlign: TextAlign.left,
        style: AssetStyles.labelMd.copyWith(fontWeight: FontWeight.w900),
      ),
      verticalSpace(20),
      ...data.where((element) => element["read"] == read).map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AssetPaths.imageAvatar1),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e["name"],
                    style: AssetStyles.pSm,
                  ),
                  verticalSpace(4),
                  Text(
                    e["status"],
                    style: AssetStyles.labelSm
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    e["message"],
                    style: AssetStyles.pSm.copyWith(
                      color: AssetColors.inkLight,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              e["date"],
              style: AssetStyles.pSm.copyWith(
                color: AssetColors.inkLight,
              ),
            ),
          ]),
        );
      })
    ]);
  }
}
