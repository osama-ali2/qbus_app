// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';

class FilterContainerWidget extends StatelessWidget {
  final Function onPress;

  const FilterContainerWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress.call(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Filter",
            style: TextStyle(
              fontSize: sizes!.fontRatio * 14,
              fontFamily: Assets.latoRegular,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          CommonPadding.sizeBoxWithWidth(width: 4),
          SvgPicture.asset(
            "assets/svg/filter_icon.svg",
            height: sizes!.heightRatio * 16,
            width: sizes!.widthRatio * 16,
          ),
        ],
      ),
    );
  }
}
