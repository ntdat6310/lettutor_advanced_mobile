import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/teacher/teacher.dart';
import '../../data/services/teacher_service.dart';

class TeacherController extends GetxController {
  final TeacherService _teacherService = Get.put(TeacherService());
  RxList<Teacher> teachers = RxList<Teacher>([]);
  RxBool isLoadingTeachers = false.obs;
  String? storedBy;

  TeacherController({this.storedBy});

  Future<bool> searchTeachers({
    String searchKey = '',
    List<String>? specialties,
  }) async {
    isLoadingTeachers.value = true;
    List<Teacher> results =
        await _teacherService.getListTutorWithSearchAndFilterAndPagination(
      searchKey: searchKey,
      specialties: specialties,
    );
    if (results.isNotEmpty) {
      teachers.clear();
      teachers.addAll(results);
      _teacherService.sortTeachersByFavoriteAndRating(teachers: teachers);
      isLoadingTeachers.value = false;
      return true;
    } else {
      teachers.clear();
      isLoadingTeachers.value = false;
      return false;
    }
  }

  void filterFavoriteTeachers() {
    teachers.removeWhere((teacher) => teacher.isFavorite.value == false);
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
    debugPrint("TeacherController.onInit");
    searchTeachers();
  }

  void toggleFavoriteTeacherLocal({required String teacherId}) {
    bool hasTeacherId = false;
    for (var teacher in teachers) {
      if (teacher.userId == teacherId) {
        teacher.isFavorite.value = !teacher.isFavorite.value;
        hasTeacherId = true;
        break;
      }
    }

    if (storedBy == "HOME") {
      filterFavoriteTeachers();
      return;
    }

    if (hasTeacherId) {
      _teacherService.sortTeachersByFavoriteAndRating(teachers: teachers);
      teachers.refresh();
    }
  }

  /// Toggle favorite only by api
  void toggleFavoriteTeacherApi({required String teacherId}) {
    _teacherService.toggleFavoriteTutor(tutorId: teacherId);
  }
}
