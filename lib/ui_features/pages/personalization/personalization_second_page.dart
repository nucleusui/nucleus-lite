import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/step/step_first.dart';
import 'package:nucleus_ui_app/ui_features/pages/personalization/step/step_second.dart';

class PersonalizationSecondPages extends StatefulWidget {
  static const String personalizationSecondPage = "personalizationSecondPage";
  const PersonalizationSecondPages({super.key});

  @override
  State<PersonalizationSecondPages> createState() =>
      _PersonalizationSecondPagesState();
}

class _PersonalizationSecondPagesState extends State<PersonalizationSecondPages>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int currentStep;
  late List<Widget> stepWidget;
  late int maxStep;

  @override
  void initState() {
    super.initState();

    currentStep = 0;
    stepWidget = [
      StepFirstPerson(onTap: () {
        currentStep++;
        _tabController.animateTo(currentStep);
        setState(() {});
      }),
      const StepTwoPerson(),
    ];

    maxStep = stepWidget.length;
    _tabController = TabController(vsync: this, length: stepWidget.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        onTapBack: () {
          if (currentStep > 0) {
            currentStep--;
            _tabController.animateTo(currentStep);
            setState(() {});
          } else {
            Navigator.pop(context);
          }
        },
      ),
      body: Stack(children: [
        if (currentStep == 0)
          Positioned(
            bottom: -80,
            child: Image.asset(
              AssetPaths.gradientBackground,
              width: screenWidth(context),
              alignment: Alignment.topLeft,
              fit: BoxFit.cover,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            LayoutBuilder(
              builder: (context, constraint) {
                double step = constraint.maxWidth / maxStep;
                return Stack(children: [
                  Container(
                    width: constraint.maxWidth,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AssetColors.skyLight,
                    ),
                  ),
                  Container(
                    width: step * (currentStep + 1),
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AssetColors.primaryBase,
                    ),
                  ),
                ]);
              },
            ),
            Expanded(
              child: TabBarView(
                clipBehavior: Clip.none,
                controller: _tabController,
                children: stepWidget,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
