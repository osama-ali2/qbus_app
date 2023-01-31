import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign? textAlign;
  final int maxLines;

  const CustomText(
      {Key? key,
      this.maxLines = 1,
      required this.text,
      required this.textSize,
      required this.fontWeight,
      required this.textColor,
      this.textAlign = TextAlign.center,
      required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
