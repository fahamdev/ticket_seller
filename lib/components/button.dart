import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color buttonColour;
  final Color textColour;
  final double buttonPadding;
  final double buttonMarginHorizontal;
  final double buttonMarginVertical;

  const MyButton({super.key, required this.onTap, required this.buttonText, required this.buttonColour, this.textColour = Colors.white,
    this.buttonPadding = 25, this.buttonMarginHorizontal = 25, this.buttonMarginVertical = 10});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(buttonPadding),
        margin: EdgeInsets.symmetric(horizontal: buttonMarginHorizontal, vertical: buttonMarginVertical),
        decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColour,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}