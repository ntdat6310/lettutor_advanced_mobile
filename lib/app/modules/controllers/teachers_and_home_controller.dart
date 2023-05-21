import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/teachers/teachers_controller.dart';

class TeachersAndHomeController extends GetxController{
  final TeachersController teachersController = Get.put<TeachersController>(TeachersController());
  final HomeController homeController = Get.put<HomeController>(HomeController());

  void refreshAll(){
    teachersController.refreshTeachers();
    homeController.refreshTeachers();
  }
}