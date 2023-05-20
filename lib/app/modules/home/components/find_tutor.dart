import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FindATutor extends StatelessWidget {
  const FindATutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "find_a_tutor".tr,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
