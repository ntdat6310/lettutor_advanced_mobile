import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lettutor_advanced_mobile/app/data/services/schedule_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/profile_setting/components/custom_text_field.dart';

import '../../data/models/schedule/cancel_reason.dart';
import '../../data/models/schedule/schedule.dart';

class ScheduleController extends GetxController {
  static const _pageSize = 4;
  final scheduleService = Get.put<ScheduleService>(ScheduleService());
  final PagingController<int, Schedule> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, Schedule> get pagingController => _pagingController;
  List<CancelReason> cancelReasons = [];
  final cancelReasonController = TextEditingController();
  Rx<CancelReason?> selectedCancelReason = Rx<CancelReason?>(null);

  @override
  void onInit() async {
    super.onInit();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    cancelReasons = await scheduleService.getCancelReasons();
  }

  Future<void> cancelBooking({
    required int cancelReasonId,
    required String note,
    required Schedule schedule,
  }) async {
    bool cancelBookingResult = await scheduleService.cancelBooking(
      id: schedule.id!,
      cancelReasonId: cancelReasonId,
      note: note,
    );
    if (cancelBookingResult) {
      List<Schedule> newItemsList =
          List<Schedule>.from(_pagingController.itemList!);
      newItemsList.remove(schedule);

      _pagingController.itemList = newItemsList;

      Get.snackbar("Cancel Booking Successfully", '',
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar("Cancel Booking Failed", '',
          duration: const Duration(seconds: 2));
    }
  }

  void showCancelDialog(Schedule schedule) {
    selectedCancelReason.value = cancelReasons[0];

    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What was the reason you cancel this booking?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      width: 1), // set border color and width
                  borderRadius: BorderRadius.circular(4), // set border radius
                ),
                child: Obx(() => DropdownButton<CancelReason>(
                      items: cancelReasons.map((cancelReasonItem) {
                        return DropdownMenuItem<CancelReason>(
                          value: cancelReasonItem,
                          child: Text("  ${cancelReasonItem.reason}"),
                        );
                      }).toList(),
                      value: selectedCancelReason.value,
                      underline: const SizedBox.shrink(),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(4),
                      onChanged: (newCancelReasonItem) {
                        if (newCancelReasonItem != null) {
                          selectedCancelReason.value = newCancelReasonItem;
                        }
                      },
                    )),
              ),
              CustomTextField(
                textEditingController: cancelReasonController,
                hintText: 'Additional notes:',
                minLines: 3,
                maxLines: 10,
                topSpacing: 0,
                bottomSpacing: 8,
                fontSize: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cancelReasonController.clear();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                    ),
                    child: const Text('Later'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      cancelBooking(
                        cancelReasonId: selectedCancelReason.value!.id,
                        note: cancelReasonController.text,
                        schedule: schedule,
                      );
                      cancelReasonController.clear();
                      Get.back();
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      debugPrint("PAGEKEY: $pageKey");
      final newItems = await scheduleService.getAllSchedules(
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
    cancelReasonController.dispose();
    super.onClose();
  }
}
