import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/helpers.dart';
import 'package:lettutor_advanced_mobile/app/data/models/profile/test_preparation.dart';
import 'package:lettutor_advanced_mobile/app/data/services/profile_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/select_photo_controller.dart';

import '../../data/models/profile/profile.dart';
import 'components/date_picker_controller.dart';
import 'components/dropdown_button_from_field_controller.dart';
import 'components/multi_select_controller.dart';

class ProfileSettingController extends GetxController {
  Rx<Profile?> profile = Rx<Profile?>(null);
  final profileService = Get.put<ProfileService>(ProfileService());
  final nameController = TextEditingController();
  final studyScheduleController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final testPreparationController =
      Get.put<MultiSelectController>(MultiSelectController());

  final countryController = Get.put<DropdownButtonFromFieldController>(
      DropdownButtonFromFieldController());

  final datePickerController =
      Get.put<CustomDatePickerController>(CustomDatePickerController());

  final selectPhotoController =
      Get.put<SelectPhotoController>(SelectPhotoController());

  @override
  void onInit() async {
    super.onInit();
    profile.value = await profileService.getProfile();
    List<TestPreparation> testPreparationList =
        await profileService.getAllTestPreparations();

    if (profile.value == null) {
      Get.snackbar("PROFILE IS NULL", "Please review your code!");
    } else {
      debugPrint("PROFILE: ${profile.value!.toJson().toString()}");
      // Init values
      nameController.text = profile.value!.name ?? '';
      studyScheduleController.text = profile.value!.studySchedule ?? '';
      emailController.text = profile.value!.email ?? '';
      phoneController.text = profile.value!.phone ?? '';

      testPreparationController.initOptions(testPreparationList);
      List<String> testPreparationSelectedItems =
          profile.value!.testPreparations?.map((e) => "${e.id}").toList() ?? [];
      testPreparationController
          .updateSelectedItems(testPreparationSelectedItems);

      countryController.setValue(
          value: profile.value!.country?.toUpperCase() ?? 'VN');

      datePickerController.setValue(
        newDate: Helper.convertDateStringToDateTime(
          dateString: profile.value!.birthday,
        ),
      );
    }
  }

  void submitProfile() async {
    if (profile.value != null && isFormValid()) {
      Map<String, dynamic> body = {
        'name': nameController.text,
        'country': countryController.dropdownValue.value,
        'phone': profile.value?.phone ?? '',
        "birthday": DateFormat('yyyy-MM-dd')
            .format(datePickerController.selectedDate.value),
        "studySchedule": studyScheduleController.text,
        "testPreparations": testPreparationController.selectedItems.toList()
      };
      if (profile.value?.level != null) {
        body['level'] = profile.value?.level;
      }
      int? response = await profileService.updateProfile(body: body);
      if (response == 200) {
        Get.snackbar(
          "Update profile successfully",
          "",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        Get.snackbar(
          "Update profile failed",
          "PLease review your code",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar(
        "Warning",
        "Please enter all required fields.",
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool isFormValid() {
    return nameController.text.isNotEmpty &&
        testPreparationController.isValid.value;
  }

  @override
  void onClose() {
    nameController.dispose();
    studyScheduleController.dispose();
    emailController.dispose();
    phoneController.dispose();
    Get.delete<MultiSelectController>();
    Get.delete<DropdownButtonFromFieldController>();
    Get.delete<CustomDatePickerController>();
    Get.delete<SelectPhotoController>();
    super.onClose();
  }
}
