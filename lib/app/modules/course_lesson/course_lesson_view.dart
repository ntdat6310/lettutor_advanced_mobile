// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// import 'package:get/get.dart';
//
// import '../../data/models/course/course.dart';
// import '../widgets/custom_appbar.dart';
// import 'course_lesson_controller.dart';
//
// class CourseLessonView extends GetView<CourseLessonController> {
//   CourseLessonView({Key? key}) : super(key: key);
//
//   final Course course = Get.arguments['course'];
//   final CourseLessonController c = Get.put(CourseLessonController());
//
//   final TextStyle headingStyle = const TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//   );
//
//   final TextStyle textStyle = const TextStyle(
//     fontSize: 18,
//     color: Colors.black,
//   );
//
//   Widget _buildTopicItem(int index) {
//     final topic = course.topics[index];
//     return GestureDetector(
//       onTap: () {
//         c.onTopicSelected(index);
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: c.selectedTopicIndex == index
//               ? Border.all(
//                   color: Colors.blueAccent, width: 2, style: BorderStyle.solid)
//               : Border.all(
//                   color: Colors.transparent,
//                   width: 2,
//                   style: BorderStyle.solid),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "${index + 1}",
//               style: textStyle,
//             ),
//             const SizedBox(width: 10),
//             Text(
//               topic['topic']!,
//               style: textStyle,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(title: "Course Lesson"),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         scrollDirection: Axis.vertical,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//                 child: Image.network(
//                   course.imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(course.name, style: headingStyle),
//             const SizedBox(height: 10),
//             Text(course.description, style: textStyle),
//             const SizedBox(height: 20),
//             Text("List Topics", style: headingStyle),
//             const SizedBox(height: 20),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: List.generate(course.topics.length, (index) {
//                 return _buildTopicItem(index);
//               }),
//             ),
//             if (c.selectedTopicIndex >= 0)
//               SizedBox(
//                 width: double.infinity,
//                 height: 500,
//                 child: PDFView(
//                   filePath: "https://www.orimi.com/pdf-test.pdf",
//                   enableSwipe: true,
//                   swipeHorizontal: true,
//                   autoSpacing: false,
//                   pageSnap: false,
//                   pageFling: false,
//                   onRender: (_pages) {},
//                   onError: (error) {
//                     print(error.toString());
//                   },
//                   onPageError: (page, error) {
//                     print('$page: ${error.toString()}');
//                   },
//                   onViewCreated: (PDFViewController pdfViewController) {},
//                   onPageChanged: (int? page, int? total) {},
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
