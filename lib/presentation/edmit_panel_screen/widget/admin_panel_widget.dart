import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_management/constants/app_assets/app_icons.dart';

import '../../../config/routes/app_routes.dart';
import '../../../global/app_theme/app_colors.dart';
import '../../../global/widget/app_button.dart';
import '../../../global/widget/app_text_widget.dart';
import '../../../responsive/responsive.dart';
import '../model/admin_panel_model.dart';

class AdminPanelWidget extends StatelessWidget {
  AdminPanelWidget({super.key, required this.adminPanelModel});
  AdminPanelModel adminPanelModel;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
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
              Image.asset(
                adminPanelModel.imageUrl.toString(),
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
                      adminPanelModel.name.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gunMetalColor,
                      ),
                    ),
                    Text(
                      adminPanelModel.tittle.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.charcoalColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Future.delayed(Duration(seconds: 2), () {
                            //   Get.back(); // Close the dialog
                            //   Get.toNamed(homeScreen); // Navigate to the next page
                            // });

                            return AlertDialog(
                              backgroundColor: AppColors.white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                const   SizedBox(height: 46,),
                                  Center(
                                      child: Text(
                                    'Delete',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: AppColors.darkSlateGray),
                                  )),
                                  const   SizedBox(height: 30,),

                                  const Divider(),
                                  const   SizedBox(height: 30,),

                                  Text(
                                    'Are you sure you want to delete?',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: AppColors.darkSlateGray),
                                  ),
                                  const   SizedBox(height: 46,),


                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppButton(
                                            borderRadius: 30,

                                            onPressed: () {

                                            },
                                            titleText: "Cancel",
                                            buttonColor: Color(0xffE5E7EB),
                                            textColor: AppColors.white,

                                          ),
                                        ),
                                      const   SizedBox(width: 30,),
                                        Expanded(
                                          child: AppButton(
                                            borderRadius: 30,

                                            onPressed: () {

                                            },
                                            titleText: "Yes, delete",
                                            buttonColor: AppColors.primaryColor,
                                            textColor: AppColors.white,

                                          ),
                                        ),
                                      ],
                                    ),
                                  const   SizedBox(height: 46,),

                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: SvgPicture.asset(AppIcons.deleteIcon)),
                  const SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () {
                     Get.toNamed(editDoctorDetailScreen);
                    },
                      child: SvgPicture.asset(AppIcons.editIcon)),
                  const SizedBox(
                    width: 17,
                  )
                ],
              )
            ],
          )),
    );
  }
}
