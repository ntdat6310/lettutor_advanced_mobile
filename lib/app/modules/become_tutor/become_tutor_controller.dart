import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/utils/helpers.dart';
import '../../data/models/profile/profile.dart';
import '../../data/models/profile/test_preparation.dart';
import '../../data/services/profile_service.dart';
import '../profile_setting/components/date_picker_controller.dart';
import '../profile_setting/components/dropdown_button_from_field_controller.dart';
import '../profile_setting/components/multi_select_controller.dart';

class BecomeTutorController extends GetxController {
  RxBool isTutorRegistered = false.obs;

  Rx<Profile?> profile = Rx<Profile?>(null);
  final profileService = Get.put<ProfileService>(ProfileService());
  final nameController = TextEditingController();
  final interestsController = TextEditingController();
  final experienceController = TextEditingController();
  final educationController = TextEditingController();
  final bioController = TextEditingController();

  final testPreparationController =
      Get.put<MultiSelectController>(MultiSelectController());

  final countryController = Get.put<DropdownButtonFromFieldController>(
      DropdownButtonFromFieldController());

  final datePickerController =
      Get.put<CustomDatePickerController>(CustomDatePickerController());

  @override
  void onInit() async {
    super.onInit();
    profile.value = await profileService.getProfile();

    if (profile.value == null) {
      Get.snackbar("PROFILE IS NULL", "Please review your code!");
    } else {
      debugPrint("PROFILE: ${profile.value!.toJson().toString()}");
      debugPrint("PROFILE TEACHER: ${profile.value!.becomeTutor.toString()}");
      if (profile.value!.becomeTutor != null) {
        isTutorRegistered.value = true;
      }
      // Init values
      nameController.text = profile.value!.name ?? '';
      interestsController.text = profile.value!.studySchedule ?? '';
      countryController.setValue(
          value: profile.value!.country?.toUpperCase() ?? 'VN');
      datePickerController.setValue(
        newDate: Helper.convertDateStringToDateTime(
          dateString: profile.value!.birthday,
        ),
      );
    }
  }

  void submitBecomeTutor() async {
    if (profile.value != null && isFormValid()) {
      Map<String, dynamic> body = {
        'name': nameController.text,
        'country': countryController.dropdownValue.value,
        "birthday": DateFormat('yyyy-MM-dd')
            .format(datePickerController.selectedDate.value),
        "interests": interestsController.text,
        "experience": experienceController.text,
        "education": educationController.text,
        "bio": bioController.text,
        'price': 50000,
      };

      bool response = await profileService.becomeTutor(body: body);
      if (response) {
        isTutorRegistered.value = true;
        Get.snackbar(
          "become_tutor_successfully".tr,
          "",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        Get.snackbar(
          "become_tutor_failed".tr,
          "please_review_your_code".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar(
        "warning".tr,
        "please_enter_all_required_fields".tr,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool isFormValid() {
    return nameController.text.isNotEmpty;
  }

  @override
  void onClose() {
    nameController.dispose();
    interestsController.dispose();
    experienceController.dispose();
    educationController.dispose();
    bioController.dispose();
    Get.delete<MultiSelectController>();
    Get.delete<DropdownButtonFromFieldController>();
    super.onClose();
  }
}
