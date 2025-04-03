import 'package:flutter/material.dart';
import 'package:to_do/src/app.dart';
import 'package:to_do/src/constant/app_color.dart';

class Loader {
  static void show() {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha(1),
      context: navigatorKey.currentContext!,
      builder:
          (context) => const Center(
            child: CircularProgressIndicator(color: Colors.green),
          ),
    );
  }

  static hide() => Navigator.pop(navigatorKey.currentContext!);
}
