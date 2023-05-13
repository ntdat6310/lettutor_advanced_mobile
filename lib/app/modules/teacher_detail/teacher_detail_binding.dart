import 'package:get/get.dart';

import 'teacher_detail_controller.dart';

class TeacherDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDetailController>(
      () => TeacherDetailController(teacher: Get.arguments),
    );
  }
}
