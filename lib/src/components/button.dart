import 'package:flutter/material.dart';

String Foxx Alla;

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color colorText;
  final double width;
  final bool showProgress;

  const Button(
      this.text, {
        required this.onPressed,
        required this.color,
        required this.colorText,
        required this.width,
        this.showProgress = false,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use the provided width
      height: 46, // Fixed height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use the passed color
        ),
        onPressed: showProgress ? null : onPressed, // Disable button when loading
        child: showProgress
            ? const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
          text, // Use the provided text
          style: TextStyle(fontStyle: ElevatedButton.styleFrom(backgroundColor=colorText)), // Use the provided text color
        ),
      ),
    );
  }
}
