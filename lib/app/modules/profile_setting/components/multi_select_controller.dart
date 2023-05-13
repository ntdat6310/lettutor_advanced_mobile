import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../data/models/profile/test_preparation.dart';

class MultiSelectController extends GetxController {
  final items = <MultiSelectItem<String>>[];
  final RxList<String> selectedItems = RxList<String>();

  void initOptions(List<TestPreparation> testPreparations) {
    items.addAll(testPreparations.map((item) {
      return MultiSelectItem<String>('${item.id}', item.name);
    }));
  }

  RxBool isValid = false.obs;
  void validate() {
    if (selectedItems.isEmpty) {
      isValid.value = false;
    } else {
      isValid.value = true;
    }
  }

  void updateSelectedItems(List<String> results) {
    selectedItems.value = results;
    validate();
  }
}
