import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TeacherDescription extends StatefulWidget {
  const TeacherDescription({Key? key, required this.description})
      : super(key: key);
  final String description;

  @override
  State<TeacherDescription> createState() => _TeacherDescriptionState();
}

class _TeacherDescriptionState extends State<TeacherDescription> {
  bool _isShowFullText = false;

  TextStyle normalStyle = const TextStyle(
    fontSize: 17,
    color: Colors.black54,
  );

  TextStyle toggleStyle = const TextStyle(
    fontSize: 17,
    color: Colors.blueAccent,
  );

  void _toggleText() {
    setState(() {
      _isShowFullText = !_isShowFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.description,
          maxLines: _isShowFullText ? 1000 : 2,
          overflow: TextOverflow.ellipsis,
          style: normalStyle,
          textAlign: TextAlign.left,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                _toggleText();
              },
              child: Text(
                _isShowFullText ? "Hide" : "Show",
                style: toggleStyle,
              )),
        )
      ],
    );
  }
}
