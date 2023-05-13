import 'package:get/get.dart';

import 'my_tab_bar_controller.dart';

class MyTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTabBarController>(
      () => MyTabBarController(),
    );
  }
}
