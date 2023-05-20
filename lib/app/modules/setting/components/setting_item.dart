import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onClick,
    this.bottomSpace = 0,
    this.value,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onClick;
  final double bottomSpace;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomSpace),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16)),
          elevation: MaterialStateProperty.all(2),
        ),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                Icon(icon, color: Colors.black87, size: 24),
                const SizedBox(width: 12),
                Text(
                  value != null ? "$title: $value" : title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
