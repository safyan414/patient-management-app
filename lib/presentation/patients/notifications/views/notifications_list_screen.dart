import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/app_assets/app_icons.dart';
import '../../../../global/app_theme/app_colors.dart';
import '../../../../global/widget/app_text_widget.dart';
import '../../../../main.dart';
import '../../../../responsive/responsive.dart';
import '../models/notification_model.dart';
import '../widgets/notification_tile.dart';

class NotificationsListScreen extends StatelessWidget {
  const NotificationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the screen size
    mq = MediaQuery.of(context).size;

    // Based on the screen size, adjust padding and text sizes
    final double horizontalPadding = mq.width > 600 ? 20.0 : 10.0;
    final double titleFontSize = mq.width > 600 ? 20.0 : 16.0;
    final double buttonFontSize = mq.width > 600 ? 18.0 : 14.0;

    List<NotificationModel> todayNotifications = List.generate(
      5,
      (index) => NotificationModel(
        title: 'Today Notification ${index + 1}',
        subtitle: 'This is the subtitle for today notification ${index + 1}',
        icon: AppIcons.notificationIcon, // Replace with your actual asset path
        time: '12:0$index PM',
      ),
    );

    List<NotificationModel> yesterdayNotifications = List.generate(
      5,
      (index) => NotificationModel(
        title: 'Yesterday Notification ${index + 1}',
        subtitle:
            'This is the subtitle for yesterday notification ${index + 1}',
        icon: AppIcons.notificationIcon, // Replace with your actual asset path
        time: '11:0$index AM',
      ),
    );

    List<NotificationModel> previousNotifications = List.generate(
      5,
      (index) => NotificationModel(
        title: 'Previous Notification ${index + 1}',
        subtitle: 'This is the subtitle for previous notification ${index + 1}',
        icon: AppIcons.notificationIcon, // Replace with your actual asset path
        time: '10:0$index AM',
      ),
    );

    // Other code remains the same

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: Responsive.isMobile(context)
                    ? const EdgeInsets.only(left: 24, right: 24)
                    : const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppIcons.arrowBack,
                          color: const Color(0xff374151),
                          height: 34,
                          width: 34,
                        )),
                    Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                          fontSize: Responsive.isMobile(context) ? 16 : 34,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff374151)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      padding: Responsive.isMobile(context)
                          ? const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8)
                          : const EdgeInsets.only(
                              left: 32, right: 32, top: 16, bottom: 16),
                      child: Text(
                        "1 New",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              NotificationSection(
                title: 'Today',
                notifications: todayNotifications,
                titleFontSize: titleFontSize,
                buttonFontSize: buttonFontSize,
              ),
              const SizedBox(height: 20),
              NotificationSection(
                title: 'Yesterday',
                notifications: yesterdayNotifications,
                titleFontSize: titleFontSize,
                buttonFontSize: buttonFontSize,
              ),
              const SizedBox(height: 20),
              NotificationSection(
                title: 'Previous',
                notifications: previousNotifications,
                titleFontSize: titleFontSize,
                buttonFontSize: buttonFontSize,
              ),
              const SizedBox(height: 20),
              // Other sections remain the same
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationModel> notifications;
  final double titleFontSize;
  final double buttonFontSize;

  const NotificationSection({
    super.key,
    required this.title,
    required this.notifications,
    required this.titleFontSize,
    required this.buttonFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle mark all as read action
              },
              child: AppTextWidget(
                text: 'Mark all as read',
                color: AppColors.darkTextColor,
                fontSize: buttonFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationTile(notification: notifications[index]);
          },
        ),
      ],
    );
  }
}

//
// class NotificationsListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<NotificationModel> todayNotifications = List.generate(
//       5,
//           (index) => NotificationModel(
//         title: 'Today Notification ${index + 1}',
//         subtitle: 'This is the subtitle for today notification ${index + 1}',
//         icon: AppIcons.notificationIcon, // Replace with your actual asset path
//         time: '12:0${index} PM',
//       ),
//     );
//
//     List<NotificationModel> yesterdayNotifications = List.generate(
//       5,
//           (index) => NotificationModel(
//         title: 'Yesterday Notification ${index + 1}',
//         subtitle: 'This is the subtitle for yesterday notification ${index + 1}',
//         icon: AppIcons.notificationIcon, // Replace with your actual asset path
//         time: '11:0${index} AM',
//       ),
//     );
//
//     List<NotificationModel> previousNotifications = List.generate(
//       5,
//           (index) => NotificationModel(
//         title: 'Previous Notification ${index + 1}',
//         subtitle: 'This is the subtitle for previous notification ${index + 1}',
//         icon: AppIcons.notificationIcon, // Replace with your actual asset path
//         time: '10:0${index} AM',
//       ),
//     );
//
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor(context),
//       appBar: AppBar(
//         backgroundColor: AppColors.backgroundColor(context),
//         title: Text('Notifications'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               NotificationSection(
//                 title: 'Today',
//                 notifications: todayNotifications,
//               ),
//               SizedBox(height: 20),
//               NotificationSection(
//                 title: 'Yesterday',
//                 notifications: yesterdayNotifications,
//               ),
//               SizedBox(height: 20),
//               NotificationSection(
//                 title: 'Previous',
//                 notifications: previousNotifications,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NotificationSection extends StatelessWidget {
//   final String title;
//   final List<NotificationModel> notifications;
//
//   const NotificationSection({
//     Key? key,
//     required this.title,
//     required this.notifications,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Handle mark all as read action
//               },
//               child: const AppTextWidget(text: 'Mark all as read',color: AppColors.darkTextColor,fontSize: 14,fontWeight: FontWeight.w700,),
//             ),
//           ],
//         ),
//         ListView.builder(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: notifications.length,
//           itemBuilder: (context, index) {
//             return NotificationTile(notification: notifications[index]);
//           },
//         ),
//       ],
//     );
//   }
// }
