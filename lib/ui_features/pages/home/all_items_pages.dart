import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/components/gallery/image_gallery.dart';
import 'package:nucleus_ui_app/ui_features/model/items_model.dart';

class HomeAllItemsPages extends StatelessWidget {
  const HomeAllItemsPages({super.key});
  static const String homeAllItemsPages = "homeAllItemsPages";

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final List<ItemModel> data = List.generate(
      30,
      (index) => ItemModel(
        images: "https://picsum.photos/id/${Random().nextInt(100)}/200/300",
        name: faker.company.name(),
      ),
    );

    return Scaffold(
      appBar: PrimaryAppBar(
        heightAppBar: kToolbarHeight,
        title: "All Items",
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetPaths.iconSettings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: data.map((e) => ImageGallery(e)).toList(),
        ),
      ),
    );
  }
}
