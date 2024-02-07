import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';

class VideoCallPages extends StatelessWidget {
  const VideoCallPages({super.key});
  static const String videoCallPages = "videoCallPages";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AssetPaths.imageVidBig,
          fit: BoxFit.cover,
          width: screenWidth(context),
          height: screenHeight(context),
        ),
        const PrimaryAppBar(),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(
              top: kToolbarHeight * 1.75,
              right: screenWidth(context) * 0.05,
            ),
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage(AssetPaths.imageMVidSm),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(children: [
          const Spacer(),
          Text(
            "James Norris",
            style: AssetStyles.h2.copyWith(
              color: AssetColors.skyWhite,
            ),
          ),
          verticalSpace(10),
          Text(
            "01:20:12",
            style: AssetStyles.pMd.copyWith(
              color: AssetColors.skyWhite,
            ),
          ),
          verticalSpace(40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconRoundedButton(
                  icon: AssetPaths.iconVideo,
                  borderColor: Colors.transparent,
                  onTap: () {},
                ),
                IconRoundedButton(
                  icon: AssetPaths.iconCall,
                  height: 70,
                  width: 70,
                  color: AssetColors.redButton,
                  borderColor: Colors.transparent,
                  onTap: () {},
                ),
                IconRoundedButton(
                  icon: AssetPaths.iconVoice1,
                  borderColor: Colors.transparent,
                  onTap: () {},
                ),
              ],
            ),
          ),
          verticalSpace(40),
        ]),
      ]),
    );
  }
}
