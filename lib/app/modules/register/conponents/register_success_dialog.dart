import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

class RegisterSuccessDialog extends StatelessWidget {
  const RegisterSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Đăng ký thành công'),
      content:
          const Text('Vui lòng kiểm tra email của bạn để xác thực tài khoản'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: const Text('Đi đến trang đăng nhập'),
        ),
      ],
    );
  }
}
