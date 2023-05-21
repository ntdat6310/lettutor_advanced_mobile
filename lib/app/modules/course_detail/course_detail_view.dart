import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../data/models/course/course.dart';
import '../course/components/course_card.dart';
import '../widgets/custom_appbar.dart';
import 'components/list_topics.dart';
import 'course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({Key? key, required this.course}) : super(key: key);
  final Course course;

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

  void _onTopicClicked({required int selectedTopicIndex}) {
    Map<String, dynamic> arguments = {
      'course': course,
      'selectedTopicIndex': selectedTopicIndex,
    };
    Get.toNamed(Routes.COURSE_LESSON, arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "course_detail".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseCard(
              course: course,
            ),
            const SizedBox(height: 10),
            Text("overview".tr, style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.question_answer_rounded,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("why_take_this_course".tr, style: heading2Style),
              ],
            ),
            const SizedBox(height: 10),
            Text(course.whyTakeThisCourse ?? '', style: textStyle),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.question_answer_rounded,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("what_you_will_be_able_to_do".tr, style: heading2Style),
              ],
            ),
            const SizedBox(height: 10),
            Text(course.whatWillYouBeAbleToDo ?? '', style: textStyle),
            const SizedBox(height: 20),
            Text("experience_level".tr, style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.people,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text(course.level ?? '', style: textStyle),
              ],
            ),
            const SizedBox(height: 20),
            Text("course_length".tr, style: heading1Style),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.book,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Text("${course.topics?.length ?? '0'}", style: textStyle),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("list_topics".tr, style: heading1Style),
                TextButton(
                    onPressed: () {
                      Map<String, dynamic> arguments = {
                        'course': course,
                        'selectedTopicIndex': 0,
                      };
                      Get.toNamed(Routes.COURSE_LESSON, arguments: arguments);
                    },
                    child: Text("see_detail".tr, style: const TextStyle(fontSize: 16),)),
              ],
            ),
            const SizedBox(height: 20),
            ListTopics(
              topics: course.topics ?? [],
              style: heading2Style,
              onTap: _onTopicClicked,
            ),
          ],
        ),
      ),
    );
  }
}
