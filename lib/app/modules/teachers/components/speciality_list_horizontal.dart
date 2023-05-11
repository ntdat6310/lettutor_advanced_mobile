import 'package:flutter/material.dart';

class SpecialityListHorizontal extends StatelessWidget {
  const SpecialityListHorizontal({Key? key, required this.specialitiesStr})
      : super(key: key);
  final String specialitiesStr;

  List<String> formatInput(String input) {
    return input
        .split(',')
        .map((str) => str
            .split('-')
            .map((e) => e[0].toUpperCase() + e.substring(1))
            .join(' '))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> specialities = formatInput(specialitiesStr);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: List.generate(
          specialities.length,
          (index) => InkWell(
            onTap: () {},
            child: Chip(
              label: Text(specialities[index]),
              labelStyle: const TextStyle(color: Colors.blue),
              backgroundColor: Colors.white,
              shape:
                  StadiumBorder(side: BorderSide(color: Colors.blue.shade500)),
            ),
          ),
        ),
      ),
    );
  }
}
