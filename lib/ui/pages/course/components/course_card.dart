import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course_detail/CourseDetailPage.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course_lesson/course_lesson_page.dart';

import '../../../../data/models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course, required this.from}) : super(key: key);

  final String FROM_COURSE_PAGE = 'FROM_COURSE_PAGE';
  final String FROM_COURSE_DETAIL_PAGE = 'FROM_COURSE_DETAIL_PAGE';

  final String from;
  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(from == FROM_COURSE_PAGE){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CourseDetailPage(course: course,)));
        }
        else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CourseLesson(course: course,)));
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
