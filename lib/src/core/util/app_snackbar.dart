import 'package:flutter/material.dart';
import 'package:to_do/src/app.dart';

class AppSnackbar {
  //show snackbar
  static show(String message) {
    ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static hide() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
  }
}
