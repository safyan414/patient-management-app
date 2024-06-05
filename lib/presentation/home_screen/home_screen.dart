import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/global/widget/app_text_widget.dart';
import 'package:patient_management/presentation/edit_doctor_detail/add_edit_doctor_controller.dart';
import 'package:patient_management/presentation/home_screen/widget/doctor_widget.dart';

import '../../config/routes/app_routes.dart';
import '../../constants/app_assets/app_images.dart';
import '../../global/app_theme/app_colors.dart';
import '../../responsive/responsive.dart';
import '../edit_doctor_detail/models/doctor_model.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  final AddEditDoctorController addDoctorController = Get.put(AddEditDoctorController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          // color: Colors.blue,
          // padding: const EdgeInsets.only(left: 24,right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      AppImages.appLogoImage,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(adminPanelScreen);
                    },
                    child: Image.asset(
                      AppImages.homeMenuIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
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
                height: 8,
              ),
              Expanded(
                child: StreamBuilder<List<Doctor>>(
                  stream: addDoctorController.getDoctors(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final doctorList = snapshot.data!; // List of doctors

                    return doctorList.isEmpty? const Center(child: AppTextWidget(text: 'No doctor added', color: AppColors.black, fontSize: 13),): GridView.builder(
                        itemCount: doctorList.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
                            crossAxisSpacing:
                            Responsive.isMobile(context) ? 12 : 15,
                            mainAxisSpacing: 12.0,
                            mainAxisExtent:
                            Responsive.isMobile(context) ? 90 : 90),
                        itemBuilder: (context, index) => DoctorWidget(
                          doctorModel: doctorList[index],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
