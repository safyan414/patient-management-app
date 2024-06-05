import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/config/routes/app_routes.dart';
import 'package:patient_management/presentation/auth/login/controllers/login_controller.dart';

import '../../../../app_util/app_util.dart';
import '../../../../constants/app_assets/app_icons.dart';
import '../../../../global/app_theme/app_colors.dart';
import '../../../../global/widget/app_button.dart';
import '../../../../global/widget/app_text_form_field.dart';
import '../../../../global/widget/app_text_widget.dart';
import '../../../patients/views/patients_list_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final double height = mq.size.height;
    final double width = mq.size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: width > 600 ? width * 0.7 : width * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.2),
                  Image(
                    image: AssetImage(AppIcons.appLogo),
                    height: height * 0.1,
                    width: width * 0.6,
                  ),
                  SizedBox(height: height * 0.03),
                  const AppTextWidget(
                    text: 'Hi, Welcome Back!',
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: height * 0.01),
                  AppTextWidget(
                    text: 'Hope you are doing fine',
                    color: AppColors.lightGreyTextColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: Column(
                      children: [
                        AppTextFormField(
                          borderColor: AppColors.mediumAppGrey,
                          filledColor: AppColors.lightAppGreyColor(),
                          controller: emailTextController,
                          inputType: TextInputType.emailAddress,
                          hintText: 'Enter your email',
                          prefixIcon: SvgPicture.asset(AppIcons.emailIcon),
                        ),
                        SizedBox(height: height * 0.01),
                        AppTextFormField(
                          borderColor: AppColors.mediumAppGrey,
                          filledColor: AppColors.lightAppGreyColor(),
                          controller: passwordTextController,
                          inputType: TextInputType.visiblePassword,
                          hintText: 'Enter your password',
                          prefixIcon: SvgPicture.asset(
                            AppIcons.passwordIcon,

                            // Adjusted width
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Obx(
                          ()=> AppButton(
                            showLoader: loginController.isLoginLoading.value,
                            titleText: 'Sign in',
                            onPressed: () {
                              loginController.login(emailTextController.text, passwordTextController.text,context);
                              // buildShowDialog(context);
                            },
                            //     AppUtils.showLoginDialog(
                            //   nextPage: homeScreen,
                            //   title: 'Congratulations',
                            //   subtitle: 'Please wait',
                            //   svgAsset: AppIcons.doneIcon,
                            // ),
                            buttonColor: AppColors.primaryColor,
                            textColor: AppColors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: 'Note: For patients please ',
                              style: TextStyle(color: AppColors.darkTextColor)),
                          TextSpan(
                            text: 'click here ',
                            style: const TextStyle(
                                color: AppColors.darkTextColor,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(const PatientGridScreen());
                              },
                          ),
                          const TextSpan(
                            text: 'to skip the login',
                            style: TextStyle(color: AppColors.darkTextColor),
                          ),
                        ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context,var nextScreen) {
    return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 2), () {
                              Get.back(); // Close the dialog
                              Get.offAndToNamed(nextScreen); // Navigate to the next page
                            });

                            return AlertDialog(

                              backgroundColor: AppColors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  SvgPicture.asset(
                                    AppIcons.doneIcon,
                                    height: 100,
                                    width: 100,
                                    fit:BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    "Congratulations",
                                    style: GoogleFonts.poppins(
                                      fontSize: 44,
                                      color: AppColors.darkTextColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  Text(
                                    "Your account is ready to use. You will be redirected to the Home Page in a few seconds...",
                                    style: GoogleFonts.poppins(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkAppGreyColor,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,

                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  const SpinKitFadingCircle(
                                    color: AppColors.primaryColor,
                                    size: 40.0,
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                ],
                              ),

                              // actions: [
                              //   AppButton(
                              //     onPressed: () {
                              //
                              //     },
                              //     titleText: "Arrived",
                              //     buttonColor: AppColors.primaryColor,
                              //     textColor: AppColors.white,
                              //
                              //   ),
                              //   SizedBox(height: Responsive.isMobile(context)?50:100,),
                              // ],
                            );
                          },
                        );
  }
}
