import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/models/auth/register_email_request.dart';
import 'package:lettutor_advanced_mobile/app/modules/register/conponents/register_success_dialog.dart';

import '../../data/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService authService = Get.put(AuthService());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmPasswordError = ''.obs;
  final RxBool isLoading = false.obs;

  void validateAndSubmitRegister() async {
    if (_validateInputs()) {
      isLoading.value = true;

      try {
        int responseStatusCode = await authService.registerByEmail(
            body: RegisterByEmailRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ));
        if (responseStatusCode == 201) {
          // Register success
          Get.dialog(const RegisterSuccessDialog());
        } else {
          Get.snackbar(
            "Register failed : Email is exist",
            "Please enter another email",
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        debugPrint(
            "RegisterController.validateAndSubmitSignIn ${e.toString()}");
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

    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      confirmPasswordError.value = 'Mật khẩu không khớp';
      isValid = false;
    } else {
      confirmPasswordError.value = '';
    }

    return isValid;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // Có cần phải delete không?
    Get.delete<RegisterController>();
    super.onClose();
  }
}
