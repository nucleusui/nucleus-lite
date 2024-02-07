import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/model/chat_model.dart';

class ChatPages extends StatefulWidget {
  static const String chatPages = "chatPages";

  const ChatPages({super.key});

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  TextEditingController messgae = TextEditingController();
  final List<ChatModel> chat = [
    ChatModel(
      image: AssetPaths.imageAvatar1,
      tipe: "sender",
      message: "Hi, Mandy",
      status: 1,
    ),
    ChatModel(
      image: AssetPaths.imageAvatar1,
      tipe: "sender",
      message: "i've tried the app",
      status: 1,
    ),
    ChatModel(
      image: AssetPaths.imageAvatar1,
      tipe: "receiver",
      message: "Really?",
      status: 1,
    ),
    ChatModel(
      image: AssetPaths.imageAvatar1,
      tipe: "sender",
      message: "Yeah, it's really good!",
      status: 1,
    ),
    ChatModel(
      image: AssetPaths.imageAvatar1,
      tipe: "receiver",
      message: "",
      status: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          IconRoundedButton(
            onTap: () {},
            icon: AssetPaths.iconAddFriend,
            borderColor: Colors.transparent,
            iconColor: AppColors.getColor(ColorKey.primary60),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
        child: Column(children: [
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                "09:41 AM",
                style: AssetStyles.pSm.copyWith(color: AssetColors.skyDark),
              ),
              verticalSpace(20),
              ...chat.map((data) {
                return (data.tipe == "sender")
                    ? _ChatSenderItem(data)
                    : _ChatReceiverItem(data);
              }).toList(),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 86,
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: PrimaryTextField(
          controller: messgae,
          contentPadding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          hintText: "Type your message",
        ),
      ),
    );
  }
}

class _ChatSenderItem extends StatelessWidget {
  const _ChatSenderItem(this.data);

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.getColor(ColorKey.primary20),
          ),
          child: Text(data.message, style: AssetStyles.pMd),
        ),
        horizontalSpace(10),
        CircleAvatar(
          radius: 15,
          child: Image.asset(AssetPaths.imageAvatar1),
        ),
      ]),
    );
  }
}

class _ChatReceiverItem extends StatelessWidget {
  const _ChatReceiverItem(this.data);

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        CircleAvatar(
          radius: 15,
          child: Image.asset(AssetPaths.imageAvatar2),
        ),
        horizontalSpace(10),
        if (data.status == 1)
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AssetColors.skyLighter,
            ),
            child: Text(data.message, style: AssetStyles.pMd),
          )
        else
          Text(
            "Typing...",
            style: AssetStyles.pMd.copyWith(color: AssetColors.textGrey),
          ),
      ]),
    );
  }
}
