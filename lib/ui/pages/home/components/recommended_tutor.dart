import 'package:flutter/material.dart';

class RecommendedTutor extends StatelessWidget {
  const RecommendedTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Recommended tutors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See all'),
        ),
      ],
    );
  }
}
