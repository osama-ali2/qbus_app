// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/get_started_screens/get_started_screen.dart';
import 'package:qbus/screens/round_trip_flow/step_two/round_trip_review_order_screens/round_trip_review_order_provider.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';

import '../../../../models/order_reviews/RoundOrderReviewResponse.dart';

class RoundTripReviewOrderScreen extends StatefulWidget {
  final List<int> orderId;

  const RoundTripReviewOrderScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<RoundTripReviewOrderScreen> createState() =>
      _RoundTripReviewOrderScreenState();
}

class _RoundTripReviewOrderScreenState
    extends State<RoundTripReviewOrderScreen> {
  late RoundTripReviewOrderProvider roundTripReviewOrderProvider;

  @override
  void initState() {
    super.initState();

    roundTripReviewOrderProvider = RoundTripReviewOrderProvider();
    roundTripReviewOrderProvider =
        Provider.of<RoundTripReviewOrderProvider>(context, listen: false);
    roundTripReviewOrderProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      roundTripReviewOrderProvider.roundOrderReview(tripId: widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RoundTripReviewOrderProvider>(context, listen: true);
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
        child: roundTripReviewOrderProvider.isRoundOrderReviewLoaded == true
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: roundTripReviewOrderProvider
                          .roundOrderReviewResponse.data!.tripOrders!.length,
                      itemBuilder: (context, index) {
                        var dataTrip = roundTripReviewOrderProvider
                            .roundOrderReviewResponse.data!.tripOrders![index];

                        /// Data
                        var data = roundTripReviewOrderProvider
                            .roundOrderReviewResponse.data!;
                        var discount = data.discount.toString();
                        var taxValue = data.tax.toString();
                        var total = data.total.toString();
                        //var finalFrees = data.fees.toString();

                        // Data Trip
                        var timeFrom = dataTrip.timeFrom.toString();
                        var timeTo = dataTrip.timeTo.toString();
                        var dateFrom = dataTrip.dateFrom.toString();
                        var dateTo = dataTrip.dateTo.toString();
                        var fromCity = dataTrip.fromCity!.name!.en.toString();
                        var toCity = dataTrip.toCity!.name!.en.toString();
                        var count = dataTrip.count.toString();
                        var tripFee = dataTrip.fees.toString();

                        var hotelRoomsLength = dataTrip.hotelsRooms!.length;
                        var additionalLength = dataTrip.additionals!.length;
                        var hotelRoomsData = dataTrip.hotelsRooms;
                        var additionalData = dataTrip.additionals;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: sizes!.heightRatio * 10,
                          ),
                          child: _returnOrderReview(
                            discount: discount,
                            taxValue: taxValue,
                            total: total,
                            fees: tripFee,
                            timeFrom: timeFrom,
                            timeTo: timeTo,
                            dateFrom: dateFrom,
                            dateTo: dateTo,
                            fromCity: fromCity,
                            toCity: toCity,
                            count: count,
                            hotelRoomsLength: hotelRoomsLength,
                            additionalLength: additionalLength,
                            additionalData: additionalData!,
                            hotelsRoomsData: hotelRoomsData!,
                          ),
                        );
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
                          text: "00.00",
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
                          text: "Discount",
                          fontFamily: Assets.latoRegular,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black900,
                          lines: 1),
                      TextView.getGenericText(
                          text: roundTripReviewOrderProvider
                              .roundOrderReviewResponse.data!.discount
                              .toString(),
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
                          text: roundTripReviewOrderProvider
                              .roundOrderReviewResponse.data!.tax
                              .toString(),
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
                          text:
                              "${roundTripReviewOrderProvider.roundOrderReviewResponse.data!.total.toString()} SAR",
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
              ).get20HorizontalPadding()
            : Center(
                child: TextView.getGenericText(
                    text: "No Data Found",
                    fontFamily: Assets.latoRegular,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black900,
                    lines: 1),
              ),
      ),
    );
  }

  Widget _returnOrderReview({
    required String discount,
    required String taxValue,
    required String total,
    required String fees,
    required String timeFrom,
    required String timeTo,
    required String dateFrom,
    required String dateTo,
    required String fromCity,
    required String toCity,
    required String count,
    required int hotelRoomsLength,
    required int additionalLength,
    required List<Additionals> additionalData,
    required List<HotelsRooms> hotelsRoomsData,
  }) =>
      Column(
        children: [
          _tripOrderContainer(
            quantity: count,
            fromTime: timeFrom,
            fromCity: fromCity,
            toTime: timeTo,
            toCity: toCity,
            price: fees,
          ),
          for (int i = 0; i < additionalLength; i++)
            _additionalContainer(
              counts: additionalData[i].count.toString(),
              title: additionalData[i].name.toString(),
              price: additionalData[i].fees.toString(),
            ),
          for (int i = 0; i < hotelRoomsLength; i++)
            _hotelRoomContainer(
              days: hotelsRoomsData[i].days.toString(),
              title: hotelsRoomsData[i].name!.en.toString(),
              price: hotelsRoomsData[i].fees.toString(),
            ),
        ],
      );

  Widget _hotelRoomContainer({
    required String days,
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
                    text: "$days Days",
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

  Widget _additionalContainer({
    required String counts,
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
                    text: title,
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                CommonPadding.sizeBoxWithWidth(width: 10),
                TextView.getGenericText(
                    text: counts,
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

  Widget _tripOrderContainer({
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
}
