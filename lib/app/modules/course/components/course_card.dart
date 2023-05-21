import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/course_detail/course_detail_view.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/course/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course}) : super(key: key);
  final Course course;

  void _onCourseCardTap() {
    Get.toNamed(Routes.COURSE_DETAIL,
        arguments: CourseDetailView(course: course));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onCourseCardTap,
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
                    course.imageUrl ?? '',
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
                      course.name ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(course.description ?? ''),
                    const SizedBox(height: 8),
                    Text(
                        "${course.level} - ${course.topics != null ? course.topics!.length : '0'} ${"lessons".tr}"),
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
