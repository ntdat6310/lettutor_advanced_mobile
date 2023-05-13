import 'package:get/get.dart';

import 'profile_setting_controller.dart';

class ProfileSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSettingController>(
      () => ProfileSettingController(),
    );
  }
}
