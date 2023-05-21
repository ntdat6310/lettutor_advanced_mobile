import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RecommendedTutor extends StatelessWidget {
  const RecommendedTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'favorite_tutors'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.TEACHER);
          },
          child: Text('see_all_tutors'.tr),
        ),
      ],
    );
  }
}
