import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/config/routes/app_routes.dart';
import 'package:patient_management/local_db/hive_helper.dart';
import 'package:patient_management/presentation/auth/login/views/login_screen.dart';

import '../../../../app_util/app_util.dart';
import '../../../../app_util/firebase_auth_exception_handler.dart';

class LoginController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  RxBool isLoginLoading = false.obs;

  // Static credentials
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Admin credentials
  final String adminEmail = 'admin@example.com';
  final String adminPassword = '123';

  void login(String email, String password, BuildContext context) async {
    isLoginLoading.value = true;
    // Check if the credentials match the static admin credentials
    if (email == adminEmail && password == adminPassword) {
      HiveHelper.saveLoginStatus(isLoggedIn: true, isAdmin: true);
      LoginScreen().buildShowDialog(context,homeScreen);
      isLoginLoading.value = false;
      // You can navigate to the admin home screen or perform any other action
    } else {
      // Try to authenticate with Firebase
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if(userCredential.user != null){
          HiveHelper.saveLoginStatus(isLoggedIn: true, isAdmin: false);
          isLoginLoading.value = false;
          AppUtils.appSnackbar(
            title: 'Success',
            message: 'Logged in successfully',
            bgColor: Colors.green,
          );
          LoginScreen().buildShowDialog(context,patientsGridScreen);
        }
        else{
          isLoginLoading.value = false;
          AppUtils.appSnackbar(
            title: 'Failure',
            message: 'Something went wrong',
            bgColor: Colors.green,
          );
        }
      }
      on FirebaseAuthException catch (e) {
        isLoginLoading.value = false;

        // Handle Firebase authentication errors using the new handler class
        String errorMessage = FirebaseExceptionHandler.handleException(e);

        AppUtils.appSnackbar(
          title: 'Error',
          message: errorMessage,
          bgColor: Colors.red,
        );
      } catch (e) {
        isLoginLoading.value = false;

        // Handle other errors
        AppUtils.appSnackbar(
          title: 'Error',
          message: e.toString(),
          bgColor: Colors.red,
        );
      }
    }
  }
}