import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/specialties.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/specialties_controller.dart';

class SpecialityList extends StatelessWidget {
  SpecialityList({
    Key? key,
    required this.specialities,
    required this.onSelectSpecialty,
  }) : super(key: key);
  final List<Specialties> specialities;

  Function onSelectSpecialty;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: List.generate(
        specialities.length,
        (index) => InkWell(
          onTap: () {
            onSelectSpecialty(key: specialities[index].key);
          },
          child: Obx(() => Chip(
                label: Text(specialities[index].value,
                    style: TextStyle(
                        color: specialities[index].isSelected.value
                            ? Colors.white
                            : Colors.blueAccent)),
                labelStyle: const TextStyle(color: Colors.blue),
                backgroundColor: specialities[index].isSelected.value
                    ? Colors.blueAccent
                    : Colors.white,
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.blue.shade500)),
              )),
        ),
      ),
    );
  }
}
