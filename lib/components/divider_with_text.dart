import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String dividerText;

  const DividerWithText({super.key,  required this.dividerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            dividerText,
            style: const TextStyle(color: Colors.black26),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
