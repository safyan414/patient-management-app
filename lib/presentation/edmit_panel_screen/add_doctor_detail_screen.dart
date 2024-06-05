import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/app_util/app_util.dart';
import 'package:patient_management/constants/app_assets/app_images.dart';

import '../../constants/app_assets/app_font.dart';
import '../../constants/app_assets/app_icons.dart';
import '../../global/app_theme/app_colors.dart';
import '../../global/widget/app_button.dart';
import '../../global/widget/app_text_form_field.dart';
import '../../responsive/responsive.dart';
import '../edit_doctor_detail/edit_doctor_detail_controller.dart';

class AddDoctorDetailScreen extends StatelessWidget {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController= TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  final AddDoctorController controller = Get.put(AddDoctorController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
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
                          Obx(
                           ()=> Stack(
                              children: [
                             controller.pickedImage.value != '' ?
                             CircleAvatar(
                                 radius: 100, // Adjust the radius as needed
                                 backgroundColor: Colors.white,
                                 child:
                                 ClipRRect(
                                     borderRadius: BorderRadius.circular(100),
                                     child: Image.file(File(controller.pickedImage.value.toString()),fit: BoxFit.cover,height: 160,width: 160,))) :
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
                                      child: InkWell(
                                          onTap: ()=> controller.pickImage(),
                                          child: Image.asset(AppImages.editImage))),
                                ),
                              ],
                            ),
                          ),
                          AppTextFormField(
                            borderColor: const Color(0xffD1D5DB),
                            hintText: "Micheal jordan",
                            // prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                            inputType: TextInputType.text,
                            controller: nameTextController,
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
                            controller: nickNameTextController,
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
                            controller: emailTextController,
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
                            controller: passwordTextController,
                            onTap: () {},
                            filledColor: AppColors.whiteSmoke,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() => DropdownButtonFormField<String>(
                            value: controller.selectedGender.value.isEmpty ? 'Male' : controller.selectedGender.value,
                            items: ['Male', 'Female'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: const TextStyle(
                                    fontFamily: AppFont.poppinsFont,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.gray500),textAlign: TextAlign.center,),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              controller.selectedGender.value = newValue!;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.whiteSmoke,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xffD1D5DB)),
                              ),
                            ),
                          )),
                          const SizedBox(
                            height: 32,
                          ),
                         Obx(
                          ()=>  controller.isLoading.value == true? const Center(child: CircularProgressIndicator(),): AppButton(
                              onPressed:() async {
                                final formCurrentState = formKey.currentState;
                                if(formCurrentState!.validate()){
                                  await controller.addDoctor(name: nameTextController.text,email: emailTextController.text,password: passwordTextController.text,nickName: nickNameTextController.text,);
                                  nameTextController.text ='';
                                  emailTextController.text ='';
                                  passwordTextController.text ='';
                                  nickNameTextController.text ='';
                                }

                              },
                              titleText: "Add",
                              buttonColor: AppColors.primaryColor,
                              textColor: AppColors.white,
                            ),
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
      ),
    );
  }
}
