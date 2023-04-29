import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.rating}) : super(key: key);
  final double rating;
  // TODO: Calculating rating and render star

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => const Icon(
                Icons.star,
                color: Colors.yellow,
              )),
    );
  }
}
