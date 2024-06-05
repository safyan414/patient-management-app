import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/presentation/auth/login/views/login_screen.dart';

class LoginController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // Static credentials
  final String correctEmail = 'user@example.com';
  final String correctPassword = '123';

  void login( String email,String password,BuildContext context) {

    if (email == correctEmail && password == correctPassword) {
      LoginScreen().buildShowDialog(context);
      // AppUtils.showLoginDialog(title: 'Congratulations', subtitle: 'Your account is ready to use. You will be redirected to the Home Page in a few seconds...', svgAsset: AppIcons.doneIcon, nextPage: homeScreen);
    } else {
      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}