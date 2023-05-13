import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

class TestApiController extends GetxController {
  TeacherService teacherService = Get.put(TeacherService());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getListTeacher() async {
    debugPrint("CALL API getListTeacher");
    List<Teacher>? teachers = await teacherService.getListTutorWithSearchAndFilterAndPagination();
    if (teachers == null) {
      debugPrint(
          "TestApiController: teacherService.getListTutorWithPagination - NULL");
    } else {
      debugPrint(teachers.length.toString());
    }
  }
}
