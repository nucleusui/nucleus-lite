import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';
import 'package:nucleus_ui_app/ui_features/components/divier/primary_divider.dart';
import 'package:nucleus_ui_app/ui_features/model/products_model.dart';
import 'package:nucleus_ui_app/ui_features/model/sort_model.dart';

class ProductDetailPages extends StatefulWidget {
  const ProductDetailPages({super.key});
  static const String productDetailPages = "productDetailPages";

  @override
  State<ProductDetailPages> createState() => _ProductDetailPagesState();
}

class _ProductDetailPagesState extends State<ProductDetailPages> {
  int current = 0;
  Color? selectedColor;
  final CarouselController controller = CarouselController();
  List<Widget> imageSliders = [];
  List<SortModel> sizes = [];
  final Product product = Product(
    namaProduk: "Nike Air Zoom Structure 23",
    hargaProduk: "190,00",
    pilihanGambar: [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
    ],
    pilihanWarna: const [
      Color(0XFFFF7A00),
      Color(0XFF1DA1F2),
      Color(0XFFFF5247),
    ],
    pilihanUkuran: [
      "M 4 / W 5.5",
      "M 4.5 / W 6",
      "M 5 / W 6.5",
    ],
    deskripsiProduk:
        "A favourite returns. Made for the runner looking for a shoe they can wear daily the Nike Air Zoom Quest Structure 23 keeps\n\n",
  );

  @override
  void initState() {
    imageSliders = product.pilihanGambar
        .map((item) => Image.network(item, fit: BoxFit.cover))
        .toList();

    sizes = List.generate(
      product.pilihanUkuran.length,
      (index) => SortModel(
        name: product.pilihanUkuran[index],
        status: index == 1 ? true : false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: PrimaryButton(
          onTap: () {},
          color: AssetColors.inkDarkest,
          text: "Add To Cart",
        ),
      ),
      body: Column(children: [
        SizedBox(
          width: screenWidth(context),
          height: screenHeight(context) * 0.4,
          child: Stack(children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.4,
              child: CarouselSlider(
                options: CarouselOptions(
                  disableCenter: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        current = index;
                      },
                    );
                  },
                ),
                carouselController: controller,
                items: imageSliders,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 16),
              child: Wrap(
                spacing: 8,
                children: product.pilihanGambar.asMap().entries.map((entry) {
                  return InkWell(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                        color: current == entry.key
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SafeArea(
              child: IconRoundedButton(
                icon: AssetPaths.iconBack,
                borderColor: Colors.transparent,
                iconColor: AppColors.getColor(ColorKey.primary60),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 48),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.namaProduk,
                      style: AssetStyles.h1,
                    ),
                    verticalSpace(10),
                    Text(
                      "\$ ${product.hargaProduk}",
                      style: AssetStyles.pMd.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(24),
              const PrimaryDivider(),
              verticalSpace(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "Color",
                          style: AssetStyles.labelMd,
                        ),
                        TextSpan(
                          text: " Gray",
                          style: AssetStyles.pMd,
                        ),
                      ]),
                    ),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(spacing: 8, children: [
                      ...product.pilihanWarna.map((e) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => setState(() => selectedColor = e),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e,
                              border: selectedColor != e
                                  ? null
                                  : Border.all(width: 2),
                            ),
                          ),
                        );
                      }),
                    ]),
                  ),
                  verticalSpace(20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Size",
                      style: AssetStyles.labelMd,
                    ),
                  ),
                  verticalSpace(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Wrap(
                      spacing: 16,
                      children: sizes.map((e) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => setState(() => e.status = !e.status),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(15),
                              color: e.status
                                  ? AppColors.getColor(ColorKey.primary60)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              e.name,
                              style: AssetStyles.pMd.copyWith(
                                color: e.status
                                    ? AssetColors.skyWhite
                                    : AssetColors.inkDarkest,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  verticalSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      product.deskripsiProduk,
                      style: AssetStyles.pMd,
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
