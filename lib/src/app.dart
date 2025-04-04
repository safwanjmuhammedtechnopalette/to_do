import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/src/config/theme/app_theme.dart';
import 'package:to_do/src/feature/view/to_do_screen.dart';
import 'package:to_do/src/feature/x/explicit_animation_demo.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.primaryTheme,
        home: ExplicitAnimationDemo(),
      ),
    );
  }
}
