import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../data/models/course.dart';
import '../widgets/custom_appbar.dart';

class CourseLesson extends StatefulWidget {
  const CourseLesson({Key? key, required this.course}) : super(key: key);

  final Course course;
  @override
  State<CourseLesson> createState() => _CourseLessonState();
}

class _CourseLessonState extends State<CourseLesson> {
  int _selectedTopicIndex = -1;

  void _onTopicSelected(int index) {
    setState(() {
      _selectedTopicIndex = index;
    });
  }

  final TextStyle headingStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final TextStyle textStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  Widget _buildTopicItem(int index) {
    final topic = widget.course.topics[index];
    return GestureDetector(
      onTap: () => _onTopicSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: _selectedTopicIndex == index ? Colors.grey : null,
          border: _selectedTopicIndex == index
              ? Border.all(
                  color: Colors.blueAccent, width: 2, style: BorderStyle.solid)
              : Border.all(
                  color: Colors.transparent,
                  width: 2,
                  style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${index + 1}",
              style: textStyle,
            ),
            const SizedBox(width: 10),
            Text(
              topic['topic']!,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Course Lesson"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  widget.course.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.course.name, style: headingStyle),
            const SizedBox(height: 10),
            Text(widget.course.shortDesc, style: textStyle),
            const SizedBox(height: 20),
            Text("List Topics", style: headingStyle),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(widget.course.topics.length, (index) {
                return _buildTopicItem(index);
              }),
            ),
            if (_selectedTopicIndex >= 0)
              SizedBox(
                width: double.infinity,
                height: 500,
                child: PDFView(
                  filePath: "https://www.orimi.com/pdf-test.pdf",
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageSnap: false,
                  pageFling: false,
                  onRender: (_pages) {},
                  onError: (error) {
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {},
                  onPageChanged: (int? page, int? total) {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}
