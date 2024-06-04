import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_management/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/routes/app_pages.dart';
late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patient Management',
      debugShowCheckedModeBanner: false,
      builder: (context,child){
        return MediaQuery(
          data:
          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      /// Route Management
      unknownRoute: AppPages.getUnknownRoute(),
      initialRoute: AppPages.getInitialRoute(),
      getPages: AppPages.getPages(),
      // home: PageviewAnimation(),
    );
  }
}