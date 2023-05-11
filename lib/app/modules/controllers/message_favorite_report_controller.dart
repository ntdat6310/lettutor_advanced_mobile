import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_toggle_favorite_controller.dart';

class MessageFavoriteReportController extends GetxController {
  final TeacherToggleFavoriteController _teacherToggleFavorite =
      Get.put<TeacherToggleFavoriteController>(
          TeacherToggleFavoriteController());

  void toggleFavorite({required String teacherId}) {
    _teacherToggleFavorite.toggleFavorite(teacherId: teacherId);
  }
}
