import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../global/app_theme/app_colors.dart';
import '../../../../responsive/responsive.dart';
import '../models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        notification.icon,
        width: 40,
        height: 40,
      ),
      title: Text(
        notification.title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: Responsive.isMobile(context)?16:32,

          color: AppColors.black,
        ),
      ),
      subtitle: Text(
        notification.subtitle,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: Responsive.isMobile(context)?16:32,
          color: const Color(0xff6B7280),
        ),
      ),
      trailing: Text(
        notification.time,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: Responsive.isMobile(context)?14:28,
          color: const Color(0xff6B7280),
        ),
      ),
    );
  }
}
