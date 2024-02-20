import 'package:canton/classes/app_assets.dart';
import 'package:canton/dependencies/depedencies.dart';
import 'package:canton/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppAssets.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
