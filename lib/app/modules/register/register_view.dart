import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../utils/constants/assets.dart';
import '../widgets/custom_suffix_icon.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
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
                            controller: _registerController.emailController,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.email_rounded)),
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: _registerController
                                  .emailError.value.isNotEmpty,
                              child: Text(
                                _registerController.emailError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _registerController.passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: _registerController
                                  .passwordError.value.isNotEmpty,
                              child: Text(
                                _registerController.passwordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller:
                                _registerController.confirmPasswordController,
                            decoration: const InputDecoration(
                                labelText: 'Confirm password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: _registerController
                                  .confirmPasswordError.value.isNotEmpty,
                              child: Text(
                                _registerController.confirmPasswordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Obx(() {
                          if (_registerController.isLoading.value) {
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
                                children: const <Widget>[
                                  Icon(Icons.login),
                                  SizedBox(width: 10),
                                  Text("Register"),
                                ],
                              ),
                              onPressed: () {
                                _registerController.validateAndSubmitRegister();
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
                                const Text('Already have an account?'),
                                TextButton(
                                  child: const Text('Sign in'),
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
