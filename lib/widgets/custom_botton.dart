import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.textStyle,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final Color buttonColor;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
      color: buttonColor,
      elevation: 5.0,
    );
  }
}
