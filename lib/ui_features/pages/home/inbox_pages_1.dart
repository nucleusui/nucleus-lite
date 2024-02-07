import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/chat/chat_view.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';

class InboxPages1 extends StatefulWidget {
  static const String inboxPages = "inboxPages";
  const InboxPages1({super.key});

  @override
  State<InboxPages1> createState() => _InboxPages1State();
}

class _InboxPages1State extends State<InboxPages1> {
  final List<Map<String, dynamic>> data = [
    {
      "name": "Josiah Zayner",
      "status": "Hi there!",
      "message": "How are you today?",
      "read": false,
      "avatar": "",
      "date": "9.56 AM"
    },
    {
      "name": "Jillian Jacob",
      "status": "It’s been a while",
      "message": "How are you?",
      "read": false,
      "avatar": "",
      "date": "yesterday"
    },
    {
      "name": "Victoria Hanson",
      "status": "Photos from holiday",
      "message": "Hi, I put together some photos from...",
      "read": true,
      "avatar": "",
      "date": "5 Mar"
    },
    {
      "name": "Victoria Hanson",
      "status": "Lates order delivery",
      "message": "Good morning! Hope you are good..",
      "read": true,
      "avatar": "",
      "date": "4 Mar"
    },
    {
      "name": "Peter Landt",
      "status": "Service confirmation",
      "message": "Respected Sir, I Peter, your computer...",
      "read": true,
      "avatar": "",
      "date": "4 Mar"
    },
    {
      "name": "Janice Nelson",
      "status": "Re: Blog for beta relea...",
      "message": "Hi, Please take a look at the beta...",
      "read": true,
      "avatar": "",
      "date": "3 Mar"
    },
    {
      "name": "James Norris",
      "status": "Fwd: Event Updated",
      "message": "samuel@goodman@zara.com Invite...",
      "read": true,
      "avatar": "",
      "date": "3 Mar"
    },
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(
                child: PrimaryTextField(
                  controller: search,
                  hintText: "Search Email",
                  contentPadding: const EdgeInsets.only(top: 16),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 8, 0),
                    child: SvgPicture.asset(
                      AssetPaths.iconSearch,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              horizontalSpace(20),
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(AssetPaths.imageAvatar1),
              ),
            ]),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Inbox",
                  style: AssetStyles.h1,
                ),
                PrimaryButton(
                  onTap: () {},
                  text: "Write",
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ],
            ),
            verticalSpace(20),
            ChatView(
              data: data.where((element) => element["read"] == false).toList(),
              read: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                thickness: 0.5,
                color: AppColors.getColor(ColorKey.grey20),
              ),
            ),
            verticalSpace(20),
            ChatView(
              data: data.where((element) => element["read"] == true).toList(),
              read: true,
            ),
          ]),
        ),
      ),
    );
  }
}
