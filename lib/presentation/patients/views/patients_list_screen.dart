import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/app_icons.dart';
import '../../../global/app_theme/app_colors.dart';
import '../../../global/widget/app_text_widget.dart';
import '../../../responsive/responsive.dart';
import '../models/patient_model.dart';
import '../notifications/views/notifications_list_screen.dart';
import '../widgets/patient_tile_widget.dart';

class PatientGridScreen extends StatelessWidget {
  const PatientGridScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Generating a list of patients for demonstration
    List<PatientModel> patients = List.generate(
      50,
      (index) => PatientModel(
        id: 'ID${index + 1}',
        patientName: 'Patient ${index + 1}',
        time: 'Time ${index + 1}',
      ),
    );

    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    // Adjust padding and font sizes based on screen width
    final double horizontalPadding = width * 0.02;
    final double fontSize = width > 600 ? width * 0.03 : width * 0.05;
    final double buttonIconSize = width * 0.07;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppIcons.appLogo,
                  width: width * 0.5,
                  height: height * 0.05,
                ),
                IconButton(
                  icon: SvgPicture.asset(

                    AppIcons.notificationIcon,
                    width: 44,
                    height: 44,
                  ),
                  onPressed: () {
                    Get.to(
                      const NotificationsListScreen(),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //   ),
                    // );
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: const AppTextWidget(
                text: 'Patients',
                color: AppColors.darkTextColor,
                fontSize:34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(width * 0.02),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
                  crossAxisSpacing: width * 0.02,
                  mainAxisSpacing: height * 0.01,
                  childAspectRatio:
                      5.0, // Adjust aspect ratio to maintain rectangular shape
                ),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return PatientTile(
                    patient: patients[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
