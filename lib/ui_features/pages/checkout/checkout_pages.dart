import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';

class CheckoutPages extends StatelessWidget {
  const CheckoutPages({super.key});

  static const String checkoutPages = "checkoutPages";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AssetPaths.imageCheckout,
          fit: BoxFit.cover,
          width: double.infinity,
          height: screenHeight(context) * 0.35,
        ),
        PrimaryAppBar(
          title: "Checkout",
          iconColor: Colors.white,
          titleStyle: AssetStyles.pLg.copyWith(color: Colors.white),
        ),
        Column(children: [
          verticalSpace(screenHeight(context) * 0.305),
          Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              horizontalSpace(24),
              Image.asset(
                AssetPaths.imageCheckout,
                fit: BoxFit.cover,
                width: screenWidth(context) * 0.3,
                height: screenHeight(context) * 0.2,
              ),
              horizontalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Obvilion",
                    style: AssetStyles.h2,
                  ),
                  verticalSpace(15),
                  Text(
                    "Wed, 20 Jan - 10:00 AM",
                    style:
                        AssetStyles.pSm.copyWith(fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(5),
                  Text("CMX Cinemas, New York",
                      style: AssetStyles.pSm
                          .copyWith(color: AssetColors.inkLight)),
                  verticalSpace(20),
                ],
              ),
              horizontalSpace(24),
            ]),
            verticalSpace(32),
            const PrimaryDivider(),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  (title: "Movie ticket", value: "\$22.00"),
                  (title: "Qty", value: "2"),
                  (title: "Convenience fees", value: "\$1.00"),
                  (title: "Subtotal", value: "\$43.00"),
                  (title: "Total amount", value: "\$43.00"),
                ].map((e) {
                  final isBold = e.title == "Total amount";
                  return Column(
                    children: [
                      if (isBold)
                        const Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 24),
                          child: PrimaryDivider(),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(children: [
                          Text(
                            e.title,
                            style: AssetStyles.pMd.copyWith(
                              color: AppColors.getColor(ColorKey.grey60),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            e.value,
                            style: AssetStyles.pMd.copyWith(
                              color: AppColors.getColor(ColorKey.grey100),
                              fontWeight:
                                  isBold ? FontWeight.bold : FontWeight.w500,
                              fontSize: isBold ? 18 : null,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ]),
        ]),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: PrimaryButton(
            text: "Pay . \$ 43.00",
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
