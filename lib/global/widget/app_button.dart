
import 'package:flutter/material.dart';

import '../../main.dart';
import '../app_theme/app_colors.dart';
import 'app_loader.dart';
import 'app_text_widget.dart';

class AppButton extends StatelessWidget {
  final String titleText;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color buttonColor;
  final Color? borderColor;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final double? buttonWidth;
  final bool showLoader;
  const AppButton({
    super.key,
    required this.titleText,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.borderColor, this.fontSize, this.fontWeight, this.borderRadius, this.buttonWidth, this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    mq= MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: mq.height * .055,
        width: buttonWidth ?? mq.width * 1,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          border: Border.all(
            color: borderColor ??AppColors.primaryColor,
          ),
        ),
        child: Center(
            child:showLoader
                ? SizedBox(
              height: 25,
              width: 25,
              child: AppLoader(),
            )
                : AppTextWidget(
              text: titleText,
              fontSize: fontSize ?? 18,
              fontWeight:fontWeight?? FontWeight.w500,
              color: textColor,
            )
        ),
      ),
    );
  }
}