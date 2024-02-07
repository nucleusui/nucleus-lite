import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/model/posts_model.dart';

class ContentDetailPostPages extends StatefulWidget {
  const ContentDetailPostPages({super.key});
  static const String contentPostDetail = "contentPostDetail";

  @override
  State<ContentDetailPostPages> createState() => _ContentDetailPostPagesState();
}

class _ContentDetailPostPagesState extends State<ContentDetailPostPages> {
  final Posts post = Posts(
    title: "Is It Safe to Fly\nDuring Pandemic?",
    head: "NY TIMES",
    authors: "Tariro Mzezewa",
    time: "Nov. 25, 2020",
    imgThumb: AssetPaths.imagePost,
    content:
        "A day after the Centers for Disease Control and Prevention urged Americans to stay home for Thanksgiving, more than one million people in the United States got on planes, marking the second day that more than a million people have flown since March. Nearly three million additional people have flown in the days since.\n\nThe high number of travelers speaks to a sense of pandemic fatigue that many people are experiencing. For some, the desire to see family is worth the risk of potentially getting the coronavirus while traveling.\r\n\r\nBut filtration is not enough.\r\n\r\nVentilation is just one piece of the puzzle, said Saskia Popescu, an infection prevention epidemiologist in Arizona. (Dr. Popescu is married to Mr. Popescu.) Distancing and masking are also important to mitigate risk, and are the other key components for keeping the coronavirus from spreading, whether on planes or elsewhere.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(heightAppBar: kToolbarHeight),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          verticalSpace(16),
          Text(
            post.head ?? '',
            style: AssetStyles.labelSm.copyWith(
              color: AssetColors.inkLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(24),
          Text(
            post.title ?? '',
            style: AssetStyles.h1,
          ),
          verticalSpace(24),
          RichText(
            text: TextSpan(children: [
              const TextSpan(text: "by ", style: AssetStyles.pSm),
              TextSpan(
                text: post.authors,
                style: AssetStyles.pSm.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: " - ${post.time}", style: AssetStyles.pSm),
            ]),
          ),
          verticalSpace(24),
          Image(
            width: double.infinity,
            image: AssetImage(post.imgThumb ?? ''),
            fit: BoxFit.fitWidth,
          ),
          verticalSpace(24),
          Text(
            post.content ?? '',
            style: AssetStyles.pMd.copyWith(
              height: 1.5,
            ),
          ),
          verticalSpace(20),
        ]),
      ),
    );
  }
}
