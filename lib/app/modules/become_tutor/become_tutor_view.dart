import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../profile_setting/components/custom_text_field.dart';
import '../profile_setting/components/date_picker_view.dart';
import '../profile_setting/components/dropdown_button_from_field_view.dart';
import 'become_tutor_controller.dart';

class BecomeTutorView extends GetView<BecomeTutorController> {
  const BecomeTutorView({Key? key}) : super(key: key);

  void _onSubmit() {
    controller.submitBecomeTutor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('become_tutor'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isTutorRegistered.value == false) {
          return SingleChildScrollView(
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
                      child: Obx(() {
                        return CircleAvatar(
                          backgroundImage: NetworkImage(
                              controller.profile.value?.avatar ??
                                  Constants.defaultUserAvatarUrl),
                          radius: 60,
                        );
                      }),
                    ),

                    // NAME
                    CustomTextField(
                      title: "name".tr,
                      hintText: 'enter_your_name'.tr,
                      required: true,
                      textEditingController: controller.nameController,
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

                    // INTERESTS
                    CustomTextField(
                      title: "interests".tr,
                      textEditingController: controller.interestsController,
                      minLines: 1,
                      maxLines: 10,
                    ),

                    // EXPERIENCE
                    CustomTextField(
                      title: "experience".tr,
                      textEditingController: controller.experienceController,
                      minLines: 1,
                      maxLines: 10,
                    ),

                    // EDUCATION
                    CustomTextField(
                      title: "education".tr,
                      textEditingController: controller.educationController,
                      minLines: 1,
                      maxLines: 10,
                    ),

                    // BIO
                    CustomTextField(
                      title: "bio".tr,
                      textEditingController: controller.bioController,
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
          );
        } else {
          final screenHeight = MediaQuery.of(context).size.height;
          return Container(
            width: double.infinity,
            color: Colors.white10,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "you_have_done_all_the_steps".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("please_wait_for_the_operator_approval".tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 4),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("back".tr,
                          style: const TextStyle(
                            fontSize: 20,
                          ))),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
