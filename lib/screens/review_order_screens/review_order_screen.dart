// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/get_started_screens/get_started_screen.dart';
import 'package:qbus/screens/review_order_screens/review_order_provider.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../res/colors.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_text.dart';

class ReviewOrderScreen extends StatefulWidget {
  final int tripId;

  const ReviewOrderScreen({Key? key, required this.tripId}) : super(key: key);

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  late ReviewOrderProvider reviewOrderProvider;

  @override
  void initState() {
    super.initState();

    reviewOrderProvider = ReviewOrderProvider();
    reviewOrderProvider =
        Provider.of<ReviewOrderProvider>(context, listen: false);
    reviewOrderProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      reviewOrderProvider.orderReview(tripId: widget.tripId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ReviewOrderProvider>(context, listen: true);
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
            CommonPadding.sizeBoxWithHeight(height: 10),
            reviewOrderProvider.isOrderReviewLoaded == true
                ? tripOrderContainer(
                    quantity: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.count
                            .toString() ??
                        "0",
                    fromTime: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.timeFrom
                            .toString() ??
                        "null",
                    fromCity: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.fromCity?.name?.en
                            .toString() ??
                        "null",
                    toTime: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.timeTo
                            .toString() ??
                        "null",
                    toCity: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.toCity?.name?.en
                            .toString() ??
                        "null",
                    price: reviewOrderProvider
                            .oneWayOrderReviewResponse.data?.fees
                            .toString() ??
                        "00.0")
                //  Expanded(
                //     child: ListView.builder(
                //       itemCount: reviewOrderProvider
                //           .orderReviewResponse.data!.tripOrders!.length,
                //       itemBuilder: (context, index) {
                //         var data = reviewOrderProvider
                //             .orderReviewResponse.data!.tripOrders![index];
                //         var fromCity = data.fromCity!.name!.en.toString();
                //         var toCity = data.toCity!.name!.en.toString();
                //         var timeFrom = data.timeFrom!;
                //         var timeTo = data.timeTo!;
                //
                //         if (reviewOrderProvider.orderReviewResponse.data!
                //             .tripOrders![index].hotelsRooms!.isNotEmpty) {
                //           return orderContainer(
                //               quantity: "2",
                //               title: "Hilton Honor",
                //               price: "100");
                //         } else {
                //           return tripOrderContainer(
                //               quantity: "2",
                //               fromTime: timeFrom,
                //               fromCity: fromCity,
                //               toTime: timeTo,
                //               toCity: toCity,
                //               price: "1000");
                //         }
                //
                //         // if (fromCity != null) {
                //         //   return orderContainer(
                //         //       quantity: "2",
                //         //       title: "Hilton Honor",
                //         //       price: "100");
                //         // } else {
                //         //   return tripOrderContainer(
                //         //       quantity: "2",
                //         //       fromTime: "10:30",
                //         //       fromCity: "Al Makka",
                //         //       toTime: "1:30",
                //         //       toCity: "Al Madina",
                //         //       price: "1000");
                //         // }
                //       },
                //     ),
                //   )
                : const Center(
                    child: Text("No Data"),
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
            totalCalculationContainer(title: "Sub Total", value: "00.0"),
            CommonPadding.sizeBoxWithHeight(height: 5),
            totalCalculationContainer(
              title: "Discount",
              value: reviewOrderProvider
                      .oneWayOrderReviewResponse.data?.discount
                      .toString() ??
                  "00.00",
            ),
            CommonPadding.sizeBoxWithHeight(height: 5),
            totalCalculationContainer(
              title: "Tax",
              value: reviewOrderProvider.oneWayOrderReviewResponse.data?.tax
                      .toString() ??
                  "49.05",
            ),
            CommonPadding.sizeBoxWithHeight(height: 5),
            const Divider(
              color: AppColors.borderColor,
              thickness: 1,
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            totalCalculationContainer(
              title: "Total Cost",
              value: reviewOrderProvider.oneWayOrderReviewResponse.data?.total
                      .toString() ??
                  "00.0",
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

  Widget totalCalculationContainer(
          {required String title, required String value}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView.getGenericText(
              text: title,
              fontFamily: Assets.latoRegular,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black900,
              lines: 1),
          TextView.getGenericText(
            text: "$value SAR",
            fontFamily: Assets.latoRegular,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black900,
            lines: 1,
          ),
        ],
      );

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
                    text: "$fromTime $fromCity",
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
                    text: "$toTime $toCity",
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
