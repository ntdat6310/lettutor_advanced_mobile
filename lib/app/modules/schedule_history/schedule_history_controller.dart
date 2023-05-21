import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/schedule/schedule.dart';
import '../../data/services/schedule_service.dart';

class ScheduleHistoryController extends GetxController {
  static const _pageSize = 4;
  final scheduleService = Get.put<ScheduleService>(ScheduleService());
  final PagingController<int, Schedule> _pagingController =
  PagingController(firstPageKey: 1);
  PagingController<int, Schedule> get pagingController => _pagingController;

  @override
  void onInit() async {
    super.onInit();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await scheduleService.getHistorySchedules(
        page: pageKey,
        perPage: _pageSize,
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
