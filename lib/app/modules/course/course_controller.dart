import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor_advanced_mobile/app/data/services/course_service.dart';

import '../../data/models/course/course.dart';

class CourseController extends GetxController {
  static const _pageSize = 4;
  final PagingController<int, Course> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, Course> get pagingController => _pagingController;

  final CourseService _courseService = Get.put(CourseService());
  String searchKey = '';
  RxString selectedLevelKey = '0'.obs;
  Rx<String?> selectedCategoryId = ''.obs;
  Map<String, String> categoryMap = {};

  void updateSearchKey({String searchKey = ''}) {
    this.searchKey = searchKey;
    _pagingController.refresh();
  }

  void updateFilterLevel({String? newValue}) {
    if (newValue != null) {
      selectedLevelKey.value = newValue;
    }
    _pagingController.refresh();
  }

  void updateFilterCategory({String? newValue}) {
    if (newValue != null) {
      selectedCategoryId.value = newValue;
    }
    _pagingController.refresh();
  }

  @override
  void onInit() async {
    super.onInit();
    categoryMap = await _courseService.getCourseCategory();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<Course> newItems =
          await _courseService.getListCourseWithSearchAndFilterAndPagination(
        page: pageKey,
        size: _pageSize,
        searchKey: searchKey,
        levelKey: selectedLevelKey.value,
        categoryId: selectedCategoryId.value,
      );

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void onClose() {
    _pagingController.dispose();
    super.onClose();
  }
}
