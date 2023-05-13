import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDatePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void setValue({required DateTime newDate}) {
    selectedDate.value = newDate;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1950, 1),
      lastDate: DateTime(2100, 1),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      debugPrint("SELECT DATE: $picked");
    }
  }
}
