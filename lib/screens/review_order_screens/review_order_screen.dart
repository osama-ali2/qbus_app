// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/get_started_screens/get_started_screen.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../res/colors.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_text.dart';

class ReviewOrderScreen extends StatefulWidget {
  const ReviewOrderScreen({Key? key}) : super(key: key);

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Review The Order",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return orderContainer(
                        quantity: "2", title: "Hilton Honor", price: "100");
                  } else {
                    return tripOrderContainer(
                        quantity: "2",
                        fromTime: "10:30",
                        fromCity: "Al Makka",
                        toTime: "1:30",
                        toCity: "Al Madina",
                        price: "1000");
                  }
                },
              ),
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: TextView.getGenericText(
                  text: "Total",
                  fontFamily: Assets.latoRegular,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black900,
                  lines: 1),
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "Sub Total",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                TextView.getGenericText(
                    text: "249.05",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "Tax 15%",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                TextView.getGenericText(
                    text: "49.05",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 5),
            const Divider(
              color: AppColors.borderColor,
              thickness: 1,
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "Total Cost",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black900,
                    lines: 1),
                TextView.getGenericText(
                    text: "293 SAR",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black900,
                    lines: 1),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomButton(
              name: "PROCESS TO CHECKOUT",
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
                        builder: (context) => const GetStartedScreen()),
                    (route) => false);
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  Widget tripOrderContainer({
    required String quantity,
    required String fromTime,
    required String fromCity,
    required String toTime,
    required String toCity,
    required String price,
  }) =>
      Column(
        children: [
          Container(
            height: sizes!.heightRatio * 50,
            width: sizes!.width,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "X$quantity",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                TextView.getGenericText(
                    text: "10:30 Makkah",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                SvgPicture.asset(
                  "assets/svg/skip_icon.svg",
                  height: sizes!.heightRatio * 24,
                  width: sizes!.widthRatio * 24,
                  color: AppColors.black900,
                ),
                TextView.getGenericText(
                    text: "12:30 al madina",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appColor),
                  child: Center(
                    child: CustomText(
                        text: "SAR $price",
                        textSize: sizes!.fontRatio * 10,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.borderColor,
            thickness: 1,
          )
        ],
      );

  Widget orderContainer({
    required String quantity,
    required String title,
    required String price,
  }) =>
      Column(
        children: [
          Container(
            height: sizes!.heightRatio * 50,
            width: sizes!.width,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "X$quantity",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                CommonPadding.sizeBoxWithWidth(width: 10),
                TextView.getGenericText(
                    text: title,
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                const Spacer(),
                Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appColor),
                  child: Center(
                    child: CustomText(
                        text: "SAR $price",
                        textSize: sizes!.fontRatio * 10,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.borderColor,
            thickness: 1,
          )
        ],
      );
}