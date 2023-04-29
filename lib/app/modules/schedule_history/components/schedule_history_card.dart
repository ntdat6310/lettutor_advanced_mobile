import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/schedule_history.dart';

class ScheduleHistoryCard extends StatelessWidget {
  const ScheduleHistoryCard({Key? key, required this.history})
      : super(key: key);

  final ScheduleHistory history;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/avatar.jpg')),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.schedule.teacher.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('EEE, M/d/y')
                                .format(history.schedule.fromTime),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1,
                                )),
                            child: Text(
                              "${DateFormat('kk-mm').format(history.schedule.fromTime)} - ${DateFormat('kk-mm').format(history.schedule.toTime)}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        history.teacherComment == ''
                            ? 'Tutor haven\'t reviewed yet'
                            : history.teacherComment,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent,
                          backgroundColor: Colors.white24,
                        ),
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blueAccent,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            // TODO: add button press logic here
                          },
                          child: const Text('Send Message'),
                        )),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            // TODO: add button press logic here
                          },
                          child: const Text('Give Feedback'),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
