import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/localization.dart';
import 'package:lettutor_advanced_mobile/app/data/services/auth_service.dart';

import '../../data/models/profile/profile.dart';
import '../../data/services/profile_service.dart';

class SettingController extends GetxController {
  Rx<Profile?> profile = Rx<Profile?>(null);
  final profileService = Get.put<ProfileService>(ProfileService());
  final authService = Get.put(AuthService());
  RxString selectedLanguageCode = RxString(
      LocalizationService.locale?.languageCode ??
          LocalizationService.fallbackLocale.languageCode);

  @override
  void onInit() async {
    super.onInit();
    profile.value = await profileService.getProfile();
    selectedLanguageCode.value = LocalizationService.locale!.languageCode;
  }

  void showPickLanguageDialog() {
    Get.dialog(
      Dialog(
        child: Container(
          padding:
              const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 16),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "select_language".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...List.generate(LocalizationService.languagesSupport.length,
                  (index) {
                return Obx(() => RadioListTile<String>(
                      value: LocalizationService.locales[index].languageCode,
                      groupValue: selectedLanguageCode.value,
                      onChanged: (value) {
                        selectedLanguageCode.value =
                            value ?? selectedLanguageCode.value;
                        LocalizationService.changeLocale(
                            selectedLanguageCode.value);
                      },
                      title: Text(LocalizationService.languagesSupport[
                              LocalizationService
                                  .locales[index].languageCode] ??
                          ''),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
