// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../data/models/teacher/teacher.dart';
// import '../home/components/find_tutor.dart';
// import '../widgets/custom_appbar.dart';
// import '../widgets/custom_divider.dart';
// import '../widgets/custom_search_bar.dart';
// import 'components/speciality_list.dart';
// import 'components/teacher_card.dart';
// import 'teacher_controller.dart';
//
// class TeacherView extends GetView<TeacherController> {
//   TeacherView({Key? key}) : super(key: key);
//   final List<Teacher> teacherList = FakeData().getTeachers();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: 'Teachers',
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomSearchBar(
//                 onChanged: (String value) {
//                   print(value);
//                 },
//                 searchHint: 'Enter tutor\'s name',
//               ),
//               const SizedBox(height: 20),
//               const FindATutor(),
//               const SizedBox(height: 10),
//               const SpecialityList(specialities: [
//                 'All',
//                 'Kids',
//                 'STARTERS',
//                 'TOEFL',
//                 'Business',
//                 'STARTERS',
//                 'Conversational',
//                 'IELTS',
//                 'PET',
//                 'MOVERS',
//                 'KET'
//               ]),
//               const SizedBox(height: 10),
//               const CustomDivider(),
//               const SizedBox(height: 20),
//               Column(
//                 children: List.generate(teacherList.length,
//                         (index) => TeacherCard(teacher: teacherList[index])),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
