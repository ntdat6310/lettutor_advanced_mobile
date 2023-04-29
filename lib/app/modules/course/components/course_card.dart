import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course, required this.from})
      : super(key: key);

  final String FROM_COURSE_PAGE = 'FROM_COURSE_PAGE';
  final String FROM_COURSE_DETAIL_PAGE = 'FROM_COURSE_DETAIL_PAGE';

  final String from;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (from == FROM_COURSE_PAGE) {
          Get.toNamed(Routes.COURSE_DETAIL, arguments: {'course': course});
        } else {
          Get.toNamed(Routes.COURSE_LESSON, arguments: {'course': course});
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    course.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      course.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(course.shortDesc),
                    const SizedBox(height: 8),
                    // const Text("Beginner - 5 lessons"),
                    Text("${course.level} - ${course.topics.length} lessons"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
