import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teachers_and_home_controller.dart';

class MyTabBarController extends GetxController {
  TeachersAndHomeController teachersAndHomeController = Get.put(TeachersAndHomeController());

  final selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
