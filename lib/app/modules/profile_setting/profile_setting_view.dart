import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/constants.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/custom_text_field.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/date_picker_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/dropdown_button_from_field_view.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/multi_select_view.dart';

import 'profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({Key? key}) : super(key: key);

  void _onSubmit() {
    controller.submitProfile();
  }

  void _onSelectPhotoClick(BuildContext context) {
    controller.selectPhotoController.showSelectPhotoOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_profile'.tr),
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
                // AVATAR
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Obx(() {
                        if (controller.selectPhotoController.image.value ==
                            null) {
                          return CircleAvatar(
                            backgroundImage: NetworkImage(
                                controller.profile.value?.avatar ??
                                    Constants.defaultUserAvatarUrl),
                            radius: 60,
                          );
                        } else {
                          return CircleAvatar(
                            backgroundImage: FileImage(
                                controller.selectPhotoController.image.value!),
                            radius: 60,
                          );
                        }
                      }),
                      Positioned(
                        right: -3,
                        bottom: -3,
                        child: InkWell(
                          onTap: () {
                            _onSelectPhotoClick(context);
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // NAME
                CustomTextField(
                  title: "name".tr,
                  hintText: 'enter_your_name'.tr,
                  required: true,
                  textEditingController: controller.nameController,
                ),

                // EMAIL ADDRESS
                CustomTextField(
                  title: "Email",
                  textEditingController: controller.emailController,
                  suffixIcon: Icon(Icons.verified, color: Colors.blue[300]),
                  disable: true,
                ),

                // PHONE NUMBER
                CustomTextField(
                  title: 'phone_number'.tr,
                  textEditingController: controller.phoneController,
                  disable: true,
                  suffixIcon: Icon(Icons.verified, color: Colors.blue[300]),
                ),

                // COUNTRY
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'country'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFromFieldView(),

                // BIRTHDAY
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'birthday'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                CustomDatePicker(),

                // TEST PREPARATION
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: '* ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: 'test_preparation'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                MultiSelectView(),

                // STUDY SCHEDULE
                CustomTextField(
                  title: "study_schedule".tr,
                  textEditingController: controller.studyScheduleController,
                  minLines: 3,
                  maxLines: 10,
                ),

                // SUBMIT BUTTON
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    child: Text(
                      "submit".tr,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
