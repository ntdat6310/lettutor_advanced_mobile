import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../data/models/course/course.dart';
import '../widgets/custom_appbar.dart';
import 'course_lesson_controller.dart';

class CourseLessonView extends GetView<CourseLessonController> {
  const CourseLessonView({
    Key? key,
    required this.course,
    this.selectedTopicIndex = 0,
  }) : super(key: key);

  final Course course;
  final int selectedTopicIndex;

  final TextStyle headingStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final TextStyle textStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  Widget _buildTopicItem(int index) {
    final topic = course.topics![index];
    return Obx(() => GestureDetector(
          onTap: () {
            controller.onTopicSelected(index: index, fileUrl: topic.nameFile!);
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: controller.selectedTopicIndex.value == index
                  ? Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                      style: BorderStyle.solid)
                  : Border.all(
                      color: Colors.transparent,
                      width: 2,
                      style: BorderStyle.solid),
            ),
            child: Text(
              "${index + 1}. ${topic.name}",
              style: textStyle,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    controller.setInitValue(index: selectedTopicIndex, fileUrl: course.topics![selectedTopicIndex].nameFile!);
    return Scaffold(
      appBar: CustomAppBar(title: "course_lesson".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  course.imageUrl ??
                      'https://www.edugators.com/includes/images/courses/default.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(course.name ?? '', style: headingStyle),
            const SizedBox(height: 10),
            Text(course.description ?? '', style: textStyle),
            const SizedBox(height: 20),
            Text("list_topics".tr, style: headingStyle),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(course.topics?.length ?? 0, (index) {
                return _buildTopicItem(index);
              }),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.fileUrlToShow.isNotEmpty) {
                return SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: SfPdfViewer.network(
                    controller.fileUrlToShow.value,
                    controller: controller.pdfViewerController,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
