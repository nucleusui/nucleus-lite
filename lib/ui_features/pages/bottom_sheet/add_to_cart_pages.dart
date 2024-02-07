import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';

class AddToCartPages extends StatefulWidget {
  static const String addToCartPages = "addToCartPages";
  const AddToCartPages({super.key});

  @override
  State<AddToCartPages> createState() => _AddToCartPagesState();
}

class _AddToCartPagesState extends State<AddToCartPages> {
  final items = [
    (title: "Size", caption: "M 10 / W 11.5"),
    (title: "Color", caption: "Gray"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Stack(children: [
          Image.asset(
            AssetPaths.imageCart,
            fit: BoxFit.cover,
            width: screenWidth(context),
            height: screenHeight(context) * 0.6,
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(
              right: 24,
              top: kToolbarHeight * 0.75,
            ),
            child: IconRoundedButton(
              icon: AssetPaths.iconClose,
              color: AssetColors.skyWhite,
              borderColor: Colors.transparent,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight(context) * 0.47,
            decoration: const BoxDecoration(
              color: AssetColors.skyWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(children: [
              verticalSpace(10),
              Center(
                child: Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.getColor(ColorKey.grey30),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nike React Infinity Run\nFlyknit 2",
                        style: AssetStyles.h2,
                      ),
                      verticalSpace(16),
                      const Text(
                        "\$250.00 + Delivery & Tax",
                        style: AssetStyles.pSm,
                      ),
                      verticalSpace(16),
                      ...items.map((e) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: e == items.last
                              ? null
                              : BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color:
                                          AppColors.getColor(ColorKey.grey30),
                                    ),
                                  ),
                                ),
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.title,
                                    style: AssetStyles.pMd
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  verticalSpace(5),
                                  Text(
                                    e.caption,
                                    style: AssetStyles.pSm.copyWith(
                                      color: AssetColors.inkLighter,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(AssetPaths.iconAdd),
                            )
                          ]),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: PrimaryButton(
                  text: "Buy",
                  height: 50,
                  color: AssetColors.inkDarkest,
                  onTap: () {},
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
