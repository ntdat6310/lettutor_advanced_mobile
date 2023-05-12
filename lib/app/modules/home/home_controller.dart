import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/specialties_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_controller.dart';

class HomeController extends GetxController {
  final TeacherController teacherController = Get.put<TeacherController>(
      TeacherController(storedBy: "HOME"),
      tag: "HOME");

  final SpecialtiesController specialtiesController =
      Get.put<SpecialtiesController>(
    SpecialtiesController(),
    tag: "HOME",
  );

  void selectSpecialty({required String key}) async {
    specialtiesController.selectItem(key);
    List<String> specialties = specialtiesController.getSelectedSpecialties();
    await teacherController.searchTeachers(specialties: specialties);
    teacherController.filterFavoriteTeachers();
  }

  @override
  void onInit() async {
    super.onInit();
    if (teacherController.teachers.isEmpty) {
      await teacherController.searchTeachers();
    }
    teacherController.filterFavoriteTeachers();
  }
}
