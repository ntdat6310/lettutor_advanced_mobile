import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/multi_select_controller.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

class MultiSelectView extends StatelessWidget {
  MultiSelectView({Key? key}) : super(key: key);
  final controller = Get.find<MultiSelectController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => MultiSelectDialogField(
              items: controller.items,
              title: const Text("Select Options"),
              selectedColor: Colors.blue,
              initialValue: controller.selectedItems.value,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              buttonIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              onConfirm: (results) {
                controller.updateSelectedItems(results);
              },
            )),
        Obx(() => Visibility(
            visible: controller.isValid.value == false,
            child: const Text(
              'Please select at least one option.',
              style: TextStyle(
                color: Colors.red,
              ),
            ))),
      ],
    );
  }
}
