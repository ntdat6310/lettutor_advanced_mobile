import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setting'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
