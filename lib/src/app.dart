import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/src/config/theme/app_theme.dart';
import 'package:to_do/src/feature/view/to_do_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.primaryTheme,
      home: ToDoScreen(),
    );
  }
}
