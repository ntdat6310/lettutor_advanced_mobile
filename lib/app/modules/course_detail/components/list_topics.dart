import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/app/data/models/course/course_topic.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({
    Key? key,
    required this.topics,
    required this.style,
    this.onTap,
  }) : super(key: key);

  final List<CourseTopic> topics;
  final TextStyle style;
  final Function({required int selectedTopicIndex})? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(topics.length, (index) {
        return GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(selectedTopicIndex: index);
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "${index + 1}. ${topics[index].name}",
              style: style,
            ),
          ),
        );
      }),
    );
  }
}
