import 'package:get/get.dart';

import 'become_tutor_controller.dart';

class BecomeTutorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BecomeTutorController>(
      () => BecomeTutorController(),
    );
  }
}
