// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../../data/fake_data.dart';
// import '../../data/models/course/course.dart';
// import '../widgets/custom_appbar.dart';
// import '../widgets/custom_search_bar.dart';
// import 'components/course_card.dart';
// import 'components/custom_dropdown.dart';
// import 'course_controller.dart';
//
// class CourseView extends GetView<CourseController> {
//   CourseView({Key? key}) : super(key: key);
//
//   final List<Course> courses = FakeData().getCourses();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Courses',
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomSearchBar(
//                       onChanged: (value) {
//                         print(value);
//                       },
//                       searchHint: 'Enter course name'),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Filter courses",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       CustomDropdown(
//                         dropdownItems: [
//                           "Select Level",
//                           'Beginner',
//                           'Upper-Beginner',
//                           'Pre-Intermediate',
//                           'Intermediate',
//                           'Upper-Intermediate',
//                           'Pre-advanced',
//                           'Advanced',
//                           'Very advanced',
//                         ],
//                         dropdownValue: "Select Level",
//                       ),
//                       CustomDropdown(
//                         dropdownItems: [
//                           'Select Category',
//                           'For Studying Abroad',
//                           'English For Traveling',
//                           'Conversational English',
//                           'English For Beginners',
//                           'Business English',
//                           'STARTERS',
//                           'English For Kid',
//                           'PET',
//                           'KET',
//                           'MOVERS',
//                           'FLYERS',
//                           'TOEFL',
//                           'TOEIC',
//                           'IELTS',
//                         ],
//                         dropdownValue: "Select Category",
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: List.generate(
//                         courses.length,
//                             (index) => CourseCard(
//                           course: courses[index],
//                           from: 'FROM_COURSE_PAGE',
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
