import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course/components/course_card.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course/components/custom_dropdown.dart';

import '../../../data/models/course.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_search_bar.dart';

class CoursePage extends StatelessWidget {
  CoursePage({Key? key}) : super(key: key);

  final List<Course> courses = FakeData().getCourses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Courses',
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
                      onChanged: (value) {
                        print(value);
                      },
                      searchHint: 'Enter course name'),
                  const SizedBox(height: 20),
                  const Text(
                    "Filter courses",
                    style: TextStyle(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        courses.length,
                        (index) => CourseCard(
                              course: courses[index],
                              from: 'FROM_COURSE_PAGE',
                            )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
