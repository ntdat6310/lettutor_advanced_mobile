import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/data/fake_data.dart';
import 'package:lettutor_advanced_mobile/data/models/course.dart';
import 'package:lettutor_advanced_mobile/ui/pages/course/components/course_card.dart';
import 'package:lettutor_advanced_mobile/ui/widgets/custom_appbar.dart';

import 'components/list_topics.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key, required this.course}) : super(key: key);
  final Course course;

  // CourseDetailPage({Key? key}) : super(key: key);
  // Course course = FakeData().getCourses()[0];

  final TextStyle heading1Style = const TextStyle(
    fontSize: 20,
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
  );

  final TextStyle heading2Style = const TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Course Detail"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseCard(course: course, from: 'COURSE_DETAIL_PAGE',),
            const SizedBox(height: 10),
            Text("Overview", style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.question_answer_rounded,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("Why take this course?", style: heading2Style),
              ],
            ),
            const SizedBox(height: 10),
            Text(course.whyTakeThisCourse, style: textStyle),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.question_answer_rounded,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("What you will be able to do?", style: heading2Style),
              ],
            ),
            const SizedBox(height: 10),
            Text(course.whatWillYouBeAbleToDo, style: textStyle),
            const SizedBox(height: 20),
            Text("Experience Level", style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.people,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text(course.level, style: textStyle),
              ],
            ),
            const SizedBox(height: 20),
            Text("Course Length", style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.book,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("${course.topics.length}", style: textStyle),
              ],
            ),
            const SizedBox(height: 20),
            Text("List Topics", style: heading1Style),
            const SizedBox(height: 20),
            ListTopics(topics: course.topics, style: heading2Style,),
          ],
        ),
      ),
    );
  }
}
