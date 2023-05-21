import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/specialties_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_controller.dart';

import '../../data/models/teacher/teacher.dart';

class HomeController extends GetxController {
  final TeacherService teacherService = Get.put(TeacherService());
  final TeacherController teacherController = Get.put<TeacherController>(
      TeacherController(storedBy: "HOME"),
      tag: "HOME");

  final SpecialtiesController specialtiesController =
      Get.put<SpecialtiesController>(
    SpecialtiesController(),
    tag: "HOME",
  );

  void toggleFavorite({required Teacher teacher}) {
    teacherService.toggleFavoriteTutor(tutorId: teacher.userId!);
    teacher.isFavorite.value = !teacher.isFavorite.value;
    teacherController.filterFavoriteTeachers();
  }

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
