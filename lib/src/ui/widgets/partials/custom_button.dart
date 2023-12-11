import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.fullWidth,
    required this.width,
    required this.height,
    required this.buttonIcon,
    this.onPressed,
  });

  final String buttonText;
  final String buttonIcon;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback? onPressed;
  final bool fullWidth;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(buttonColor)),
      child: SizedBox(
        width: fullWidth ? double.infinity : width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(buttonIcon),
            // Image.asset(buttonIcon != null ? buttonIcon: null);
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(color: buttonTextColor),
            )
          ],
        ),
      ),
    );
  }
}
