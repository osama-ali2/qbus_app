// Created by Tayyab Mughal on 24/01/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bottombar/bottom_bar_screen.dart';

class ThankYouScreen extends StatelessWidget {
  final int tripId;

  const ThankYouScreen({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              CommonPadding.sizeBoxWithHeight(height: 60),
              SvgPicture.asset("assets/svg/trip_done_icon.svg"),
              CommonPadding.sizeBoxWithHeight(height: 18),
              CustomText(
                text: AppLocalizations.of(context)!.your_order_saved,
                textSize: 18,
                fontWeight: FontWeight.w700,
                textColor: AppColors.black900,
              ),
              CommonPadding.sizeBoxWithHeight(height: 18),
              CustomText(
                text: AppLocalizations.of(context)!.complete_order_text,
                textSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.black900,
                maxLines: 3,
              ),
              CommonPadding.sizeBoxWithHeight(height: 20),
              CustomText(
                text: "$tripId",
                textSize: 40,
                fontWeight: FontWeight.w700,
                textColor: AppColors.black900,
              ),
              const Spacer(),
              CustomButton(
                name: AppLocalizations.of(context)!.home,
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBarScreen()),
                      (route) => false);
                },
                padding: 0,
              ),
              CommonPadding.sizeBoxWithHeight(height: 20),
            ],
          ).get20HorizontalPadding(),
        ),
      ),
    );
  }
}
