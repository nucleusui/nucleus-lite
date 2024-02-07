import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';

class AccountSettingPages extends StatelessWidget {
  const AccountSettingPages({super.key});
  static const String accountSettingPages = "accountSettingPages";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Settings"),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            decoration: BoxDecoration(
              color: AssetColors.primaryBase,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Premium Membership",
                  style: AssetStyles.labelLg.copyWith(color: Colors.white),
                ),
                verticalSpace(3),
                Text(
                  "Upgrade for more features",
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey10),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(8),
          ...[
            (
              group: 'Account',
              menu: [
                (
                  title: "Profile",
                  icon: AssetPaths.iconAvatar,
                  onTap: () {},
                ),
                (
                  title: "Password",
                  icon: AssetPaths.iconLock,
                  onTap: () {},
                ),
                (
                  title: "Notifications",
                  icon: AssetPaths.iconNotif,
                  onTap: () {},
                ),
              ],
            ),
            (
              group: 'More',
              menu: [
                (
                  title: "Rate & Review",
                  icon: AssetPaths.iconRate,
                  onTap: () {},
                ),
                (
                  title: "Help",
                  icon: AssetPaths.iconHelp,
                  onTap: () {},
                ),
              ],
            )
          ].map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    e.group,
                    style: AssetStyles.labelLg
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                verticalSpace(10),
                ...e.menu.map((f) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
                      child: Row(children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(f.icon),
                        ),
                        horizontalSpace(20),
                        Text(f.title, style: AssetStyles.pMd),
                        const Spacer(),
                        SvgPicture.asset(AssetPaths.iconNext),
                      ]),
                    ),
                  );
                }),
              ],
            );
          }),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 56,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 32),
        child: PrimaryButton(
          text: "Log out",
          height: 24,
          transparent: true,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          textStyle: AssetStyles.pMd.copyWith(
            color: AppColors.getColor(ColorKey.grey50),
            fontWeight: FontWeight.w300,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
