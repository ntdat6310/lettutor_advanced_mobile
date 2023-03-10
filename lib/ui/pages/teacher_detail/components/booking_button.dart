import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  BookingButton({Key? key}) : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: style,
        child: const Text("Booking"),
      ),
    );
  }
}
