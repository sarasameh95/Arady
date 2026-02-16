import 'package:ashghal/core/utils/app_strings.dart';
import 'package:ashghal/services/home/animation.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'splash_screen.dart';


void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      home: const SplashScreen(),
      builder: (context, child) {
        return Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        );
      },
    );
  }
}


