import 'package:flutter/material.dart';
import 'package:lettutor_advanced_mobile/modules/teacher_detail/components/review_card.dart';

import '../../../../data/fake_data.dart';
import '../../../../data/models/review.dart';

class ReviewList extends StatelessWidget {
  ReviewList({Key? key}) : super(key: key);

  final List<Review> reviewList = FakeData().getReviews();

  final TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    // color: Colors.blue
  );

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 20,
        ),
        const SizedBox(height: 10),
        Text(
          "Reviews (${reviewList.length})",
          style: titleStyle,
        ),
        const SizedBox(height: 10),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            reviewList.length,
                (index) => ReviewCard(
              review: reviewList[index],
            ),
          ),
        ),
      ],
    );
  }
}
