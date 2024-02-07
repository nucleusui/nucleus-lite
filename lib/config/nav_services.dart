import 'dart:async';

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
// Timer? _loadTimer;

Future nextScreenByName(String screen) async {
  return await navKey.currentState?.pushNamed(screen);
}

Future nextScreen(Widget screen) async {
  return await Navigator.push(
    navKey.currentContext!,
    MaterialPageRoute(builder: (_) => screen),
  );
}

void backScreenUntil([dynamic res]) {
  Navigator.popUntil(navKey.currentContext!, (route) => route.isFirst);
}

void backScreen([dynamic res]) {
  navKey.currentState!.pop(res);
}
