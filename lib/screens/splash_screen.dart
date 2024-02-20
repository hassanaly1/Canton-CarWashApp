import 'package:canton/classes/app_assets.dart';
import 'package:canton/screens/credentials/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> startUp() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const SignupScreen(), transition: Transition.rightToLeft);
    });
  }

  @override
  void initState() {
    super.initState();
    startUp();
    // Simulate the delay or loading process before navigating to the main content
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      body: Column(
        children: [
          Center(
            child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: const Image(
                  image: AssetImage('assets/images/car_wash_logo.png'),
                )
                // child: Image.asset(
                //   'assets/images/car_wash_logo.png',
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
