import 'package:get/get.dart';

import '../../data/models/teacher.dart';

class TeacherDetailController extends GetxController {
  //TODO: Implement TeacherDetailController

  late final Teacher teacher;

  @override
  void onInit() {
    super.onInit();
    teacher = Get.find(tag: 'selectedTeacher');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Get.delete<Teacher>(tag: 'selectedTeacher');
    super.onClose();
  }
}
