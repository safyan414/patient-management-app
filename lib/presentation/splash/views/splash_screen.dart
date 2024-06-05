import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:patient_management/config/routes/app_routes.dart';
import 'package:patient_management/local_db/hive_helper.dart';

import '../../../constants/app_assets/app_images.dart';
import '../../auth/login/views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: HiveHelper.getLoginStatus(), // Retrieve login status
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Stack(
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
            ],
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            bool isLoggedIn = snapshot.data?['isLoggedIn'] ?? false;
            bool isAdmin = snapshot.data?['isAdmin'] ?? false;

            if (isLoggedIn) {
              // Redirect to appropriate screen based on login status
              if (isAdmin) {
                Get.offAllNamed(adminPanelScreen); // Navigate to AdminHomeScreen and remove all previous screens
              } else {
                Get.offAllNamed(patientsGridScreen); // Navigate to DoctorHomeScreen and remove all previous screens
              }
            } else {
              Get.offAll(LoginScreen()); // Navigate to LoginScreen and remove all previous screens
            }
          });

          return Stack(
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
            ],
          );
        }
      },
    );
  }
}
