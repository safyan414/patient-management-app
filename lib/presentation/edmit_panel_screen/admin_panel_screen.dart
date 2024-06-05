import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/config/routes/app_routes.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';
import 'package:patient_management/presentation/edmit_panel_screen/add_doctor_detail_screen.dart';
import 'package:patient_management/presentation/edmit_panel_screen/widget/admin_panel_widget.dart';
import '../../constants/app_assets/app_images.dart';
import '../../global/app_theme/app_colors.dart';
import '../../global/widget/app_text_widget.dart';
import '../../responsive/responsive.dart';
import '../edit_doctor_detail/add_edit_doctor_controller.dart';
import '../edit_doctor_detail/models/doctor_model.dart';
import 'admin_panel_controller.dart';

class AdminPanelScreen extends StatelessWidget {
  AdminPanelScreen({super.key});
  final AdminPanelController homeController = Get.put(AdminPanelController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AddEditDoctorController addEditDoctorController =
      Get.put(AddEditDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        padding: const EdgeInsets.only(top: 80, bottom: 20),
        child: Drawer(
          backgroundColor: AppColors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: Responsive.isMobile(context)
                    ? const EdgeInsets.only(left: 15, right: 15)
                    : const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context) ? 17 : 34,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          'Settings',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: Responsive.isMobile(context) ? 18 : 25,
                              color: Colors.black),
                        ),
                        SvgPicture.asset(AppIcons.crossIcons)
                      ],
                    ),
                    SizedBox(
                      height: Responsive.isMobile(context) ? 8 : 16,
                    ),
                    Obx(
                      () => Stack(
                        children: [
                          addEditDoctorController.pickedImage.value != ''
                              ? CircleAvatar(
                                  radius: Responsive.isMobile(context)
                                      ? 50
                                      : 100, // Adjust the radius as needed
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(addEditDoctorController
                                            .pickedImage.value
                                            .toString()),
                                        fit: BoxFit.cover,
                                        height: Responsive.isMobile(context)
                                            ? 80
                                            : 160,
                                        width: Responsive.isMobile(context)
                                            ? 80
                                            : 160,
                                      )))
                              : CircleAvatar(
                                  radius: Responsive.isMobile(context)
                                      ? 50
                                      : 100, // Adjust the radius as needed
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                      AppImages.icPlaceHolderImage)),
                          Positioned(
                            bottom: Responsive.isMobile(context) ? 20 : 40,
                            right: Responsive.isMobile(context) ? 13 : 25,
                            child: CircleAvatar(
                                radius: Responsive.isMobile(context)
                                    ? 8
                                    : 15, // Adjust the radius as needed
                                backgroundColor: Colors.blue,
                                child: InkWell(
                                    onTap: () =>
                                        addEditDoctorController.pickImage(),
                                    child: Image.asset(AppImages.editImage))),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(addDoctorDetailScreen);
                      },
                      child: Container(
                        padding: Responsive.isMobile(context)
                            ? const EdgeInsets.only(left: 12, right: 12)
                            : const EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppIcons.userEdit),
                                    SizedBox(
                                      width:
                                          Responsive.isMobile(context) ? 8 : 16,
                                    ),
                                    Text(
                                      "Edit Business Profile",
                                      style: GoogleFonts.poppins(
                                          fontSize: Responsive.isMobile(context)
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff6B7280)),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppIcons.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            const Divider(
                              color: Color(0xffE5E7EB),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppIcons.notificationEditOne),
                                    SizedBox(
                                      width:
                                          Responsive.isMobile(context) ? 8 : 16,
                                    ),
                                    Text(
                                      "Notifications",
                                      style: GoogleFonts.poppins(
                                          fontSize: Responsive.isMobile(context)
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff6B7280)),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppIcons.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            const Divider(
                              color: Color(0xffE5E7EB),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppIcons.helpAndSupportIcon),
                                    SizedBox(
                                      width:
                                          Responsive.isMobile(context) ? 8 : 16,
                                    ),
                                    Text(
                                      "Help and Support",
                                      style: GoogleFonts.poppins(
                                          fontSize: Responsive.isMobile(context)
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff6B7280)),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppIcons.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            const Divider(
                              color: Color(0xffE5E7EB),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppIcons.termAndConditions),
                                    SizedBox(
                                      width:
                                          Responsive.isMobile(context) ? 8 : 16,
                                    ),
                                    Text(
                                      "Term and Conditions",
                                      style: GoogleFonts.poppins(
                                          fontSize: Responsive.isMobile(context)
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff6B7280)),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppIcons.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            const Divider(
                              color: Color(0xffE5E7EB),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppIcons.logoutIcon),
                                    SizedBox(
                                      width:
                                          Responsive.isMobile(context) ? 8 : 16,
                                    ),
                                    Text(
                                      "Log Out",
                                      style: GoogleFonts.poppins(
                                          fontSize: Responsive.isMobile(context)
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff6B7280)),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(AppIcons.arrowForward),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                            const Divider(
                              color: Color(0xffE5E7EB),
                            ),
                            SizedBox(
                              height: Responsive.isMobile(context) ? 6 : 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.isMobile(context) ? 6 : 12,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primaryColor),
        child: InkWell(
          onTap: () {
            Get.toNamed(addDoctorDetailScreen);
            // Get.to(() => const ComposedScreen(), transition: Transition.upToDown);
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: Responsive.isMobile(context) ? 19 : 38,
                  horizontal: Responsive.isMobile(context) ? 19 : 35),
              child: SvgPicture.asset(AppIcons.addPersonIcon)),
        ),
      ),
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
                      InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                          child: SvgPicture.asset(AppIcons.settingIcons)),
                    ],
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context) ? 10 : 34,
                  ),
                  Text(
                    "Admin Panel",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context) ? 20 : 50,
                    ),
                    Text(
                      "Doctor",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.charcoalColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: StreamBuilder<List<Doctor>>(
                        stream: addEditDoctorController.getDoctors(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final doctorList = snapshot.data!;
                          return GridView.builder(
                            itemCount: doctorList.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: Responsive.isMobile(context)
                                        ? 1
                                        : 2,
                                    crossAxisSpacing:
                                        Responsive.isMobile(context) ? 12 : 15,
                                    mainAxisSpacing: 12.0,
                                    mainAxisExtent:
                                        Responsive.isMobile(context) ? 90 : 90),
                            itemBuilder: (context, index) => Container(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: AdminPanelWidget(
                                doctorModel: doctorList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
