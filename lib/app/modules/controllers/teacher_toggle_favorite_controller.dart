import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/teachers/teachers_controller.dart';

class TeacherToggleFavoriteController extends GetxController {
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());

  final TeachersController _teachersController =
      Get.put<TeachersController>(TeachersController());

  @override
  void onInit() {
    super.onInit();
  }

  void toggleFavorite({required String teacherId}) {
    _homeController.teacherController
        .toggleFavoriteTeacherApi(teacherId: teacherId);
    _homeController.teacherController
        .toggleFavoriteTeacherLocal(teacherId: teacherId);
    _teachersController.teacherController
        .toggleFavoriteTeacherLocal(teacherId: teacherId);
  }
}
