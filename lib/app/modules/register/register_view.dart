import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../utils/constants/assets.dart';
import '../widgets/custom_suffix_icon.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.email_rounded)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Confirm password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: CustomSuffixIcon(
                                    icon: Icons.password_rounded)),
                            obscureText: true,
                          ),
                        ),

                        ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.login),
                              SizedBox(width: 10),
                              Text("Register"),
                            ],
                          ),
                          onPressed: () {
                            Get.offAll(Routes.MY_TAB_BAR);
                          },
                        ),
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
                                    //TODO: Implement sign up logic
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
