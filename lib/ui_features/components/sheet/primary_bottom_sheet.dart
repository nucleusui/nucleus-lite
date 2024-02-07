import 'package:flutter/material.dart';

Future<void> primarySheetDefault(
  BuildContext context, {
  String? title,
  required Widget child,
}) {
  FocusScope.of(context).unfocus();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (_) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        color: Colors.white,
        child: child,
      ),
    ),
  );
}
