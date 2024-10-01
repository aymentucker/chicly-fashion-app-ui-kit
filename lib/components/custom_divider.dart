import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[400])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text),
        ),
        Expanded(child: Divider(color: Colors.grey[400])),
      ],
    );
  }
}
