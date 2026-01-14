import 'package:ashghal/core/utils/app_strings.dart';
import 'package:ashghal/services/Login/presentation/screen/login_form.dart';
import 'package:ashghal/services/home/animation.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      home: LoginForm(title: AppStrings.appName),
    );
  }
}


