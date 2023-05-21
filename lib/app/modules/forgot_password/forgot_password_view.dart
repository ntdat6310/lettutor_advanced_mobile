import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/constants/assets.dart';
import '../widgets/custom_suffix_icon.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('forgot_password'.tr),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child:  const SizedBox(
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
                                  const Icon(Icons.login),
                                  const SizedBox(width: 10),
                                  Text("submit".tr),
                                ],
                              ),
                              onPressed: () {
                                controller.resetPassword();
                              },
                            );
                          }
                        }),
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
                  ),
                )),
          )),
    );
  }
}
