import 'package:get/get.dart';

import 'edit_doctor_detail_controller.dart';

class EditDoctorDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDoctorController());
  }
}