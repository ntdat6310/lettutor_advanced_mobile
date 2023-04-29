import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'meeting_video_conference_controller.dart';

class MeetingVideoConferenceView
    extends GetView<MeetingVideoConferenceController> {
  const MeetingVideoConferenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: double.infinity,
                child: Text(
                  '02:54:28 until lesson start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 30),
              CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/avatar.jpg')),
            ],
          ),
          const Positioned(
              bottom: 100,
              left: null,
              right: null,
              child: Text(
                "You are the only one in the meeting.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.videocam),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.screen_share),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.call_end, color: Colors.red),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
