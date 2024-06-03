import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../global/app_theme/app_colors.dart';
import '../models/patient_model.dart';

class PatientTile extends StatelessWidget {
  final PatientModel patient;

  const PatientTile({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    // Adjust padding and font sizes based on screen width
    final double tilePadding = width > 600 ? 8.0 : 10.0;
    final double nameFontSize = width * 0.02;
    final double timeFontSize = width * 0.02;
    final double horizontalSpacing = width * 0.03;
    final double dividerHeight = height * 0.03;

    return Container(
      height: height*0.02,
      width: width * 0.4, // Set the width of the tile based on screen width
      padding: EdgeInsets.all(tilePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.darkAppGreyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              patient.patientName,
              style: GoogleFonts.poppins(
                fontSize: 24, // Adjust font size based on screen width
                fontWeight: FontWeight.w600,

              ),
            ),
          ),
          SizedBox(width: horizontalSpacing),
          Container(
            height: dividerHeight,
            width: 1.0,
            color: AppColors.darkAppGreyColor,
          ),
          SizedBox(width: horizontalSpacing),
          Text(
            patient.time,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.grey,
              letterSpacing: .16,
              fontWeight: FontWeight.w400,

            ),
          ),
        ],
      ),
    );
  }
}
