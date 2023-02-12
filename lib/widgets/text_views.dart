import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qbus/resources/res.dart';

class TextView {

  static Text getGenericText({
    required String text,
    required String fontFamily,
    required int fontSize,
    required FontWeight fontWeight,
    required Color color,
    final TextAlign textAlign = TextAlign.start,
    required int lines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontRatio * fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }


  static Text getDrawerMenuText13(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.center,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getJumboText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumboFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getWelcomeTextWith28(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo28FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getWelcomeTextWith38(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo38FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getWelcomeTextWith34(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo34FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getWelcomeTextWith30(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo30FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getWelcomeTextWith26(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo26FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getTextWith24(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo24FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getTextWith25(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo24FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getTextWith22(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.extraLargeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getTextWith20(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo20FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getExtraLargeText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.extraLargeFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.mediumFontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumTextLight(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.mediumFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumText16(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required FontWeight? fontWeight,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.mediumLargeFontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumText14(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required FontWeight? fontWeight,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumText18(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo18FontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getMediumTextItalic(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.mediumFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        fontStyle: FontStyle.italic,
        color: color,
      ),
    );
  }

  static Text getLargeText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines,
      @required dynamic fontWeight}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.largeFontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSubHeadingTextWith15(
    final text,
    final fontFamily, {
    @required final color,
    final TextAlign textAlign = TextAlign.start,
    @required final lines,
    @required FontWeight? fontWeight,
  }) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.mediumFontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularBoldText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularTextUnderline(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
          fontSize: sizes!.mediumFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          color: color,
          decoration: TextDecoration.underline),
    );
  }

  static Text getRegularS17W600Text(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo17FontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularS17W400Text(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.jumbo17FontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularTextTooHeavy(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines,
      @required final customFontSize}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.extraLargeFontSize * customFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularTextHeavy(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: sizes!.mediumFontSize,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallText12(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallBoldText12(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize12,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallText11(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize11,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getText10(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize10,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallTextCenterAlign(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.center,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getExtraSmallText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.extraSmallFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getSmallTextHeavy(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.smallFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegular13Text(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.center,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularWith13(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegularBoldWith13(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getRegular13TextHeavy(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.regularFontSize,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }

  static Text getDropdownText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: fontFamily,
        fontSize: sizes!.mediumFontSize,
        color: color,
      ),
    );
  }

  static Text getDropdownHintText(final text, final fontFamily,
      {@required final color,
      final TextAlign textAlign = TextAlign.start,
      @required final lines}) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: sizes!.regularFontSize,
          fontFamily: fontFamily,
          color: color),
    );
  }
}
