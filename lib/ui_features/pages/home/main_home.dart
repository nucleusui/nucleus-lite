import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/gallery/thumbnail_gallery.dart';

class HomePages1 extends StatefulWidget {
  static const String homePages = "homePages";
  const HomePages1({super.key});

  @override
  State<HomePages1> createState() => _HomePages1State();
}

class _HomePages1State extends State<HomePages1> {
  final List<Map<String, String>> hits = [
    {
      "title": "Chill Hits",
      "images": AssetPaths.imageHits1,
    },
    {
      "title": "Top Hits",
      "images": AssetPaths.imageHits2,
    },
    {
      "title": "Happy Hits",
      "images": AssetPaths.imageHits3,
    },
    {
      "title": "Good Time",
      "images": AssetPaths.imageHits4,
    }
  ];

  final List<Map<String, String>> topSongs = [
    {
      "title": "Daily Mix",
      "images": AssetPaths.imageHits2,
      "desc": "Jonas Blue, NOTD, David Guetta and more"
    },
    {
      "title": "Feelin' Myself",
      "images": AssetPaths.imageHits3,
      "desc": "Ariana Grande, Doja Cat, Megan Thee Stallion...",
    },
    {
      "title": "Deny Caknan",
      "images": AssetPaths.imageHits2,
      "desc": "BTS, Dua Lipa, Malone, Justin Bieber and more",
    },
    {
      "title": "Adellla",
      "images": AssetPaths.imageHits1,
      "desc": "BTS, Dua Lipa, Malone, Justin Bieber and more",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good Morning!",
                      style: AssetStyles.h2,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AssetPaths.fujiImage),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Wrap(
                  spacing: 16,
                  children: hits.map((data) {
                    return ThumbnailGallery(data, width: 90);
                  }).toList(),
                ),
              ),
              verticalSpace(32),
              ...[
                (title: "Just For You", data: topSongs),
                (title: "Popular Songs", data: topSongs.toList()),
              ].asMap().entries.map((e) {
                if (e.key == 0) e.value.data.shuffle();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        e.value.title,
                        style: AssetStyles.labelLg
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    verticalSpace(16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Wrap(
                        spacing: 16,
                        children: e.value.data.map((data) {
                          return ThumbnailGallery(data, width: 145);
                        }).toList(),
                      ),
                    ),
                    verticalSpace(32),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
