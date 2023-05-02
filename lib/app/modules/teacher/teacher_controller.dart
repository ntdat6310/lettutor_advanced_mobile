import 'package:get/get.dart';

import '../../data/models/teacher/teacher.dart';
import '../../data/services/teacher_service.dart';

class TeacherController extends GetxController {
  TeacherService teacherService = Get.put(TeacherService());
  RxList<Teacher> teachers = RxList<Teacher>([]);

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
    List<Teacher>? results = await teacherService.getListTutorWithSearchAndFilterAndPagination();
    if (results != null) {
      teachers.addAll(results);
      teacherService.sortTeachersByFavoriteAndRating(teachers: teachers);
    }
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
      }
    }
  }
}
