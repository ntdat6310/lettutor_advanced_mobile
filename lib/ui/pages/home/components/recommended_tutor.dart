import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/teacher_page.dart';

class RecommendedTutor extends StatelessWidget {
  const RecommendedTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Recommended tutors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherPage()));
          },
          child: const Text('See all'),
        ),
      ],
    );
  }
}
