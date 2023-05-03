import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/teacher/teacher.dart';
import '../../data/services/teacher_service.dart';

class TeacherController extends GetxController {
  TeacherService teacherService = Get.put(TeacherService());
  RxList<Teacher> teachers = RxList<Teacher>([]);
  RxBool isLoadingTeachers = false.obs;
  String searchKeyForTeachers = '';

  Future<bool> searchTeachers({String searchKey = ''}) async {
    isLoadingTeachers.value = true;
    searchKeyForTeachers = searchKey;
    List<Teacher>? results =
        await teacherService.getListTutorWithSearchAndFilterAndPagination(
      searchKey: searchKey,
    );
    if (results != null && results.isNotEmpty) {
      teachers.clear();
      teachers.addAll(results);
      teacherService.sortTeachersByFavoriteAndRating(teachers: teachers);
      isLoadingTeachers.value = false;
      return true;
    }else{
      teachers.clear();
      isLoadingTeachers.value = false;
      return false;
    }
  }

  Teacher? getTeacherById({required String id}) {
    for (var teacher in teachers) {
      if (teacher.userId == id) {
        return teacher;
      }
    }
    return null;
  }

  @override
  void onInit() async {
    super.onInit();
    searchTeachers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleFavoriteTeacher(String teacherId) {
    for (var teacher in teachers) {
      if (teacher.userId == teacherId) {
        teacher.isFavorite.value = !teacher.isFavorite.value;
        teacherService.toggleFavoriteTutor(tutorId: teacherId);
        break;
      }
    }
    teacherService.sortTeachersByFavoriteAndRating(teachers: teachers);
    teachers.refresh();
  }
}
