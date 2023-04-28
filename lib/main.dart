import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/data/models/teacher.dart';
import 'modules/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Teacher teacher = FakeData().getTeachers()[0];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Let-tutor',
      // home: TeacherPage(),
      // home: HomePage(),
      home: SignInPage(),
    );
  }
}
