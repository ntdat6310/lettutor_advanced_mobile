import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';

class DropdownButtonFromFieldController extends GetxController {
  final items =
      Constants.countriesMap.entries.map<DropdownMenuItem<String>>((country) {
    return DropdownMenuItem<String>(
      value: country.key,
      child: Text(country.value),
    );
  }).toList();

  RxString dropdownValue = 'VN'.obs;

  void setValue({String? value}) {
    if (value != null) {
      dropdownValue.value = value;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
