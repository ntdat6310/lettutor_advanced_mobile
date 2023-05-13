import 'package:get/get.dart';

import 'meeting_video_conference_controller.dart';

class MeetingVideoConferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingVideoConferenceController>(
      () => MeetingVideoConferenceController(),
    );
  }
}
