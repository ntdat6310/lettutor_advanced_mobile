import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';

class ProfileSettingController extends GetxController {
  final ProfileService profileService = Get.put<ProfileService>(ProfileService());


  @override
  void onInit() {
    super.onInit();
  }
}
