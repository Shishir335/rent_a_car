import 'package:flutter/material.dart';
import 'package:rent_a_car/routes.dart';
import 'package:rent_a_car/utils/assets.dart';
import 'package:rent_a_car/utils/navigator.dart';
import 'package:rent_a_car/utils/prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    sessionRouting();
    super.initState();
  }

  sessionRouting() async {
    await Future.delayed(const Duration(seconds: 2));

    String? token = await Prefs.getString('token');

    if (token == null) {
      Nav.pushAndRemoveAll(context, Routes.loginScreen);
    } else {
      Nav.pushAndRemoveAll(context, Routes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.logo, height: 120, width: 120)),
    );
  }
}
