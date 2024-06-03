import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';

import '../global/app_theme/app_colors.dart';
import '../global/widget/app_text_form_field.dart';

class AppUtils {
  static void showLoginDialog({
    required String title,
    required String subtitle,
    required String svgAsset,
    required String nextPage,
    int duration = 2, // Duration in seconds
  }) {
    Get.dialog(
      CupertinoAlertDialog(
        content: Container(
          // padding: const EdgeInsets.only(left: 143,right: 143),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    Future.delayed(Duration(seconds: duration), () {
      Get.back(); // Close the dialog
      Get.toNamed(nextPage); // Navigate to the next page
    });
  }
  // static void patientDetailDialog({
  //   // required String title,
  //   // required String subtitle,
  //   // required String svgAsset,
  //   // required Widget nextPage,
  //   int duration = 2, // Duration in seconds
  // }) {
  //
  //   Get.dialog(
  //     CupertinoAlertDialog(
  //       content: Column(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Text(
  //             "Patient Details",
  //             style: GoogleFonts.poppins(
  //                 fontWeight: FontWeight.w700, color: AppColors.darkGunmetal),
  //           ),
  //           AppTextFormField(
  //             hintText: "First Name",
  //             prefixIcon: SvgPicture.asset(AppIcons.personIcon),
  //             inputType: TextInputType.text,
  //             controller: namecontroller,
  //             onTap: () {},
  //             filledColor: AppColors.whiteSmoke,
  //           ),
  //         ],
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  //
  //   // Future.delayed(Duration(seconds: duration), () {
  //   //   Get.back(); // Close the dialog
  //   //   Get.to(() => nextPage); // Navigate to the next page
  //   // });
  // }
}
