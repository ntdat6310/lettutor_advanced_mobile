import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_advanced_mobile/app/data/models/teacher/rating_comment.dart';
import 'package:lettutor_advanced_mobile/app/modules/teacher_detail/components/rating_star.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  final RatingComment review;

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
            CircleAvatar(
              backgroundImage: NetworkImage(review.studentAvatar ??
                  'https://img.freepik.com/free-icon/user_318-804790.jpg?w=2000'),
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
                      review.studentName ?? '',
                      style: studentNameStyle,
                    ),
                    RatingStar(
                      ratingStars: review.rating ?? 0,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    review.content ?? '',
                    style: commentStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    DateFormat('kk:mm dd-MM-yyyy').format(
                        review.updatedAt != null
                            ? DateTime.parse(review.updatedAt!)
                            : DateTime.now()),
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
