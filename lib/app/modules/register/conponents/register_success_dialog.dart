import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('register_successfully'.tr),
      content: Text('please_check_your_email_to_verify_your_account'.tr),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text('back_to_login'.tr),
        ),
      ],
    );
  }
}
