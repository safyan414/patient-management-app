
import 'package:get/get.dart';

import '../../presentation/edit_doctor_detail/edit_doctor_detail_binding.dart';
import '../../presentation/edit_doctor_detail/edit_doctor_detail_screen.dart';
import '../../presentation/edmit_panel_screen/add_doctor_detail_screen.dart';
import '../../presentation/edmit_panel_screen/admin_panel_binding.dart';
import '../../presentation/edmit_panel_screen/admin_panel_screen.dart';
import '../../presentation/home_screen/home_binding.dart';
import '../../presentation/home_screen/home_screen.dart';
import '../../presentation/splash/views/splash_screen.dart';
import '../../presentation/unknown_route/unknown_route_screen.dart';
import 'app_routes.dart';

const String splashPage = '/splashPage';

class AppPages {
  static getUnknownRoute() {
    return GetPage(
      name: noPageFound,
      page: () => const UnknownRouteScreen(),
      transition: Transition.zoom,
    );
  }

  static getInitialRoute() {
    return splashScreen;
    // return homeScreen;
  }

  static getPages() {
    return [
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        // binding: LandingBinding(),
      ),
      GetPage(
        name: homeScreen,
        page: () =>  HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: adminPanelScreen,
        page: () =>  AdminPanelScreen(),
        binding: AdminPanelBinding(),
        transition: Transition.downToUp,

      ),
      GetPage(
        name: addDoctorDetailScreen,
        page: () =>  AddDoctorDetailScreen(),
        binding: AdminPanelBinding(),
        transition: Transition.downToUp,

      ),
      GetPage(
        name: editDoctorDetailScreen,
        page: () =>  EditDoctorDetailScreen(),
        binding: EditDoctorDetailBinding(),
        transition: Transition.downToUp,

      ),

    ];
  }

// //// get map
//   static to(String route, {Map<String, dynamic>? arguments}) =>
//       Get.toNamed(route, arguments: arguments);
//
//   static offAllTo(String route, {Map<String, dynamic>? arguments}) =>
//       Get.offAllNamed(route, arguments: arguments);
//
//   static offTo(String route, {Map<String, dynamic>? arguments}) =>
//       Get.offNamed(route, arguments: arguments);
//
//   static back() => Get.back();
}
