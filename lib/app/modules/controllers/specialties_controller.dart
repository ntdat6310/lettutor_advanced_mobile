import 'package:get/get.dart';

import '../../core/constants/constants.dart';
import '../../data/models/teacher/specialties.dart';

class SpecialtiesController extends GetxController {
  final Map<String, String> specialtiesMap = Constants.specialties;
  final List<Specialties> specialtiesList = [];

  @override
  void onInit() {
    super.onInit();
    initSpecialtiesList();
  }

  void initSpecialtiesList() {
    specialtiesMap.forEach((key, value) {
      specialtiesList.add(Specialties(key: key, value: value));
    });
  }

  List<Specialties> getSpecialtiesListTeacherCard(
      List<String> specialtiesOfTeacher) {
    List<String> copySpecialtiesOfTeacher = [...specialtiesOfTeacher];
    List<Specialties> results = [];
    for (Specialties specialty in specialtiesList) {
      if (copySpecialtiesOfTeacher.contains(specialty.key)) {
        copySpecialtiesOfTeacher.remove(specialty.key);
        if (specialty.isSelected.value) {
          results.add(Specialties(
              key: specialty.key, value: specialty.value, isSelected: true));
        } else {
          results.add(Specialties(key: specialty.key, value: specialty.value));
        }
      }
    }

    for (String specialtyKey in copySpecialtiesOfTeacher){
      results.add(Specialties(key: specialtyKey, value: specialtyKey));
    }

    return results;
  }

  void selectItem(String key) {
    if (key == 'all') {
      for (Specialties specialty in specialtiesList) {
        if (specialty.key == 'all') {
          specialty.isSelected.value = true;
        } else {
          specialty.isSelected.value = false;
        }
      }
    } else {
      for (Specialties specialty in specialtiesList) {
        if (specialty.key == key) {
          specialty.isSelected.value = !specialty.isSelected.value;
        }
        if (specialty.key == 'all') {
          specialty.isSelected.value = false;
        }
      }
    }
  }

  List<String> getSelectedSpecialties() {
    List<String> selectedSpecialties = [];

    for (Specialties specialty in specialtiesList) {
      if (specialty.isSelected.value == true) {
        selectedSpecialties.add(specialty.key);
      }
    }

    if (selectedSpecialties.contains("all")) {
      selectedSpecialties.clear();
    }

    return selectedSpecialties;
  }
}
