import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/data/models/review.dart';
import 'package:lettutor_advanced_mobile/modules/teacher_detail/components/rating_star.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  final Review review;

  final TextStyle studentNameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final TextStyle commentStyle = const TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  final TextStyle dateStyle = const TextStyle(
    fontSize: 12,
    color: Colors.black45,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shadowColor: Colors.black54,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
              radius: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.studentName,
                      style: studentNameStyle,
                    ),
                    RatingStar(
                      ratingStars: review.ratingStar,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    review.comment ?? "",
                    style: commentStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    DateFormat('kk:mm  dd-MM-yyyy').format(review.date),
                    style: dateStyle,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
