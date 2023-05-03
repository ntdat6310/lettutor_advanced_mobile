import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher/teacher_controller.dart';

class MessageFavoriteReport extends StatelessWidget {
  MessageFavoriteReport({Key? key, required this.teacherId}) : super(key: key);
  final String teacherId;
  final TeacherController _teacherController = Get.find();

  void _onMessageButtonPressed() {}
  void _onFavoriteButtonPressed() {
    _teacherController.toggleFavoriteTeacher(teacherId);
  }

  void _onReportButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: _onMessageButtonPressed,
                icon: const Icon(
                  Icons.message_outlined,
                  color: Colors.blueAccent,
                  size: 36,
                )),
            const Text(
              "Message",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
        Column(
          children: [
            Obx(() => IconButton(
                onPressed: _onFavoriteButtonPressed,
                icon: Icon(
                  _teacherController.getTeacherById(id: teacherId)!.isFavorite.value
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: Colors.blueAccent,
                  size: 36,
                ))),
            const Text(
              "Favorite",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: _onReportButtonPressed,
                icon: const Icon(
                  Icons.report_outlined,
                  color: Colors.blueAccent,
                  size: 36,
                )),
            const Text(
              "Report",
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
