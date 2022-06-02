import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/setting_card.dart';

import '../../../../res/assets.dart';
import '../../../../res/res.dart';
import '../../../../widgets/text_views.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: CustomText(
              text: "Settings",
              textSize: 18,
              fontWeight: FontWeight.w700,
              textColor: Colors.white),
        ),
      ),
      body: Column(
        children: [
          CommonPadding.sizeBoxWithHeight(height: 20),
          getRow(
            title: "Language",
            language: "English",
            onPress: () {},
          )
        ],
      ),
    );
  }

  Widget getRow(
          {required String title,
          required String language,
          required Function? onPress}) =>
      Container(
        height: sizes!.heightRatio * 42,
        width: sizes!.widthRatio * 335,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.gray, width: 1),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView.getMediumText14(title, Assets.latoBold,
                  color: AppColors.black900,
                  fontWeight: FontWeight.w400,
                  lines: 1),
              const Spacer(),
              TextView.getMediumText14(language, Assets.latoBold,
                  color: AppColors.black900,
                  fontWeight: FontWeight.w400,
                  lines: 1),
              CommonPadding.sizeBoxWithWidth(width: 10),
              GestureDetector(
                onTap: () {
                  if (onPress != null) {
                    onPress.call();
                  }
                },
                child: SvgPicture.asset(
                  "assets/svg/forward_icon.svg",
                  width: sizes!.widthRatio * 24,
                  height: sizes!.heightRatio * 24,
                ),
              ),
            ],
          ),
        ),
      ).get20HorizontalPadding();

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SettingCard(
          onTap: () {},
          name: 'Language',
        ),
      ],
    );
  }
}
