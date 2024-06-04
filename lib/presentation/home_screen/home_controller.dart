import 'package:get/get.dart';

import '../../constants/app_assets/app_images.dart';
import 'model/doctor_model.dart';

class HomeController extends GetxController {
  final doctorList = [
    DoctorModel(
        imageUrl: AppImages.doctorImageOne,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageTwo,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageThree,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageThree,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageThree,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageThree,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
    DoctorModel(
        imageUrl: AppImages.doctorImageThree,
        name: "Dr. David Patel",
        tittle: "Cardiologist",
        address: "Cardiology Center, USA"),
  ].obs;
}
