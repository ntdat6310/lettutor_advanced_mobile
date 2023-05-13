import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_controller.dart';

import '../controllers/specialties_controller.dart';

class TeachersController extends GetxController {
  TeacherController teacherController =
      Get.put<TeacherController>(TeacherController(), tag: "TEACHERS");

  final SpecialtiesController specialtiesController =
      Get.put<SpecialtiesController>(
    SpecialtiesController(),
    tag: "TEACHERS",
  );

  String searchKeyForTeachers = '';

  void searchTeachers({String key = ''}) async {
    searchKeyForTeachers = key;
    List<String> specialties = specialtiesController.getSelectedSpecialties();
    await teacherController.searchTeachers(
        searchKey: searchKeyForTeachers,
        specialties: specialties.isEmpty ? null : specialties);
  }

  void selectSpecialty({required String key}) async {
    specialtiesController.selectItem(key);
    List<String> specialties = specialtiesController.getSelectedSpecialties();
    await teacherController.searchTeachers(
      searchKey: searchKeyForTeachers,
      specialties: specialties.isEmpty ? null : specialties,
    );
  }

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
