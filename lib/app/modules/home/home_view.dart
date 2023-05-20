import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/teacher_toggle_favorite_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/home/home_controller.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/upcomming/upcoming_view.dart';

import '../teachers/components/speciality_list.dart';
import '../teachers/components/teacher_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/no_data_found.dart';
import 'components/find_tutor.dart';
import 'components/recommended_tutor.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "home".tr,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: UpcomingView(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                    const FindATutor(),
                    const SizedBox(height: 10),
                    SpecialityList(
                        specialities: _homeController
                            .specialtiesController.specialtiesList,
                        onSelectSpecialty: _homeController.selectSpecialty),
                    const RecommendedTutor(),
                    Obx(() {
                      if (_homeController
                          .teacherController.isLoadingTeachers.value) {
                        return const CircularProgressIndicator(
                          color: Colors.blueAccent,
                        );
                      } else if (_homeController
                          .teacherController.teachers.isEmpty) {
                        return const NoDataFound();
                      } else {
                        final TeacherToggleFavoriteController
                            teacherCardController =
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
                                    specialtiesController:
                                        _homeController.specialtiesController,
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
