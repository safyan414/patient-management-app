import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/constants/app_assets/app_images.dart';

import '../../constants/app_assets/app_icons.dart';
import '../../global/app_theme/app_colors.dart';
import '../../global/widget/app_button.dart';
import '../../global/widget/app_text_form_field.dart';
import '../../responsive/responsive.dart';

class AddDoctorDetailScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      // floatingActionButton: Container(
      //   decoration: const BoxDecoration(
      //       shape: BoxShape.circle, color: AppColors.primaryColor),
      //   child: InkWell(
      //     onTap: () {
      //       // Get.toNamed(addDoctorDetailScreen);
      //
      //       // Get.to(() => const ComposedScreen(), transition: Transition.upToDown);
      //     },
      //     child: Container(
      //         padding: EdgeInsets.symmetric(
      //             vertical: Responsive.isMobile(context) ? 19 : 38,
      //             horizontal: Responsive.isMobile(context) ? 19 : 35),
      //         child: SvgPicture.asset(AppIcons.addPersonIcon)),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: Responsive.isMobile(context)
                  ? const EdgeInsets.only(left: 24, right: 24)
                  : const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.isMobile(context) ? 10 : 70,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(AppIcons.arrowBack)),
                      Text(
                        "Add Doctor Details",
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      Container()                    ],
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context) ? 10 : 34,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Responsive.isMobile(context) ? 90 : 170,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Responsive.isMobile(context)
                          ? const Radius.circular(20)
                          : const Radius.circular(40),
                      topLeft: Responsive.isMobile(context)
                          ? const Radius.circular(20)
                          : const Radius.circular(40),
                    )),
                child: SingleChildScrollView(
                  child: Container(
                    padding: Responsive.isMobile(context)
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(left: 144, right: 112),
                    child: Column(
                      children: [
                      const   SizedBox(height: 34,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 6,
                              color: const Color(0xffDFE2EB),
                            )
                          ],
                        ),
                        Text(
                          "Add Doctor",
                          style: GoogleFonts.poppins(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGunmetal,
                          ),
                        ),
                        Text(
                          "Add doctor detail here",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: AppColors.slateGray,
                          ),
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                                radius: 100, // Adjust the radius as needed
                                backgroundColor: Colors.white,
                                child:
                                    Image.asset(AppImages.icPlaceHolderImage)),
                            Positioned(
                              bottom: 40,
                              right: 25,
                              child: CircleAvatar(
                                  radius: 15, // Adjust the radius as needed
                                  backgroundColor: Colors.blue,
                                  child: Image.asset(AppImages.editImage)),
                            ),
                          ],
                        ),
                        AppTextFormField(
                          borderColor: const Color(0xffD1D5DB),
                          hintText: "Micheal jordan",
                          // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                          inputType: TextInputType.text,
                          controller: nameController,
                          onTap: () {},
                          filledColor: AppColors.whiteSmoke,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          borderColor: const Color(0xffD1D5DB),
                          hintText: "Nick name",
                          // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                          inputType: TextInputType.text,
                          controller: nameController,
                          onTap: () {},
                          filledColor: AppColors.whiteSmoke,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          borderColor: const Color(0xffD1D5DB),
                          hintText: "name@Example.com",
                          // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                          inputType: TextInputType.text,
                          controller: nameController,
                          onTap: () {},
                          filledColor: AppColors.whiteSmoke,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          borderColor: const Color(0xffD1D5DB),
                          hintText: "password",
                          // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                          inputType: TextInputType.text,
                          controller: nameController,
                          onTap: () {},
                          filledColor: AppColors.whiteSmoke,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          borderColor: const Color(0xffD1D5DB),
                          hintText: "Gender",
                          // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                          inputType: TextInputType.text,
                          controller: nameController,

                          onTap: () {},
                          filledColor: AppColors.whiteSmoke,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        AppButton(
                          onPressed: () {},
                          titleText: "Add",
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                        ),
                        Responsive.isMobile(context)
                            ? const SizedBox(
                                height: 34,
                              )
                            : const SizedBox(
                                height: 120,
                              )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
