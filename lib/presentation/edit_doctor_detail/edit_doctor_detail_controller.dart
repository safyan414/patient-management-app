import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient_management/app_util/app_util.dart';
import '../../global/app_theme/app_colors.dart';
import 'models/doctor_model.dart';

class AddDoctorController extends GetxController {
  // RxString pickedImage = ''.obs;
  final pickedImage = RxString('').obs;
  RxBool isLoading = false.obs;

  var selectedGender = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDoctor({
    required String name,
    required String email,
    required String password,
    required String nickName,
  }) async {
    isLoading = true.obs;
    final doctorId = _firestore.collection('doctors').doc().id;
    final fileName = '$doctorId.jpg';
    debugPrint('doc image file name:$fileName');

    final storageRef =
        FirebaseStorage.instance.ref().child('doctor_images/$fileName');
    final uploadTask = storageRef.putFile(File(pickedImage.value.toString()));
    debugPrint('doc image file uploadTask :$uploadTask');
    try {
      await uploadTask;
    } on FirebaseException catch (e) {
      isLoading = false.obs;
      AppUtils.appSnackbar(title: 'Error Uploading Image',message:  e.message!,
          bgColor: AppColors.darkAppGreyColor);
      return;
    }
    catch(e){
      isLoading = false.obs;
      AppUtils.appSnackbar(title: 'Error Uploading Image',message:  e.toString()!,
          bgColor: AppColors.darkAppGreyColor);
      return;
    }
    final downloadUrl = await storageRef.getDownloadURL();
    debugPrint('doc id:$doctorId');
    var doctor = Doctor(
      id: doctorId,
      name: name,
      nickName: nickName,
      email: email,
      password: password,
      gender: selectedGender.value,
      imageUrl: downloadUrl,
    );
    try {
      await _firestore
          .collection('doctors')
          .doc(doctorId)
          .set(doctor.toJson())
          .then((val) {
        AppUtils.appSnackbar(title: 'Success',message:  'Doctor created successfully',
            bgColor: AppColors.gunMetalColor);
        isLoading = false.obs;
        pickedImage.value = RxString('');
        selectedGender.value ='Male';
      });
    } catch (e) {
      isLoading = false.obs;
      AppUtils.appSnackbar(title: 'Failure',message:  e.toString(),
          bgColor: AppColors.darkAppGreyColor);
    }
  }

  Stream<List<Doctor>> getDoctors() {
    return _firestore
        .collection('doctors')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Doctor> doctors = [];
      query.docs.forEach((doc) {
        doctors.add(Doctor.fromJson(doc.data() as Map<String, dynamic>));
      });
      return doctors;
    });
  }

  Future<void> editDoctor({
    required String doctorId,
    required String name,
    required String email,
    required String password, // Include password for potential updates
    required String nickName,
    required RxString pickedImage, // Optional RxString for image update
    required RxString gender, // Optional RxString for image update
  }) async {
    isLoading = true.obs;
    final doctorRef = _firestore.collection('doctors').doc(doctorId);
    if (!pickedImage.value.contains('https')) {
      final existingImageRef =
          FirebaseStorage.instance.ref().child('doctor_images/$doctorId.jpg');

      try {
        await existingImageRef.delete();
      } on FirebaseException catch (e) {
        debugPrint('Error deleting existing image: ${e.message}');
        return;
      }

      final fileName = '$doctorId.jpg'; // Use doctor ID again for new image
      final storageRef =
          FirebaseStorage.instance.ref().child('doctor_images/$fileName');
      final uploadTask = storageRef.putFile(File(pickedImage.value));

      try {
        await uploadTask;
        final downloadUrl = await storageRef.getDownloadURL();
        await doctorRef.update({'imageUrl': downloadUrl});
      } on FirebaseException catch (e) {
        AppUtils.appSnackbar(title: 'Error Uploading Image',message:  e.message!,
            bgColor: AppColors.darkAppGreyColor);
        return; // Exit if image upload fails
      }
    }
    await doctorRef.update({
      'name': name,
      'email': email,
      'password': password, // Update password if needed
      'nickName': nickName,
      'gender': gender.value.toString(),
    });
    isLoading = false.obs;
    AppUtils.appSnackbar(title: 'Success',message:  'Doctor updated successfully',
        bgColor: AppColors.gunMetalColor);
  }

  Future<void> deleteDoctor(String doctorId) async {
    final doctorRef = _firestore.collection('doctors').doc(doctorId);

    try {
      await doctorRef.delete();
      AppUtils.appSnackbar(title: 'Success',message:  'Doctor deleted successfully',bgColor: AppColors.gunMetalColor);
    } on FirebaseException catch (e) {
      AppUtils.appSnackbar(title: 'Failure',message:e.toString(),bgColor: AppColors.darkAppGreyColor);
    }
  }



  Future<void> pickImage() async {
    try {
      final PlatformFile? image = await AppUtils().pickFile();
      if (image != null) {
        pickedImage.value = RxString(image.path!);
      }
    } on PlatformException catch (e) {
      // Handle platform-specific errors (e.g., permission denied)
      AppUtils.appSnackbar(title: 'Error picking image',message: e.toString(),bgColor: AppColors.darkAppGreyColor);
      print('Error picking image: $e');
    } catch (e) {
      print('Error picking image: $e');
      AppUtils.appSnackbar(title: 'Error picking image',message: e.toString(),bgColor: AppColors.darkAppGreyColor);
    }
  }
}
