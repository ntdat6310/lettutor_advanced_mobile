import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/teacher.dart';
import 'package:lettutor_advanced_mobile/app/modules/course/components/custom_dropdown.dart';

import '../../core/constants/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_search_bar.dart';
import 'components/speciality_list.dart';
import 'components/teacher_card.dart';
import 'teachers_controller.dart';

class TeachersView extends GetView<TeachersController> {
  TeachersView({Key? key}) : super(key: key);
  final TeachersController _teachersController =
      Get.put<TeachersController>(TeachersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'teachers'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomSearchBar(
                  initValue: _teachersController.searchKey,
                  onChanged: (String value) {},
                  onSubmit: (String value) {
                    _teachersController.updateSearch(newValue: value);
                  },
                  searchHint: 'enter_tutor_name'.tr,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'find_a_tutor'.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Obx(() => CustomDropdown(
                          dropdownItems: Constants.nationalityMap,
                          onSelectedChange:
                              _teachersController.updateNationality,
                          selectedKey: _teachersController.nationalityKey.value,
                        )),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SpecialityList(
                    specialities: _teachersController
                        .specialtiesController.specialtiesList,
                    onSelectSpecialty: _teachersController.updateSpecialty),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CustomDivider(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: PagedSliverList<int, Teacher>(
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Teacher>(
                  itemBuilder: (context, teacher, index) => TeacherCard(
                    teacher: teacher,
                    specialtiesController:
                        _teachersController.specialtiesController,
                    teacherService: _teachersController.teacherService,
                    toggleFavorite: _teachersController.toggleFavorite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
