import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../teacher/components/speciality_list.dart';
import '../teacher/components/teacher_card.dart';
import '../widgets/custom_appbar.dart';
import 'components/find_tutor.dart';
import 'components/recommended_tutor.dart';
import 'components/upcomming_lesson.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Home",
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: UpcomingLesson(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
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
                    const RecommendedTutor(),
                    Obx(() => Column(
                          children: List.generate(
                              c.teacherController.teachers.value.length,
                              (index) => TeacherCard(
                                    teacherId: c.teacherController.teachers
                                        .value[index].userId!,
                                    isFavoriteTeacherList: true,
                                  )),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
