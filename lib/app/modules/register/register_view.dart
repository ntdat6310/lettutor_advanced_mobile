import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/assets.dart';
import '../widgets/custom_suffix_icon.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('register'.tr),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const SizedBox(
                              height: 150,
                              child: Image(
                                image: AssetImage(Assets.assetsImageLogo),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: TextField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.email_rounded)),
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: controller.emailError.value.isNotEmpty,
                              child: Text(
                                controller.emailError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                                labelText: 'password'.tr,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: const CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),
                        Obx(() => Visibility(
                              visible:
                                  controller.passwordError.value.isNotEmpty,
                              child: Text(
                                controller.passwordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: controller.confirmPasswordController,
                            decoration: InputDecoration(
                                labelText: 'confirm_password'.tr,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: const CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: controller
                                  .confirmPasswordError.value.isNotEmpty,
                              child: Text(
                                controller.confirmPasswordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ),
                            );
                          } else {
                            return ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const  Icon(Icons.login),
                                  const SizedBox(width: 10),
                                  Text("register".tr),
                                ],
                              ),
                              onPressed: () {
                                controller.validateAndSubmitRegister();
                              },
                            );
                          }
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('already_have_an_account'.tr),
                                TextButton(
                                  child: Text('sign_in'.tr),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}
