import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/config/routes/app_routes.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';
import 'package:patient_management/presentation/edit_doctor_detail/edit_doctor_detail_controller.dart';
import 'package:patient_management/presentation/edmit_panel_screen/widget/admin_panel_widget.dart';
import '../../global/app_theme/app_colors.dart';
import '../../global/widget/app_text_widget.dart';
import '../../responsive/responsive.dart';
import '../edit_doctor_detail/models/doctor_model.dart';
import 'admin_panel_controller.dart';

class AdminPanelScreen extends StatelessWidget {
  AdminPanelScreen({super.key});
  final AdminPanelController homeController = Get.put(AdminPanelController());
  final AddDoctorController addDoctorController = Get.put(AddDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SvgPicture.asset(AppIcons.settingIcons),
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
                        stream: addDoctorController.getDoctors(),
                        builder: (context, snapshot)  {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final doctorList = snapshot.data!;
                          return doctorList.isEmpty? const Center(child: AppTextWidget(text: 'No doctor added', color: AppColors.black, fontSize: 13),):  GridView.builder(
                            itemCount: doctorList.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                Responsive.isMobile(context) ? 1 : 2,
                                crossAxisSpacing:
                                Responsive.isMobile(context) ? 12 : 15,
                                mainAxisSpacing: 12.0,
                                mainAxisExtent:
                                Responsive.isMobile(context) ? 90 : 90),
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.only(left: 24, right: 24),
                              child: AdminPanelWidget(
                                doctorModel:
                                doctorList[index],
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
