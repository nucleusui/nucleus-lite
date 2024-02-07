import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucleus_ui_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucleus_ui_app/ui_features/model/place_model.dart';

class MapPages extends StatefulWidget {
  const MapPages({super.key});
  static const String mapPages = "mapPages";
  @override
  State<MapPages> createState() => _MapPagesState();
}

class _MapPagesState extends State<MapPages> {
  int? selectedChip;
  List<({double left, double top, int value})> placeList = [];
  List<Place> places = [
    Place(
      title: "Entire House",
      subtitle: "Huntington Beach Bungalow",
      price: 250,
      time: "night",
      rating: 4.65,
      images: AssetPaths.imageHotel1,
    ),
    Place(
      title: "Entire House",
      subtitle: "Perfect Beach House in New...",
      price: 320,
      time: "night",
      rating: 4.65,
      images: AssetPaths.imageHotel2,
    ),
    Place(
      title: "Entire House",
      subtitle: "Huntington Beach Bungalow",
      price: 250,
      time: "night",
      rating: 4.65,
      images: AssetPaths.imageHotel1,
    ),
  ];

  @override
  void initState() {
    for (var i = 0; i < 9; i++) {
      placeList.add((
        value: Random().nextInt(100) + 100,
        top: 60 + (Random().nextDouble() * 256),
        left: Random().nextDouble() * 256,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AssetPaths.imageMaps,
          width: screenWidth(context),
          height: screenHeight(context) * 0.8,
          fit: BoxFit.cover,
        ),
        Stack(
          alignment: Alignment.center,
          children: placeList.asMap().entries.map((e) {
            return Positioned(
              top: e.value.top,
              left: e.value.left,
              child: PrimaryChip(
                text: '\$${e.value.value}',
                height: 32,
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                backgroundColor: selectedChip == e.key ? null : Colors.white,
                textColor: selectedChip == e.key ? Colors.white : Colors.black,
                isActive: selectedChip == e.key,
                onTap: () => setState(() => selectedChip = e.key),
              ),
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight / 2, left: 8),
          child: IconRoundedButton(
            onTap: () => Navigator.pop(context),
            borderColor: Colors.transparent,
            icon: AssetPaths.iconClose,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
            child: Wrap(
              spacing: 24,
              children: places.map((data) {
                return SizedBox(
                  height: screenHeight(context) * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          data.images,
                          height: 160,
                          width: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                      verticalSpace(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: AssetStyles.pSm,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(1),
                          Text(
                            data.subtitle,
                            overflow: TextOverflow.ellipsis,
                            style: AssetStyles.labelMd,
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      SizedBox(
                        width: 240,
                        child: Row(children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "\$${data.price}",
                                style: AssetStyles.labelMd,
                              ),
                              TextSpan(
                                text: "/${data.time}",
                                style: AssetStyles.pSm,
                              ),
                            ]),
                          ),
                          const Spacer(),
                          Row(children: [
                            SvgPicture.asset(AssetPaths.iconRating),
                            horizontalSpace(5),
                            Text(
                              "${data.rating}",
                              style: AssetStyles.labelMd.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
