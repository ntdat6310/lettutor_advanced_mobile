import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/date_picker_controller.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({Key? key}) : super(key: key);

  final CustomDatePickerController controller =
      Get.put<CustomDatePickerController>(CustomDatePickerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          hintText:
              DateFormat('dd - MM - yyyy').format(controller.selectedDate.value),
          suffixIcon: Icon(Icons.calendar_today, color: Colors.blue[300]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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
        onTap: () {
          controller.selectDate(context);
        },
      ),
    );
  }
}
