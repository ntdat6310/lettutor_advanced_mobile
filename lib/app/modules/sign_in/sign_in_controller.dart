import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor_advanced_mobile/app/data/models/auth/login_email_request.dart';
import 'package:lettutor_advanced_mobile/app/data/services/auth_service.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

class SignInController extends GetxController {
  final AuthService authService = Get.put(AuthService());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailError = ''.obs;
  final passwordError = ''.obs;
  final isLoading = false.obs;
  void validateAndSubmitSignIn() async {
    if (_validateInputs()) {
      isLoading.value = true;

      try {
        int responseStatusCode = await authService.loginWithEmail(
            body: LoginByEmailRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ));
        if (responseStatusCode == 200) {
          // Navigate to the next screen after successful login
          Get.offAllNamed(Routes.MY_TAB_BAR);
          // Get.offAllNamed(Routes.SCHEDULE);
          // Get.offAllNamed(Routes.SCHEDULE_HISTORY);
        } else if (responseStatusCode == 400) {
          Get.snackbar(
            "Sign in failed : Incorrect email or password",
            "Please retype your email or password",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 5),
          );
        } else if (responseStatusCode == 500) {
          Get.snackbar(
            "Your email has not activated",
            "Please activate your email before login",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 5),
          );
        }
      } catch (e) {
        // Show an error message if the sign-in fails
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  bool _validateInputs() {
    bool isValid = true;

    if (!EmailValidator.validate(emailController.text.trim())) {
      emailError.value = 'Vui lòng nhập email hợp lệ';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (passwordController.text.trim().isEmpty ||
        passwordController.text.trim().length < 6) {
      passwordError.value = 'Mật khẩu phải có ít nhất 6 ký tự';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  void loginWithGoogle() async {
    try {
      await GoogleSignInApi.logout();
    } catch (e) {
      debugPrint("SignInController.loginWithGoogle ${e.toString()}");
    }

    GoogleSignInAccount? gUser = await GoogleSignInApi.login();
    if (gUser == null) return;
    isLoading.value = true;
    GoogleSignInAuthentication gAuth = await gUser.authentication;
    if (gAuth.accessToken == null) return;

    try {
      int responseStatusCode = await authService.loginWithGoogle(
        body: {
          "access_token": gAuth.accessToken!,
        },
      );
      if (responseStatusCode == 200) {
        // Navigate to the next screen after successful login
        Get.offAllNamed(Routes.MY_TAB_BAR);
      } else if (responseStatusCode == 500) {
        Get.snackbar(
          "Login by Google failed",
          "Please check out your code",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
