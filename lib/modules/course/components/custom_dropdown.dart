import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final String dropdownValue;

  const CustomDropdown(
      {Key? key, required this.dropdownItems, required this.dropdownValue})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValue;
  }

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
          value: dropdownValue,
          menuMaxHeight: 200,
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      )
      ,
    );
  }
}
