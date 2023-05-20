import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/message_favorite_report_controller.dart';

import '../../../data/models/teacher/teacher.dart';

class MessageFavoriteReport extends StatelessWidget {
  MessageFavoriteReport({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  late final MessageFavoriteReportController controller =
      Get.put(MessageFavoriteReportController());

  void _onMessageButtonPressed() {}

  void _onFavoriteButtonPressed() {
    controller.toggleFavorite(teacherId: teacher.userId ?? '');
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
            Text(
              "message".tr,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
        Column(
          children: [
            Obx(() => IconButton(
                onPressed: _onFavoriteButtonPressed,
                icon: Icon(
                  teacher.isFavorite.value
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: Colors.blueAccent,
                  size: 36,
                ))),
            Text(
              "favorite".tr,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
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
            Text(
              "report".tr,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}
