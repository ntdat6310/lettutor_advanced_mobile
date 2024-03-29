import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/auth_service.dart';

class ForgotPasswordController extends GetxController {
  final AuthService _authService = Get.put(AuthService());
  var emailController = TextEditingController();
  final RxString emailError = ''.obs;
  final RxBool isLoading = false.obs;

  void resetPassword() async {
    if (_validateEmail()) {
      isLoading.value = true;
      try {
        int responseStatusCode = await _authService.resetPasswordByEmail(
            email: emailController.text.trim());
        if (responseStatusCode == 200) {
          // Register success
          emailController.clear();
          Get.snackbar(
            "reset_password_success".tr,
            "please_check_email_for_resetting_password".tr,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
          );
        } else {
          Get.snackbar(
            "email_does_not_exist".tr,
            "please_enter_another_email".tr,
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        debugPrint("ForgotPasswordController.resetPassword ${e.toString()}");
      } finally {
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }

  bool _validateEmail() {
    bool isValid = true;

    if (!EmailValidator.validate(emailController.text.trim())) {
      emailError.value = 'please_enter_a_valid_email'.tr;
      isValid = false;
    } else {
      emailError.value = '';
    }
    return isValid;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
