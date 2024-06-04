import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';
import 'package:patient_management/global/app_theme/app_colors.dart';
import 'package:patient_management/presentation/edit_doctor_detail/models/doctor_model.dart';
import '../../../global/widget/app_button.dart';
import '../../../global/widget/app_text_form_field.dart';
import '../../../responsive/responsive.dart';
import '../model/doctor_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorWidget extends StatelessWidget {
  DoctorWidget({super.key, required this.doctorModel});
  Doctor doctorModel;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              title: Center(
                  child: Text(
                'Dialog Title',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.darkSlateGray),
              )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextFormField(
                    borderColor: const Color(0xffD1D5DB),
                    hintText: "First Name",
                    prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                    inputType: TextInputType.text,
                    controller: nameController,
                    onTap: () {},
                    filledColor: AppColors.whiteSmoke,
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context) ? 8 : 42,
                  ),

                  AppTextFormField(
                    borderColor: const Color(0xffD1D5DB),
                    hintText: "First Name",
                    prefixIcon: SvgPicture.asset(AppIcons.personIcon),
                    inputType: TextInputType.text,
                    controller: nameController,
                    onTap: () {},
                    filledColor: AppColors.whiteSmoke,
                  ),
                  // SizedBox(height: Responsive.isMobile(context)?8:42,),
                ],
              ),
              actions: [
                AppButton(
                  onPressed: () {},
                  titleText: "Arrived",
                  buttonColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? 50 : 100,
                ),
              ],
            );
          },
        );
        // AppUtils.patientDetailDialog();
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 150,
                width: 85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    doctorModel.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctorModel.name.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gunMetalColor,
                      ),
                    ),
                    // Divider(
                    //   color: Colors.black,
                    //   height: 2,
                    // ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        padding: const EdgeInsets.only(right: 10),
                        height: 1,
                        color: AppColors.lightGray),

                    Row(
                      children: [
                        Text(
                          doctorModel.nickName.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.charcoalColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.mapIcon),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          doctorModel.nickName.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.charcoalColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
// ListTile(
// contentPadding: EdgeInsets.zero,
//
// leading:  Expanded(
// child: Image.asset(
// doctorModel.imageUrl.toString(),
// fit: BoxFit.cover,
//
//
//
// ),
// ),
// title: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisSize: MainAxisSize.min,
// children: [
// Text(
// doctorModel.name.toString(),
// style: GoogleFonts.poppins(
// fontSize: 16,
// fontWeight: FontWeight.w700,
// color: AppColors.gunMetalColor,
// ),
// ),
// Text(
// doctorModel.tittle.toString(),
// style: GoogleFonts.poppins(
// fontSize: 14,
// fontWeight: FontWeight.w600,
// color: AppColors.charcoalColor,
// ),
// ),
// Text(
// doctorModel.address.toString(),
// style: GoogleFonts.poppins(
// fontSize: 14,
// fontWeight: FontWeight.w400,
// color: AppColors.charcoalColor,
// ),
// ),
// ],
// ),
// // subtitle: Column(
// //   crossAxisAlignment: CrossAxisAlignment.start,
// //   mainAxisSize: MainAxisSize.min,
// //   children: [
// //
// //   ],
// // ),
// ),
