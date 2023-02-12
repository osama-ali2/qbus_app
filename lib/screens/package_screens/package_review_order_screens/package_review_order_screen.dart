// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/thank_you_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package_review_order_provider.dart';

class PackageReviewOrderScreen extends StatefulWidget {
  final int packageId;

  const PackageReviewOrderScreen({
    Key? key,
    required this.packageId,
  }) : super(key: key);

  @override
  State<PackageReviewOrderScreen> createState() =>
      _PackageReviewOrderScreenState();
}

class _PackageReviewOrderScreenState extends State<PackageReviewOrderScreen> {
  late PackageReviewOrderProvider packageReviewOrderProvider;

  @override
  void initState() {
    super.initState();

    packageReviewOrderProvider = PackageReviewOrderProvider();
    packageReviewOrderProvider =
        Provider.of<PackageReviewOrderProvider>(context, listen: false);
    packageReviewOrderProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      packageReviewOrderProvider.packageOrderReview(
          packageId: widget.packageId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageReviewOrderProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: AppLocalizations.of(context)!.order_confirmation,
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: SafeArea(
        child: packageReviewOrderProvider.isOrderReviewLoaded == true
            ? Column(
                children: [
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  packageReviewOrderProvider.isOrderReviewLoaded == true
                      ? _tripOrderContainer(
                          packageName: packageReviewOrderProvider
                                  .packageOrderReviewResponse.data?.name?.ar
                                  .toString() ??
                              "null",
                          quantity: packageReviewOrderProvider
                                  .packageOrderReviewResponse.data?.count
                                  .toString() ??
                              "0",
                          fromTime: packageReviewOrderProvider
                                  .packageOrderReviewResponse.data?.timeFrom
                                  .toString() ??
                              "null",
                          // fromCity:
                          // packageReviewOrderProvider
                          //         .packageOrderReviewResponse
                          //         .data
                          //         ?.fromCity
                          //         ?.name
                          //         ?.en
                          //         .toString() ??
                          // packageReviewOrderProvider
                          //         .packageOrderReviewResponse
                          //         .data
                          //         ?.fromCity
                          //         ?.name
                          //         ?.ar
                          //         .toString() ??
                          // "null",
                          toTime: packageReviewOrderProvider
                                  .packageOrderReviewResponse.data?.timeTo
                                  .toString() ??
                              "null",
                          // toCity:
                          // packageReviewOrderProvider.packageOrderReviewResponse
                          //         .data?.toCity?.name?.en
                          //         .toString() ??

                          // packageReviewOrderProvider
                          //         .packageOrderReviewResponse
                          //         .data
                          //         ?.toCity
                          //         ?.name
                          //         ?.ar
                          //          .toString() ??
                          // "null",
                          price: packageReviewOrderProvider
                                  .packageOrderReviewResponse.data?.fees
                                  .toString() ??
                              "00.0",
                        )
                      : Center(
                          child: Text(AppLocalizations.of(context)!.no_data),
                        ),
                  packageReviewOrderProvider.packageOrderReviewResponse.data!
                          .hotelsRooms!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: packageReviewOrderProvider
                                .packageOrderReviewResponse
                                .data!
                                .hotelsRooms!
                                .length,
                            itemBuilder: (context, index) {
                              var data = packageReviewOrderProvider
                                  .packageOrderReviewResponse
                                  .data!
                                  .hotelsRooms![index];

                              var days = data.days.toString();

                              // var title = data.name!.en.toString();
                              var title = data.name!.ar.toString();
                              var cityName = data.cityName!.ar.toString();

                              var price = data.fees.toString();
                              return _hotelRoomContainer(
                                days: days,
                                title: title,
                                price: price,
                                cityName: cityName,
                              );
                            },
                          ),
                        )
                      : const Spacer(),
                  packageReviewOrderProvider.packageOrderReviewResponse.data!
                          .additionals!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: packageReviewOrderProvider
                                .packageOrderReviewResponse
                                .data!
                                .additionals!
                                .length,
                            itemBuilder: (context, index) {
                              var data = packageReviewOrderProvider
                                  .packageOrderReviewResponse
                                  .data!
                                  .additionals![index];
                              var counts = data.count.toString();
                              var title = data.name.toString();
                              var price = data.fees.toString();

                              return _additionalContainer(
                                counts: counts,
                                title: title,
                                price: price,
                              );
                            },
                          ),
                        )
                      : const Spacer(),
                  CommonPadding.sizeBoxWithHeight(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextView.getGenericText(
                        text: AppLocalizations.of(context)!.total_cost,
                        fontFamily: Assets.latoRegular,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black900,
                        lines: 1),
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  _totalCalculationContainer(
                    title: AppLocalizations.of(context)!.sub_total,
                    value: "00.0",
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 5),
                  _totalCalculationContainer(
                    title: AppLocalizations.of(context)!.discount,
                    value: packageReviewOrderProvider
                            .packageOrderReviewResponse.data?.discount
                            .toString() ??
                        "00.00",
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 5),
                  _totalCalculationContainer(
                    title: AppLocalizations.of(context)!.tax,
                    value: packageReviewOrderProvider
                            .packageOrderReviewResponse.data?.tax
                            .toString() ??
                        "49.05",
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 5),
                  const Divider(
                    color: AppColors.borderColor,
                    thickness: 1,
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  _totalCalculationContainer(
                    title: AppLocalizations.of(context)!.total_cost,
                    value: packageReviewOrderProvider
                            .packageOrderReviewResponse.data?.total
                            .toString() ??
                        "00.0",
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 20),
                  CustomButton(
                    name: AppLocalizations.of(context)!.process_to_checkout,
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThankYouScreen(
                              tripId: widget.packageId,
                            ),
                          ));
                    },
                    padding: 0,
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 20),
                ],
              ).get20HorizontalPadding()
            : Center(
                child: TextView.getGenericText(
                    text: AppLocalizations.of(context)!.no_data,
                    fontFamily: Assets.latoRegular,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black900,
                    lines: 1),
              ),
      ),
    );
  }

  /// Total Calculation Container
  Widget _totalCalculationContainer(
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
            text: "$valueريال ",
            fontFamily: Assets.latoRegular,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black900,
            lines: 1,
          ),
        ],
      );

  /// Trip Order Container
  Widget _tripOrderContainer({
    required String packageName,
    required String quantity,
    required String fromTime,
    // required String fromCity,
    required String toTime,
    // required String toCity,
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
                  lines: 1,
                ),

                CommonPadding.sizeBoxWithWidth(width: 10),
                TextView.getGenericText(
                  text: "$packageName ",
                  fontFamily: Assets.latoRegular,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black900,
                  lines: 1,
                ),
                const Spacer(),
                // SvgPicture.asset(
                //   "assets/svg/skip_icon.svg",
                //   height: sizes!.heightRatio * 24,
                //   width: sizes!.widthRatio * 24,
                //   color: AppColors.black900,
                // ),
                // TextView.getGenericText(
                //     text: "$toTime ",
                //     fontFamily: Assets.latoRegular,
                //     fontSize: 14,
                //     fontWeight: FontWeight.w400,
                //     color: AppColors.black900,
                //     lines: 1),
                CommonPadding.sizeBoxWithWidth(width: 10),

                Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appColor),
                  child: Center(
                    child: CustomText(
                        text: " ريال$price",
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
          ),
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
                  lines: 1,
                ),

                CommonPadding.sizeBoxWithWidth(width: 10),
                TextView.getGenericText(
                  text: "$fromTime ",
                  fontFamily: Assets.latoRegular,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black900,
                  lines: 1,
                ),
                const Spacer(),
                // SvgPicture.asset(
                //   "assets/svg/skip_icon.svg",
                //   height: sizes!.heightRatio * 24,
                //   width: sizes!.widthRatio * 24,
                //   color: AppColors.black900,
                // ),
                TextView.getGenericText(
                    text: "$toTime ",
                    fontFamily: Assets.latoRegular,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                CommonPadding.sizeBoxWithWidth(width: 10),

                Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appColor),
                  child: Center(
                    child: CustomText(
                        text: " ريال$price",
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
          ),
        ],
      );

  /// Hotel ROom Container
  Widget _hotelRoomContainer({
    required String days,
    required String title,
    required String price,
    required String cityName,
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
                    text: "$days ليال",
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
                CommonPadding.sizeBoxWithWidth(width: 8),
                TextView.getGenericText(
                    text: cityName,
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
                        text: " ريال$price",
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

  /// Additional Container
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
                        text: " ريال$price",
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
