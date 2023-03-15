import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/ui/pages/meeting/meeting.dart';

class UpcomingLesson extends StatelessWidget {
  const UpcomingLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Upcoming Lesson',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 20),
          const Text(
            'Wed, 08 Mar 23 11:30 - 11:55',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            'Total lesson time is 297 hours 55 minutes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MeetingVideoConferencePage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.video_collection, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  'Enter lesson room',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
