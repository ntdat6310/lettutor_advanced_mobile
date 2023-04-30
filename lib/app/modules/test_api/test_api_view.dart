import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'test_api_controller.dart';

class TestApiView extends GetView<TestApiController> {
  TestApiView({Key? key}) : super(key: key);

  final TestApiController c = Get.put(TestApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TestApiView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                //  Call API Here
                debugPrint("Button clicked...");
              },
              child: const Text(
                'Click here',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ));
  }
}
