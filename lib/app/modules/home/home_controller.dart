import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_controller.dart';

class HomeController extends GetxController {
  final TeacherController teacherController = Get.put<TeacherController>(
      TeacherController(storedBy: "HOME"),
      tag: "FAVORITE_TEACHERS");

  final RxList<String> specialties = RxList<String>();

  @override
  void onInit() async {
    super.onInit();
    if (teacherController.teachers.isEmpty) {
      await teacherController.searchTeachers();
    }
    teacherController.filterFavoriteTeachers();
  }
}
