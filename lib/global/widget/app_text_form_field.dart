import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../constants/app_assets/app_font.dart';
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
        padding: EdgeInsets.only(top: 15.0, left: width > 600 ? 10 : 0),
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
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              hintStyle: const TextStyle(color: AppColors.coolGray),
              hintText: hintText,
              suffixIcon: SizedBox(
                  height: height * 0.02, width: width * 0.02, child: widget),
              prefixIcon: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: height * 0.05, // Adjusted height
                  width: width * 0.05,
                  child: prefixIcon),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}
