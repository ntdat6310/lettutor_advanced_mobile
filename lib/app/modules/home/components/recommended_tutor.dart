import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/teacher_view.dart';

import '../../../routes/app_pages.dart';

class RecommendedTutor extends StatelessWidget {
  const RecommendedTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Favorite tutors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.TEACHER);
          },
          child: const Text('See all tutors'),
        ),
      ],
    );
  }
}
