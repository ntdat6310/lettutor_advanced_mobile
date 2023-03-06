import 'package:flutter/material.dart';

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
    return Scaffold(
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
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              suffixIcon:
                                  CustomSuffixIcon(icon: Icons.email_rounded)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            icon: const Icon(Icons.facebook),
                            onPressed: () {
                              //TODO: Implement Facebook login logic
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.facebook_rounded,
                              color: Colors.blue,
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
        ));
  }
}
