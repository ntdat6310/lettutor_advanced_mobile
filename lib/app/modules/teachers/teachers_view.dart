import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_toggle_favorite_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/no_data_found.dart';

import '../home/components/find_tutor.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_search_bar.dart';
import 'components/speciality_list.dart';
import 'components/teacher_card.dart';
import 'teachers_controller.dart';

class TeachersView extends GetView<TeachersController> {
  TeachersView({Key? key}) : super(key: key);
  final TeachersController _teachersController =
      Get.put<TeachersController>(TeachersController());
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
                initValue: _teachersController.searchKeyForTeachers,
                onChanged: (String value) {},
                onSubmit: (String value) {
                  // Handle search here
                  _teachersController.teacherController
                      .searchTeachers(searchKey: value);
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
                if (_teachersController
                    .teacherController.isLoadingTeachers.value) {
                  return const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  );
                } else if (_teachersController
                    .teacherController.teachers.isEmpty) {
                  return const NoDataFound();
                } else {
                  final TeacherToggleFavoriteController teacherCardController =
                      Get.put<TeacherToggleFavoriteController>(TeacherToggleFavoriteController());
                  return Column(
                    children: List.generate(
                        _teachersController.teacherController.teachers.length,
                        (index) => TeacherCard(
                              teacher: _teachersController
                                  .teacherController.teachers[index],
                              teacherCardController: teacherCardController,
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
