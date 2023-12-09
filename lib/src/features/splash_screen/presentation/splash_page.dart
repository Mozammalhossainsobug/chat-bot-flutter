import 'package:chat_bot_flutter/src/core/services/routes/routes.dart';
import 'package:chat_bot_flutter/src/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _navigateToBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Image.asset(
            Assets.onSplashScreenLogo,
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToBoarding() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushNamed(context, Routes.onBoarding);
  }
}
