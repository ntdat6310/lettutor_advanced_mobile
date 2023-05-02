import 'package:flutter/material.dart';

import '../../core/utils/helpers.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    final int ratingInt = Helper.roundHalfUp(rating);

    return Row(children: [
      ...List.generate(
        5,
        (index) => index + 1 <= ratingInt
            ? const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            : const Icon(
                Icons.star_outline,
                color: Colors.grey,
              ),
      ),
      const SizedBox(width: 4),
      Text(rating != 0.0 ? rating.toStringAsFixed(1) : '0')
    ]);
  }
}
