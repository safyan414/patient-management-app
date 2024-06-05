import 'package:get/get.dart';

import 'add_edit_doctor_controller.dart';

class EditDoctorDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEditDoctorController());
  }
}