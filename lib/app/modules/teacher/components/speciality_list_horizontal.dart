import 'package:flutter/material.dart';

class SpecialityListHorizontal extends StatelessWidget {
  const SpecialityListHorizontal({Key? key, required this.specialities})
      : super(key: key);
  final List<String> specialities;

  @override
  Widget build(BuildContext context) {
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
