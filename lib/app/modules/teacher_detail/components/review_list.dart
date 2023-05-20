import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../data/models/teacher/rating_comment.dart';
import 'review_card.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key, required this.reviews}) : super(key: key);

  final RxList<RatingComment> reviews;

  final TextStyle titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    // color: Colors.blue
  );

  @override
  Widget build(BuildContext context) {
    return Column(
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
          "${"reviews".tr} (${reviews.length})",
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                reviews.length,
                (index) => ReviewCard(
                  review: reviews[index],
                ),
              ),
            )),
      ],
    );
  }
}
