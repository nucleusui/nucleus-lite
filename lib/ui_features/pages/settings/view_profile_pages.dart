import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';
import 'package:nucleus_ui_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui_app/ui_features/model/navbar_model.dart';

class ViewProfilePages extends StatefulWidget {
  static const String viewProfilePages = "viewProfilePages";
  const ViewProfilePages({super.key});

  @override
  State<ViewProfilePages> createState() => _ViewProfilePagesState();
}

class _ViewProfilePagesState extends State<ViewProfilePages> {
  int currentIndex = 0;
  final List<NavbarModel> navbars = [
    NavbarModel(title: "Feed"),
    NavbarModel(title: "title"),
    NavbarModel(title: "title"),
    NavbarModel(title: "title"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "My Details"),
      body: SingleChildScrollView(
        child: Column(children: [
          verticalSpace(16),
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(AssetPaths.imageAvatar1),
          ),
          verticalSpace(24),
          PrimaryButton(
            onTap: () {},
            text: "Change",
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            color: AppColors.getColor(ColorKey.primary20),
            textStyle: AssetStyles.labelMd.copyWith(
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          verticalSpace(40),
          const PrimaryDivider(),
          ...[
            (title: 'First Name', value: 'Juinal'),
            (title: 'Last Name', value: ''),
            (title: 'Location', value: 'Indonesia'),
          ].map((data) => _BuildRow(data)),
          const _GroupName("ACCOUNT INFORMATION"),
          const _BuildRow((title: "Email", value: "juinal@studioalva.co")),
          const _GroupName("INTERNATIONAL PREFERENCES"),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Language',
                    style: AssetStyles.pMd,
                  ),
                  verticalSpace(5),
                  Text(
                    'English',
                    style: AssetStyles.pMd
                        .copyWith(color: AppColors.getColor(ColorKey.grey50)),
                  ),
                ]),
                const Spacer(),
                SvgPicture.asset(AssetPaths.iconNext),
              ]),
            ),
          )
        ]),
      ),
      bottomNavigationBar: PrimaryNavBar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}

class _BuildRow extends StatelessWidget {
  const _BuildRow(this.data);

  final ({String title, String value}) data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Row(children: [
            Text(data.title, style: AssetStyles.pMd),
            const Spacer(),
            Text(
              data.value.isEmpty
                  ? 'enter ${data.title}'.toLowerCase()
                  : data.value,
              style: AssetStyles.pMd.copyWith(
                color: data.value.isNotEmpty
                    ? null
                    : AppColors.getColor(ColorKey.grey50),
              ),
            ),
          ]),
        ),
        if (data.title != 'Location' || data.title != 'Email')
          const PrimaryDivider(),
      ],
    );
  }
}

class _GroupName extends StatelessWidget {
  const _GroupName(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(color: AssetColors.skyLightest),
      padding: const EdgeInsets.only(top: 32, left: 24, bottom: 16),
      child: Text(
        title,
        style: AssetStyles.pXs.copyWith(color: AssetColors.inkLight),
      ),
    );
  }
}
