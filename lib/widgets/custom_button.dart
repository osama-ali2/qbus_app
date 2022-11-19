import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color buttonColor;
  final double height;
  final double width;
  final bool? isBorder;
  final Color? borderColor;
  final double textSize;
  final double borderRadius;
  final double padding;
  final Color textColor;
  final FontWeight fontWeight;
  final Function onTapped;

  const CustomButton(
      {Key? key,
      required this.name,
      required this.buttonColor,
      required this.height,
      required this.width,
      this.isBorder = false,
      this.borderColor,
      required this.textSize,
      required this.textColor,
      required this.fontWeight,
      required this.borderRadius,
      required this.onTapped,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border:
                  isBorder! ? Border.all(color: borderColor!, width: 2) : null),
          child: Center(
              child: CustomText(
                  text: name,
                  textSize: textSize,
                  fontWeight: fontWeight,
                  textColor: textColor)),
        ),
      ),
    );
  }
}
