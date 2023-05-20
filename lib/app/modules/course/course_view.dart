import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/no_data_found.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_search_bar.dart';
import 'components/course_card.dart';
import 'components/custom_dropdown.dart';
import 'course_controller.dart';

class CourseView extends StatelessWidget {
  CourseView({Key? key}) : super(key: key);

  final CourseController _courseController = Get.put(CourseController());
  void _onSearchSubmitted(String value) {
    _courseController.searchCourses(searchKey: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'courses'.tr,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(
                      initValue: _courseController.searchKey,
                      onChanged: (value) {},
                      onSubmit: _onSearchSubmitted,
                      searchHint: 'enter_course_name'.tr),
                  const SizedBox(height: 20),
                  Text(
                    "filter_courses".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomDropdown(
                        dropdownItems: [
                          "Select Level",
                          'Beginner',
                          'Upper-Beginner',
                          'Pre-Intermediate',
                          'Intermediate',
                          'Upper-Intermediate',
                          'Pre-advanced',
                          'Advanced',
                          'Very advanced',
                        ],
                        dropdownValue: "Select Level",
                      ),
                      CustomDropdown(
                        dropdownItems: [
                          'Select Category',
                          'For Studying Abroad',
                          'English For Traveling',
                          'Conversational English',
                          'English For Beginners',
                          'Business English',
                          'STARTERS',
                          'English For Kid',
                          'PET',
                          'KET',
                          'MOVERS',
                          'FLYERS',
                          'TOEFL',
                          'TOEIC',
                          'IELTS',
                        ],
                        dropdownValue: "Select Category",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (_courseController.isLoading.value) {
                      return const CircularProgressIndicator(
                          color: Colors.blueAccent);
                    } else if (_courseController.courses.isEmpty) {
                      return const NoDataFound();
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            _courseController.courses.length,
                            (index) => CourseCard(
                                  course: _courseController.courses[index],
                                )),
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
