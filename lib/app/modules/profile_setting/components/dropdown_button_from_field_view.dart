import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown_button_from_field_controller.dart';

class DropdownButtonFromFieldView extends StatelessWidget {
  DropdownButtonFromFieldView({Key? key}) : super(key: key);
  final _controller = Get.find<DropdownButtonFromFieldController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonFormField<String>(
      onChanged: (String? newValue) {
        _controller.setValue(value: newValue);
      },
      value: _controller.dropdownValue.value,
      icon: const Icon(Icons.arrow_drop_down),
      items: _controller.items,
      menuMaxHeight: 250,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
    ));
  }
}
