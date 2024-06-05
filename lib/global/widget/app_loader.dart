import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';


class AppLoader extends StatelessWidget {
  final Color? color;
  const AppLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 4,

      valueColor: AlwaysStoppedAnimation<Color>(color??AppColors.whiteSmoke),
    );
  }
}
