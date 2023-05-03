import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/no_data_found.dart';

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
                initValue: c.searchKeyForTeachers,
                onChanged: (String value) {
                  print(value);
                },
                onSubmit: (String value) {
                  // Handle search here
                  debugPrint("TeacherView CustomSearchBar OnSubmit $value");
                  c.searchTeachers(searchKey: value);
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
              Obx(() {
                if (c.isLoadingTeachers.value) {
                  return const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  );
                } else if (c.teachers.isEmpty) {
                  return const NoDataFound();
                } else {
                  return Column(
                    children: List.generate(
                        c.teachers.length,
                        (index) => TeacherCard(
                              teacherId: c.teachers[index].userId ?? '',
                            )),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
