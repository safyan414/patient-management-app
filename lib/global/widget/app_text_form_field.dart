import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../constants/app_assets/app_font.dart';
import '../../responsive/responsive.dart';
import '../app_theme/app_colors.dart';

typedef String? CustomValidator(String? value);

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final TextInputType inputType;
  final Widget? widget;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final CustomValidator? validator;
  final Color? filledColor;
  final Color? borderColor;
  const AppTextFormField({
    super.key,
    required this.controller,
    this.widget,
    this.obscureText,
    this.onTap,
    required this.inputType,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.filledColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    double height = mq.height;
    double width = mq.width;
    return Container(
      height: mq.height * .06,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(8),
        color: filledColor ?? AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: Responsive.isMobile(context) ? 0.0 : 10, left: Responsive.isMobile(context) ? 10 : 10),
        child: Center(
          child: TextFormField(
            keyboardType: inputType,
            obscureText: obscureText ?? false,
            controller: controller,
            onTap: onTap,
            validator: validator ??
                (value) => value!.isEmpty ? 'Please enter some text' : null,
            style: const TextStyle(
                fontFamily: AppFont.poppinsFont,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.gray500),
            decoration: InputDecoration(
              contentPadding:  EdgeInsets.only(right: Responsive.isMobile(context) ? 0 : 10),
              hintStyle: const TextStyle(color: AppColors.coolGray),
              hintText: hintText,
              suffixIcon: SizedBox(
                  height: height * 0.02, width: width * 0.02, child: widget),
              prefixIcon: prefixIcon != null ? Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top:Responsive.isMobile(context) ?9 : 0,bottom:Responsive.isMobile(context) ?5 : 0,left: 0,right: 0 ),
                height: height * 0.03, // Adjusted height
                width: width * 0.1,
                child: prefixIcon,
              ) : null,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}
