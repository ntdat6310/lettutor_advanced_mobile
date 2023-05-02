// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';
//
// import '../../../data/models/schedule.dart';
//
// class ScheduleCard extends StatelessWidget {
//   const ScheduleCard({Key? key, required this.schedule}) : super(key: key);
//
//   final Schedule schedule;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       child: Card(
//         elevation: 5,
//         shadowColor: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/images/avatar.jpg')),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         schedule.teacher.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             DateFormat('EEE, M/d/y').format(schedule.fromTime),
//                             style: const TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 border: Border.all(
//                                   color: Colors.blue,
//                                   width: 1,
//                                 )),
//                             child: Text(
//                               "${DateFormat('kk-mm').format(schedule.fromTime)} - ${DateFormat('kk-mm').format(schedule.toTime)}",
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.red,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       ),
//                       onPressed: () {
//                         // TODO: add button press logic here
//                       },
//                       child: const Text('Cancel'),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       ),
//                       onPressed: () {
//                         Get.toNamed(Routes.MEETING_VIDEO_CONFERENCE);
//                       },
//                       child: const Text('Go to Meeting'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }