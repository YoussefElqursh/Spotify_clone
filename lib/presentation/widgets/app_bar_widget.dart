import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.dart';

AppBar appBarWidget(BuildContext context, Widget? title, Widget ? action, {bool hideBackBtn = false}) {
  return AppBar(
    centerTitle: true,
    title: title ?? const Text(''),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: hideBackBtn ? const SizedBox() : IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: context.isDarkMode ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 15,
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    ),
    actions: [
      action ?? const SizedBox()
    ],
  );
}
