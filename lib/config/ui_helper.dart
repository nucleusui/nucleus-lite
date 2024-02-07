import 'package:flutter/material.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double paddingTopApp(BuildContext context) =>
    MediaQuery.of(context).padding.top;

Widget horizontalSpace(double size) => SizedBox(width: size);
Widget verticalSpace(double size) => SizedBox(height: size);
