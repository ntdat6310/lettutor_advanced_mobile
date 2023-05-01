import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/teacher_service.dart';

import '../../data/models/teacher/teacher.dart';

class HomeController extends GetxController {
  TeacherService teacherService = Get.put(TeacherService());
  RxList<Teacher> teachers = RxList<Teacher>([]);

  @override
  void onInit() async {
    super.onInit();
    List<Teacher>? results = await teacherService.getListTutorWithPagination();
    if (results != null) {
      teachers.addAll(results);
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
}
