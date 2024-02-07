import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';

class ReviewPurchasePages extends StatelessWidget {
  const ReviewPurchasePages({super.key});
  static const String reviewPurchasePages = "reviewPurchasePages";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Review Purchase", style: AssetStyles.h1),
                      verticalSpace(24),
                      ...[
                        (title: "Title", subTitle: "Caption", onTap: () {}),
                        (title: "Title", subTitle: "Caption", onTap: () {}),
                      ].map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title, style: AssetStyles.pMd),
                                verticalSpace(5),
                                Text(
                                  e.subTitle,
                                  style: AssetStyles.pSm.copyWith(
                                      color:
                                          AppColors.getColor(ColorKey.grey50)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            PrimaryButton(
                              text: "Edit",
                              height: 40,
                              transparent: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              textColor: AppColors.getColor(ColorKey.primary60),
                              border: BorderSide(
                                  color:
                                      AppColors.getColor(ColorKey.primary60)),
                              onTap: () {},
                            ),
                          ]),
                        );
                      }),
                    ],
                  ),
                ),
                verticalSpace(8),
                const PrimaryDivider(),
                verticalSpace(32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PrimaryButton(
                    text: "Have a gift code?",
                    height: 24,
                    transparent: true,
                    padding: EdgeInsets.zero,
                    textColor: AppColors.getColor(ColorKey.primary60),
                    onTap: () {},
                  ),
                ),
                verticalSpace(32),
                const PrimaryDivider(),
                verticalSpace(32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      (title: "Subtotal", value: "\$97.00"),
                      (title: "Shipping & Handling", value: "\$19.99"),
                      (title: "Tax", value: "\$4.00"),
                      (title: "Total", value: "\$120.00"),
                    ].map((e) {
                      final isBold = e.title == "Total";
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(children: [
                          Text(
                            e.title,
                            style: AssetStyles.pMd.copyWith(
                              fontWeight: isBold ? FontWeight.bold : null,
                              fontSize: isBold ? 18 : null,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            e.value,
                            style: AssetStyles.pMd.copyWith(
                              color: AssetColors.inkDarkest,
                              fontWeight: isBold ? FontWeight.bold : null,
                              fontSize: isBold ? 18 : null,
                            ),
                          ),
                        ]),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text.rich(TextSpan(
            style: AssetStyles.pXs,
            children: [
              const TextSpan(text: "By clicking"),
              const TextSpan(text: " “Purchase”"),
              const TextSpan(text: ", you accept the "),
              TextSpan(
                text: "terms.",
                style: AssetStyles.pXs.copyWith(
                  color: AssetColors.primaryBase,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          )),
        ),
        verticalSpace(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: PrimaryButton(
            onTap: () {},
            text: "Purchase",
          ),
        ),
        verticalSpace(24),
      ]),
    );
  }
}
