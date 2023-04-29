import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/sign_in/sign_in_view.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import 'app/data/fake_data.dart';
import 'app/data/models/teacher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Teacher teacher = FakeData().getTeachers()[0];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Let-tutor',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
