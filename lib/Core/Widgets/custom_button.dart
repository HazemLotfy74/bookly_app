import 'package:flutter/material.dart';

import '../Utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.background,
    required this.text,
    required this.textColor,
    required this.borderRadius, this.onPressed,
  });

  final Color background;
  final String text;

  final Color textColor;

  final BorderRadius borderRadius;
 final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: background,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.bodyTitle
              .copyWith(fontWeight: FontWeight.w900, color: textColor),
        ),
      ),
    );
  }
}