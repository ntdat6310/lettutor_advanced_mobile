import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/ui/pages/home/components/find_tutor.dart';
import 'package:lettutor_advanced_mobile/ui/pages/home/components/recommended_tutor.dart';
import 'package:lettutor_advanced_mobile/ui/pages/home/components/upcomming_lesson.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/components/speciality_list.dart';
import 'package:lettutor_advanced_mobile/ui/pages/teacher/components/teacher_card.dart';
import 'package:lettutor_advanced_mobile/ui/widgets/custom_appbar.dart';

import '../../../data/models/teacher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Teacher> teacherList = FakeData().getTeachers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      body: ListView(
        children: [
          const UpcomingLesson(),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                const FindATutor(),
                const SizedBox(height: 10),
                const SpecialityList(specialities: [
                  'All',
                  'Kids',
                  'STARTERS',
                  'TOEFL',
                  'Business',
                  'STARTERS',
                  'Conversational',
                  'IELTS',
                  'PET',
                  'MOVERS',
                  'KET'
                ]),
                const RecommendedTutor(),
                Column(
                  children: List.generate(teacherList.length,
                      (index) => TeacherCard(teacher: teacherList[index])),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
