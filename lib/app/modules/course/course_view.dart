import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor_advanced_mobile/app/core/constants/constants.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course.dart';
import 'package:lettutor_advanced_mobile/app/modules/widgets/no_data_found.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_search_bar.dart';
import 'components/course_card.dart';
import 'components/custom_dropdown.dart';
import 'course_controller.dart';

class CourseView extends StatelessWidget {
  CourseView({Key? key}) : super(key: key);

  final CourseController _courseController = Get.put(CourseController());
  void _onSearchSubmitted(String value) {
    _courseController.updateSearchKey(searchKey: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'courses'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomSearchBar(
                    initValue: _courseController.searchKey,
                    onChanged: (value) {},
                    onSubmit: _onSearchSubmitted,
                    searchHint: 'enter_course_name'.tr),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "filter_courses".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => CustomDropdown(
                        dropdownItems: Constants.courseLevelMap,
                        selectedKey: _courseController.selectedLevelKey.value,
                        onSelectedChange: _courseController.updateFilterLevel,
                      ),
                    ),
                    Obx(
                      () => CustomDropdown(
                        dropdownItems: _courseController.categoryMap,
                        selectedKey: _courseController.selectedCategoryId.value,
                        onSelectedChange:
                            _courseController.updateFilterCategory,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: PagedSliverList<int, Course>(
                pagingController: _courseController.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Course>(
                  itemBuilder: (context, course, index) => CourseCard(
                    course: course,
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
