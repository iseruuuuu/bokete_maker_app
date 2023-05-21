// Flutter imports:
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final Color buttonColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: buttonColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: titleColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
