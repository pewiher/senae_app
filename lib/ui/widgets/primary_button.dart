import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.alignment,
    this.height = 50,
    this.width = double.infinity,
    this.radius = 10,
    this.textStyle,
    this.buttonColor,
    this.elevation,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final double height;
  final double width;
  final double radius;
  final Color? buttonColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        backgroundColor: buttonColor,
        alignment: alignment,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w700).merge(textStyle),
        textAlign: TextAlign.center,
      ),
    );
  }
}
