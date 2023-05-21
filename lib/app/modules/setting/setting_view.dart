import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/utils/localization.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/components/setting_item.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/components/user_profile_item.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  SettingView({Key? key}) : super(key: key);
  final settingController = Get.put<SettingController>(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() =>
                    UserProfileItem(profile: settingController.profile.value)),
                const SizedBox(height: 12),
                SettingItem(
                  icon: Icons.chat_outlined,
                  title: "chat_with_ai".tr,
                  onClick: () {
                    Get.toNamed(Routes.CHAT_WITH_AI);
                  },
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.verified_user_outlined,
                  title: "become_a_tutor".tr,
                  onClick: () {
                    Get.toNamed(Routes.BECOME_TUTOR);
                  },
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.history,
                  title: "history_schedule".tr,
                  onClick: () {
                    Get.toNamed(Routes.SCHEDULE_HISTORY);
                  },
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.dark_mode,
                  title: "theme".tr,
                  onClick: () {},
                  bottomSpace: 12,
                ),
                Obx(() => SettingItem(
                      icon: Icons.language_outlined,
                      title: "select_language".tr,
                      value: LocalizationService.languagesSupport[
                          settingController.selectedLanguageCode.value],
                      onClick: () {
                        settingController.showPickLanguageDialog();
                      },
                      bottomSpace: 12,
                    )),
                SettingItem(
                  icon: Icons.change_circle_outlined,
                  title: "change_password".tr,
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.logout,
                  title: "logout".tr,
                  onClick: () {
                    controller.authService.logout();
                  },
                  bottomSpace: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
