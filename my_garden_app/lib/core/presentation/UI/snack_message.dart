import 'package:flutter/material.dart';
import 'package:my_garden_app/resources/colors.dart';

void snackMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: mainForegroundColor),
        ),
        backgroundColor: mainButtonBackgroundColor,
      ),
    );
}
