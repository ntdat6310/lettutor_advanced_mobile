import 'package:flutter/material.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({Key? key, required this.topics, required this.style})
      : super(key: key);

  final List<Map<String, String>> topics;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(topics.length, (index) {
        Map<String, String> topic = topics[index];
        String topicName = topic['topic']!;
        // String pdfPath = topic['pdfPath']!;

        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("$index", style: style),
              const SizedBox(width: 10),
              Text(topicName, style: style)
            ],
          ),
        );
      }),
    );
  }
}
