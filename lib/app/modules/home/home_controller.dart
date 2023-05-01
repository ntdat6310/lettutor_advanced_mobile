import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/teacher_controller.dart';

import '../../data/models/teacher/teacher.dart';

class HomeController extends GetxController {
  final TeacherController teacherController = Get.put(TeacherController());

  @override
  void onInit() async {
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
}
