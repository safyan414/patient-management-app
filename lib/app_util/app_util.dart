import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Future<PlatformFile?> pickFile() async {
    PermissionStatus? status;
    // status = await Permission.manageExternalStorage.request();
    //
    // if (status.isGranted) {

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.path != null) {
        PlatformFile fileInfo = result.files.first;
        File file = File(result.files.single.path!);
        // final fileName = fileInfo.name;
        // final fileExtension = fileInfo.extension;
        // final filePath = fileInfo.path;
        // final fileSize = fileInfo.size;
        // final date = DateTime.now();
        return fileInfo;

      } else {
        // User canceled the picker
        return null;
      }
    // } else {
    //   // Handle permission denied
    //   print("Permission denied");
    //   return null;
    // }
  }

 static SnackbarController appSnackbar({required String title,required String message ,required Color bgColor}) => Get.snackbar(title,message, backgroundColor: bgColor,colorText: AppColors.white,);
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
