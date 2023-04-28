import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/modules/home/components/find_tutor.dart';
import 'package:lettutor_advanced_mobile/modules/widgets/custom_appbar.dart';
import 'package:lettutor_advanced_mobile/modules/widgets/custom_divider.dart';
import 'package:lettutor_advanced_mobile/modules/widgets/custom_search_bar.dart';

import '../../../data/fake_data.dart';
import '../../../data/models/teacher.dart';
import 'components/speciality_list.dart';
import 'components/teacher_card.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  final List<Teacher> teacherList = FakeData().getTeachers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Teachers',
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomSearchBar(
                onChanged: (String value) {
                  print(value);
                },
                searchHint: 'Enter tutor\'s name',
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              const CustomDivider(),
              const SizedBox(height: 20),
              Column(
                children: List.generate(teacherList.length,
                    (index) => TeacherCard(teacher: teacherList[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
