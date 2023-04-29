import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.ratingStars}) : super(key: key);

  final int ratingStars;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
          5,
          (index) => index + 1 <= ratingStars
              ? const Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                  size: 16,
                )
              : const Icon(
                  Icons.star_outline,
                  color: Colors.yellow,
                  size: 16,
                )),
    );
  }
}
