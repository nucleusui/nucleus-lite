import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucleus_ui_app/ui_features/model/location_model.dart';
import 'package:nucleus_ui_app/ui_features/pages/home/all_items_pages.dart';

class ChooseLocationPages extends StatefulWidget {
  static const String locationPages = "locationPages";
  const ChooseLocationPages({
    super.key,
  });

  @override
  State<ChooseLocationPages> createState() => _ChooseLocationPagesState();
}

class _ChooseLocationPagesState extends State<ChooseLocationPages> {
  final location = TextEditingController();
  final List<LocationModel> locations = [
    LocationModel(
      name: "18th Street Brewery",
      address: "Oakley Avenue, Hammond, IN",
    ),
    LocationModel(name: "18th Avenue", address: "Brooklyn, NY"),
  ];

  List<LocationModel> temp = [];

  bool? search;
  @override
  void initState() {
    super.initState();
    temp = locations;
    location.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    temp = locations
        .where((element) =>
            element.name.toLowerCase().contains(location.text.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Find nearby shop", style: AssetStyles.h1),
            verticalSpace(4),
            Text(
              "Enter your location to find them.",
              style: AssetStyles.labelMd.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            verticalSpace(30),
            PrimaryTextField(
              controller: location,
              contentPadding: const EdgeInsets.only(top: 16),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(16, 3, 8, 0),
                child: SvgPicture.asset(
                  AssetPaths.iconSearch,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.getColor(ColorKey.grey50),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              hintText: "Find Location",
            ),
            verticalSpace(15),
          ]),
        ),
        if (temp.isEmpty)
          const Expanded(child: Center(child: Text("No data found")))
        else
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                  children: temp.map((data) {
                return InkWell(
                  onTap: () {
                    nextScreen(const HomeAllItemsPages());
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SvgPicture.asset(AssetPaths.iconPlace),
                      ),
                      horizontalSpace(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name,
                            style: AssetStyles.pMd,
                          ),
                          Text(
                            data.address,
                            style: AssetStyles.pMd.copyWith(
                              color: AssetColors.inkLighter,
                            ),
                          ),
                          verticalSpace(10),
                          Container(
                            width: screenWidth(context) * 0.79,
                            height: 0.5,
                            color: AssetColors.skyLight,
                          )
                        ],
                      ),
                    ]),
                  ),
                );
              }).toList()),
            ),
          ),
      ]),
    );
  }
}
