import 'package:flutter/material.dart';

import '../../../data/models/teacher/specialties.dart';

class SpecialityListHorizontal extends StatelessWidget {
  const SpecialityListHorizontal({Key? key, required this.specialities})
      : super(key: key);
  final List<Specialties> specialities;

  // List<String> formatInput(String input) {
  //   return input
  //       .split(',')
  //       .map((str) => str
  //           .split('-')
  //           .map((e) => e[0].toUpperCase() + e.substring(1))
  //           .join(' '))
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    // List<String> specialities = formatInput(specialitiesStr);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 5,
        children: List.generate(
          specialities.length,
          (index) => InkWell(
            onTap: () {},
            child: Chip(
              label: Text(specialities[index].value,
                  style: TextStyle(
                      color: specialities[index].isSelected.value
                          ? Colors.white
                          : Colors.blueAccent)),
              labelStyle: const TextStyle(color: Colors.blue),
              backgroundColor: specialities[index].isSelected.value
                  ? Colors.blueAccent
                  : Colors.white,
              shape:
                  StadiumBorder(side: BorderSide(color: Colors.blue.shade500)),
            ),
          ),
        ),
      ),
    );
  }
}
