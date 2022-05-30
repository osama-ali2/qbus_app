import 'package:flutter/cupertino.dart';
import 'package:qbus/res/res.dart';

class CommonPadding {
  static final commonWidthPadding30 = sizes!.widthRatio * 30.0;
  static final commonHeightPadding30 = sizes!.heightRatio * 30.0;

  static final getCommonPaddingLeftAndRightWidth30 =
      EdgeInsets.only(left: commonWidthPadding30, right: commonWidthPadding30);

  static Widget sizeBoxWithHeight({required double height}) {
    return SizedBox(
      height: sizes!.heightRatio * height,
    );
  }

  static Widget sizeBoxWithWidth({required double width}) {
    return SizedBox(
      width: sizes!.widthRatio * width,
    );
  }
}
