import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/helpers.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

import '../../data/models/teacher/teacher.dart';

class TeacherDetailController extends GetxController {
  late Teacher teacher;
  RxList<String> languageNames = <String>[].obs;
  final TeacherService teacherService = Get.find();
  RxBool isLoading = true.obs;
  RxList<RatingComment> feedbacks = RxList<RatingComment>();

  @override
  void onInit() async {
    teacher = Get.find<Teacher>(tag: 'selectedTeacher');
    languageNames
        .addAll(await Helper.getLanguageNames(teacher.languages ?? ''));
    List<RatingComment>? results = await teacherService
        .getFeedbacksByTeacherId(teacherId: teacher.userId ?? '');
    if (results != null) {
      feedbacks.addAll(results);
      debugPrint(
          "TeacherDetailController ${teacher.name} - ${feedbacks.length}");
    }
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    Get.delete<Teacher>(tag: 'selectedTeacher');
    super.onClose();
  }
}
