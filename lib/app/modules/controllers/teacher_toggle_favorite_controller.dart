import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_controller.dart';

class TeacherToggleFavoriteController extends GetxController {
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());

  void toggleFavorite({required String teacherId}) {
    _homeController.teacherController
        .toggleFavoriteTeacherApi(teacherId: teacherId);
    _homeController.teacherController
        .toggleFavoriteTeacherLocal(teacherId: teacherId);
  }
}
