import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {Key? key,
      required this.dropdownItems,
      this.selectedKey,
      required this.onSelectedChange})
      : super(key: key);
  final Map<String, String> dropdownItems;
  final String? selectedKey;
  final void Function({String? newValue}) onSelectedChange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            width: 1.3,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedKey,
          menuMaxHeight: 200,
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onSelectedChange(newValue: newValue);
            }
          },
          items: dropdownItems.entries.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item.key,
              child: Text(item.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
