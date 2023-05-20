import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/data/models/schedule/schedule_booking.dart';
import 'package:lettutor_advanced_mobile/app/data/services/schedule_service.dart';
import 'package:lettutor_advanced_mobile/app/modules/controllers/wallet_controller.dart';

import '../../data/models/schedule/daily_schedule_booking.dart';
import '../../data/models/teacher/teacher.dart';
import '../profile_setting/components/custom_text_field.dart';

class BookingScheduleController extends GetxController {
  late final Teacher teacher;
  final ScheduleService scheduleService = Get.put(ScheduleService());
  late final RxList<DailyScheduleBooking> dailyScheduleBookings =
      RxList<DailyScheduleBooking>();
  final RxBool isLoading = true.obs;
  final WalletController walletController = Get.put(WalletController());
  final noteController = TextEditingController();
  BookingScheduleController({required this.teacher});

  @override
  void onInit() async {
    super.onInit();
    dailyScheduleBookings.value =
        await scheduleService.getSchedulesToBookByTutorId(
      tutorId: teacher.userId!,
      startDay: '17-05-2023',
      endDay: '30-05-2023',
    );
    isLoading.value = false;
  }

  Future<void> bookASchedule({
    required ScheduleBooking scheduleBooking,
    String note = '',
  }) async {
    bool result = await scheduleService.bookASchedule(
      scheduleDetailId: scheduleBooking.scheduleDetailId!,
      note: note,
    );
    if (result) {
      scheduleBooking.isBooked.value = !scheduleBooking.isBooked.value;
      walletController.fetchWallet();
      Get.snackbar(
        "congratulation".tr,
        'book_a_class_successfully'.tr,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "something_went_wrong".tr,
        'book_a_class_failed_please_check_out_your_code'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void showBookAScheduleDialog({required ScheduleBooking scheduleBooking}) {
    bool canBookASchedule = walletController.wallet != null &&
        walletController.wallet!.amount != null &&
        walletController.wallet!.isBlocked == false &&
        double.parse(walletController.wallet!.amount!) >= 100000;

    Get.dialog(
      Dialog(
        child: Container(
          width: 1000,
          padding:
              const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'booking_details'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(children: [
                  TextSpan(
                    text: '${"date".tr}: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: DateFormat('EEE, dd-MM-yyyy').format(
                        scheduleBooking.startPeriodTimestamp ?? DateTime.now()),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${"booking_time".tr}: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        '${DateFormat('HH:mm').format(scheduleBooking.startPeriodTimestamp ?? DateTime.now())} - ${DateFormat('HH:mm').format(scheduleBooking.endPeriodTimestamp ?? DateTime.now())}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${"balance".tr}: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '${walletController.wallet?.getFormatBalance} VNĐ',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${"price".tr}: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text: '100.000 VNĐ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 10),
              Text(
                'note'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CustomTextField(
                textEditingController: noteController,
                hintText: 'additional_notes'.tr,
                minLines: 3,
                maxLines: 10,
                topSpacing: 8,
                bottomSpacing: 8,
                fontSize: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      noteController.clear();
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                    ),
                    child: Text('later'.tr),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: canBookASchedule
                        ? () {
                            bookASchedule(
                              scheduleBooking: scheduleBooking,
                              note: noteController.text,
                            );
                            noteController.clear();
                            Get.back();
                          }
                        : null,
                    child: Text('confirm'.tr),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
