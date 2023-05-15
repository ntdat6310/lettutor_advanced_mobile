import 'package:get/get.dart';

import '../../data/models/profile/profile.dart';
import '../../data/services/profile_service.dart';

class SettingController extends GetxController {
  Rx<Profile?> profile = Rx<Profile?>(null);
  final profileService = Get.put<ProfileService>(ProfileService());

  @override
  void onInit() async {
    super.onInit();
    profile.value = await profileService.getProfile();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
