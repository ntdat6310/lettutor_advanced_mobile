import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'teacher_controller.dart';

class TeacherView extends GetView<TeacherController> {
  const TeacherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeacherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
