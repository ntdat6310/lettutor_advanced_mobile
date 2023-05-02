import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/components/find_tutor.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_search_bar.dart';
import 'components/speciality_list.dart';
import 'components/teacher_card.dart';
import 'teacher_controller.dart';

class TeacherView extends GetView<TeacherController> {
  TeacherView({Key? key}) : super(key: key);

  final TeacherController c = Get.find();

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
                'Starters',
                'Toefl',
                'Business',
                'Starters',
                'Conversational',
                'Ielts',
                'Pet',
                'Movers',
                'Ket'
              ]),
              const SizedBox(height: 10),
              const CustomDivider(),
              const SizedBox(height: 20),
              Obx(() => Column(
                children: List.generate(
                    c.teachers.length,
                        (index) => TeacherCard(
                      teacherId: c.teachers[index].userId ?? '',
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
