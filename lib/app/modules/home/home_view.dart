import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/chat_with_ai/components/loading.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_toggle_favorite_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_controller.dart';

import '../teachers/components/speciality_list.dart';
import '../teachers/components/teacher_card.dart';
import '../widgets/custom_appbar.dart';
import 'components/find_tutor.dart';
import 'components/recommended_tutor.dart';
import 'components/upcomming_lesson.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());
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
                    Obx(() {
                      if (_homeController
                          .teacherController.isLoadingTeachers.value) {
                        return LoadingWidget(
                          isLoading: _homeController
                              .teacherController.isLoadingTeachers.value,
                          color: Colors.blueAccent,
                        );
                      } else {
                        final TeacherToggleFavoriteController teacherCardController =
                            Get.put<TeacherToggleFavoriteController>(
                                TeacherToggleFavoriteController());
                        return Column(
                          children: List.generate(
                              _homeController.teacherController.teachers.length,
                              (index) => TeacherCard(
                                    teacher: _homeController
                                        .teacherController.teachers[index],
                                    teacherCardController:
                                        teacherCardController,
                                  )),
                        );
                      }
                    }),
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
