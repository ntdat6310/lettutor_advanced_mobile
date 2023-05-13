import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/my_tab_bar/my_tab_bar_view.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../utils/constants/assets.dart';
import '../widgets/custom_suffix_icon.dart';
import 'sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Sign In'),
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
                              visible:
                                  controller.passwordError.value.isNotEmpty,
                              child: Text(
                                controller.passwordError.value,
                                style: const TextStyle(color: Colors.red),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              child: const Text('Forgot Password?'),
                              onPressed: () {
                                Get.toNamed(Routes.FORGOT_PASSWORD);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Not a member yet? '),
                                TextButton(
                                  child: const Text('Sign up'),
                                  onPressed: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                ),
                              ],
                            ),
                          ],
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
                                children: const <Widget>[
                                  Icon(Icons.login),
                                  SizedBox(width: 10),
                                  Text("Sign In"),
                                ],
                              ),
                              onPressed: () {
                                controller.validateAndSubmitSignIn();
                              },
                            );
                          }
                        }),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text('Or continue with'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/facebook_icon.svg',
                                height: 45,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/google_icon.svg',
                                height: 45,
                              ),
                              onPressed: () {},
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
