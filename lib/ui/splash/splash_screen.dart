import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash' ;

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash_screen.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
