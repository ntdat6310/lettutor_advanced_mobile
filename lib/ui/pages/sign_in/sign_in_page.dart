import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_advanced_mobile/ui/pages/home/home_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/my_tab_bar.dart';

import '../../../utils/constants/assets.dart';
import '../../widgets/custom_suffix_icon.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              child: const Text('Forgot Password?'),
                              onPressed: () {
                                //TODO: Implement forgot password logic
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Not a member yet? '),
                                TextButton(
                                  child: const Text('Sign up'),
                                  onPressed: () {
                                    //TODO: Implement sign up logic
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(Icons.login),
                              SizedBox(width: 10),
                              Text("Sign In"),
                            ],
                          ),
                          onPressed: () {
                            //TODO: Implement login logic
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyBottomNavigationBar()));
                          },
                        ),
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
                              onPressed: () {
                                //TODO: Implement Facebook login logic
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/google_icon.svg',
                                height: 45,
                              ),
                              onPressed: () {
                                //TODO: Implement Google login logic
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
