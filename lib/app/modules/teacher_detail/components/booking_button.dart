import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/services/schedule_service.dart';
import 'package:lettutor_advanced_mobile/app/routes/app_pages.dart';

import '../../../data/models/teacher/teacher.dart';

class BookingButton extends StatelessWidget {
  BookingButton({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(Routes.BOOKING_SCHEDULE, arguments: teacher);
        },
        style: style,
        child: const Text("Booking"),
      ),
    );
  }
}
