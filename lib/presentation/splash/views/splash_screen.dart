import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../constants/app_assets/app_images.dart';
import '../../auth/login/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Call the function to navigate after 2 seconds
    Timer(Duration(seconds: 2), navigateToNextScreen);
  }

  void navigateToNextScreen() {
    // Navigate to the next screen using named routes
    Get.to(LoginScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              AppImages.splashBackGroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 41, right: 41),
            child: Center(
              child: Image.asset(AppImages.splashFrontImage),
            ),
          ),
          // Center(child: AppTextWidget(text: 'Logo', color: AppColors.black, fontSize: 28,fontWeight: FontWeight.w600,),),
        ],
      ),
    );
  }
}
