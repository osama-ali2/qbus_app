import 'package:flutter/material.dart';
import 'package:qbus/resources/resources.dart';

extension AlignExtension on Widget {
  Widget getAlign() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget get30HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 30.0),
      child: this,
    );
  }

  Widget get20HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
      child: this,
    );
  }

  Widget getChildCenter() {
    return Center(
      child: this,
    );
  }
}

extension StringUtils on String {
  String capitalize() {
    return "${this[0].toUpperCase()} ${this[1].toLowerCase()}";
  }

  /// Truncate a string if it's longer than [maxLength] and add an [ellipsis].
  String getShortString(int maxLength, [String ellipsis = "…"]) =>
      length > maxLength
          ? '${substring(0, maxLength - ellipsis.length)}$ellipsis'
          : this;
}

extension BoolExtension on int {
  bool get toBool => this == 1;
}
