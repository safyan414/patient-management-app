

import 'package:get/get.dart';

import 'admin_panel_controller.dart';

class AdminPanelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPanelController());
  }
}