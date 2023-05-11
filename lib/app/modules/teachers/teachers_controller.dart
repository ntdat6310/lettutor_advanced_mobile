import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_controller.dart';

class TeachersController extends GetxController {
  TeacherController teacherController =
      Get.put<TeacherController>(TeacherController(), tag: "TEACHERS");

  final RxList<String> specialties = RxList<String>();

  String searchKeyForTeachers = '';

  @override
  void onInit() async {
    super.onInit();
    debugPrint("TeachersController.onInit");
    teacherController.searchTeachers();
  }

  @override
  void onReady() {
    debugPrint("TeachersController.onReady");
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint("TeachersController.onClose");
    super.onClose();
  }
}
