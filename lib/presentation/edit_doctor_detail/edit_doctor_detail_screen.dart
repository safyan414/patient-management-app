

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/presentation/edit_doctor_detail/edit_doctor_detail_controller.dart';
import 'package:patient_management/presentation/edit_doctor_detail/models/doctor_model.dart';

import '../../constants/app_assets/app_font.dart';
import '../../constants/app_assets/app_icons.dart';
import '../../constants/app_assets/app_images.dart';
import '../../global/app_theme/app_colors.dart';
import '../../global/widget/app_button.dart';
import '../../global/widget/app_text_form_field.dart';
import '../../responsive/responsive.dart';

class EditDoctorDetailScreen extends StatefulWidget {
   EditDoctorDetailScreen({super.key});

  @override
  State<EditDoctorDetailScreen> createState() => _EditDoctorDetailScreenState();
}

class _EditDoctorDetailScreenState extends State<EditDoctorDetailScreen> {
  late TextEditingController nameTextController = TextEditingController();
  late TextEditingController nickNameTextController = TextEditingController();
  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController passwordTextController = TextEditingController();
  late TextEditingController genderTextController = TextEditingController();
  final AddDoctorController addDoctorController = Get.find<AddDoctorController>();
  final arguments = Get.arguments;
   Doctor? doctorModel ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFields();
  }
  initializeFields(){
    doctorModel = arguments['doctorModel'];
    nameTextController.text = doctorModel!.name;
    passwordTextController.text = doctorModel!.password;
    emailTextController.text = doctorModel!.email;
    nickNameTextController.text = doctorModel!.nickName;
    addDoctorController.selectedGender.value = doctorModel!.gender;
    addDoctorController.pickedImage.value = RxString(doctorModel!.imageUrl);
  }

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
                      // SvgPicture.asset(AppIcons.settingIcons),
                      Text(
                        "Edit Doctor Details",
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      Container()

                    ],
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
                          "Edit Details",
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
                              addDoctorController.pickedImage.value != '' ?
                              addDoctorController.pickedImage.value.contains('https') ?    CircleAvatar(
                                  radius: 100, // Adjust the radius as needed
                                  backgroundColor: Colors.white,
                                  child:
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(addDoctorController.pickedImage.value.toString(),fit: BoxFit.cover,height: 160,width: 160,))) :
                              CircleAvatar(
                                  radius: 100, // Adjust the radius as needed
                                  backgroundColor: Colors.white,
                                  child:
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(File(addDoctorController.pickedImage.value.toString()),fit: BoxFit.cover,height: 160,width: 160,))):
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
                                        onTap: ()=> addDoctorController.pickImage(),
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
                          value: addDoctorController.selectedGender.value.isEmpty ? 'Male' : addDoctorController.selectedGender.value,
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
                            addDoctorController.selectedGender.value = newValue!;
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
                        AppButton(
                          onPressed: () {
                            if(doctorModel != null){
                              addDoctorController.editDoctor(doctorId: doctorModel!.id, name: nameTextController.text, email: emailTextController.text, password: passwordTextController.text, nickName: nickNameTextController.text, pickedImage: addDoctorController.pickedImage.value, gender: addDoctorController.selectedGender,);
                            }
                          },
                          titleText: "Edit",
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
