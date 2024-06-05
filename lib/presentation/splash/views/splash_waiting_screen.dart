import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_assets/app_images.dart';

class SplashWaitingScreen extends StatelessWidget {
  const SplashWaitingScreen({super.key});

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
        ],
      ),
    );
  }
}
