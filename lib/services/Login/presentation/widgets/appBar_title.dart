import 'package:ashghal/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppbarTitle extends StatefulWidget {
  const AppbarTitle({super.key});

  @override
  State<AppbarTitle> createState() => _AppbarTitleState();
}

class _AppbarTitleState extends State<AppbarTitle> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 1),
        builder: (BuildContext contex, _value, child) {
        return Opacity(
          opacity: _value,
          child: child,
        );
        },
      child: Text(AppStrings.appName)
    );
  }
}
