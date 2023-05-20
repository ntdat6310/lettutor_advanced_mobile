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

  void updateSearchKey({String searchKey = ''}) {
    this.searchKey = searchKey;
    _pagingController.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<Course> newItems =
          await _courseService.getListCourseWithSearchAndFilterAndPagination(
        searchKey: searchKey,
        page: pageKey,
        size: _pageSize,
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
