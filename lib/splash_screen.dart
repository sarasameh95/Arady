import 'dart:async';
import 'package:ashghal/core/dio_service.dart';
import 'package:ashghal/core/theme/app_colors.dart';
import 'package:ashghal/core/token_storage.dart';
import 'package:ashghal/services/Login/cubit/user_cubit.dart';
import 'package:ashghal/services/Login/presentation/screen/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();

    // Navigate after a short delay
    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) =>
              BlocProvider(
              create: (_) => LoginCubit(AuthService(), TokenStorage()),
              child: LoginForm(),
            ),
            transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [scheme.primary, Color(0xFF212121),scheme.primary,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 130,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/SCA-logo.png',
                    fit: BoxFit.fill,
                    height: 130,
                    errorBuilder: (_, __, ___) => Icon(Icons.directions_boat_sharp, size: 40),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'أراضى',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'إدارة الأشغال بهيئة قناة السويس ',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text('تم التطوير بواسطة قسم البرمجيات-إدارة الاتصالات ',style: TextStyle(fontSize: 14,color: AppColors.offWhite),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
