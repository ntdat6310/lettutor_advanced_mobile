import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/auth_service.dart';

import '../../data/models/profile/profile.dart';
import '../../data/services/profile_service.dart';

class SettingController extends GetxController {
  Rx<Profile?> profile = Rx<Profile?>(null);
  final profileService = Get.put<ProfileService>(ProfileService());
  final authService = Get.put(AuthService());

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
