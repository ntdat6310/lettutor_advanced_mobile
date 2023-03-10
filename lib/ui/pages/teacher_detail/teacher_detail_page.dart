import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/components/teacher_detail_card.dart';

import '../../../data/models/teacher.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TeacherDetailCard(teacher: teacher)
            ],
          ),
        ),
      ),
    );
  }
}
