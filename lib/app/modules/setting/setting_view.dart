import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/components/setting_item.dart';
import 'package:lettutor_advanced_mobile/app/modules/setting/components/user_profile_item.dart';

import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
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
                const UserProfileItem(),
                const SizedBox(height: 12),
                SettingItem(
                  icon: Icons.chat_outlined,
                  title: "Chat with AI",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.verified_user_outlined,
                  title: "Become a tutor",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.favorite_border,
                  title: "Favorite tutors",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.history,
                  title: "History",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.dark_mode,
                  title: "Theme",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.language_outlined,
                  title: "Select language",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.change_circle_outlined,
                  title: "Change password",
                  onClick: () {},
                  bottomSpace: 12,
                ),
                SettingItem(
                  icon: Icons.logout,
                  title: "Logout",
                  onClick: () {},
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
