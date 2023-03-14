// import 'package:flutter/material.dart';
// import 'package:lettutor_advanced_mobile/ui/pages/sign_in_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: '1-on-1 Learning App',
//       home: SignInPage(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/data/models/teacher.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course/course_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course_detail/CourseDetailPage.dart';
import 'package:lettutor_advanced_mobile/ui/pages/home/home_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/schedule/schedule_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/schedule_history/schedule_history_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/sign_in/sign_in_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/teacher_page.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher_detail/teacher_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Teacher teacher = FakeData().getTeachers()[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let-tutor',
      // home: TeacherPage(),
      // home: HomePage(),
      home: CourseDetailPage(),
    );
  }
}
