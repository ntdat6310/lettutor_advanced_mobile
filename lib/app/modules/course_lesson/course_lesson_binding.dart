import 'package:get/get.dart';

import 'course_lesson_controller.dart';

class CourseLessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseLessonController>(
      () => CourseLessonController(),
    );
  }
}
