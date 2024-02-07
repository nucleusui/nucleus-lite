import 'package:flutter/material.dart';
import 'package:nucleus_ui_app/config/config.dart';
import 'package:nucleus_ui_app/ui_features/components/button/primary_button.dart';

class MenuHome extends StatelessWidget {
  static const String menuPagesAll = "menuPagesAll";
  const MenuHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: const Text("Nucleus UI Mobile Apps"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const ClampingScrollPhysics(),
        children: pages.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: PrimaryButton(
              onTap: () {
                nextScreenByName(e['title']);
              },
              text: e['title'],
            ),
          );
        }).toList(),
      ),
    );
  }
}
