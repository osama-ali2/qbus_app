// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbus/resources/resources.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';

import '../../models/trips/TripsResponse.dart';

class TripCardContainerWidget extends StatelessWidget {
  final String stationA;
  final String stationB;
  final String fees;
  final String rate;
  final String fromCityName;
  final String toCityName;
  final String timeFrom;
  final String timeTo;
  final String stops;
  final String providerName;
  final List<Additionals> additionals;

  const TripCardContainerWidget({
    Key? key,
    required this.stationA,
    required this.stationB,
    required this.fees,
    required this.rate,
    required this.fromCityName,
    required this.toCityName,
    required this.timeFrom,
    required this.timeTo,
    required this.stops,
    required this.providerName,
    required this.additionals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes!.heightRatio * 190,
      width: sizes!.widthRatio * 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadowColor,
            blurRadius: 10.0,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizes!.widthRatio * 10,
          vertical: sizes!.heightRatio * 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: providerName,
                    fontFamily: Assets.latoRegular,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor,
                    lines: 1),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    CustomText(
                      text: "$rate.0",
                      textSize: sizes!.fontRatio * 16,
                      fontWeight: FontWeight.normal,
                      textColor: const Color(0xff747268),
                    ),
                  ],
                ),

                /// Price Container
                // CommonPadding.sizeBoxWithWidth(width: 6),
                // Container(
                //   height: sizes!.heightRatio * 20,
                //   width: sizes!.widthRatio * 55,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5), color: appColor),
                //   child: Center(
                //     child: CustomText(
                //       text: "SAR $fees",
                //       textSize: sizes!.fontRatio * 10,
                //       fontWeight: FontWeight.normal,
                //       textColor: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/svg/bus_icon.svg",
                  height: sizes!.heightRatio * 24,
                  width: sizes!.widthRatio * 24,
                ),
                SizedBox(
                  width: sizes!.widthRatio * 140,
                  child: const Divider(
                    color: AppColors.primary,
                    thickness: 2,
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/bus_icon.svg",
                  height: sizes!.heightRatio * 24,
                  width: sizes!.widthRatio * 24,
                ),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.getGenericText(
                    text: "$timeFrom $fromCityName",
                    fontFamily: Assets.latoRegular,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
                TextView.getGenericText(
                    text: "$timeTo $toCityName",
                    fontFamily: Assets.latoRegular,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black900,
                    lines: 1),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextView.getGenericText(
                    text: stationA,
                    fontFamily: Assets.latoRegular,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                    lines: 1),
                TextView.getGenericText(
                    text: "$stops Stops",
                    fontFamily: Assets.latoRegular,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                    lines: 1),
                TextView.getGenericText(
                    text: stationB,
                    fontFamily: Assets.latoRegular,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray,
                    lines: 1),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 230,
                  child: additionals.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: additionals.length,
                          itemBuilder: (context, index) {
                            // var data = additionals[index].en;
                            var data = additionals[index].ar;

                            return CustomText(
                              text: "$data, ",
                              textSize: sizes!.fontRatio * 14,
                              fontWeight: FontWeight.w500,
                              textColor: AppColors.black900,
                            );
                          },
                        )
                      : Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: AppLocalizations.of(context)!.no_data,
                            textSize: sizes!.fontRatio * 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black900,
                          ),
                        ),
                ),
                CommonPadding.sizeBoxWithWidth(width: 4),
                Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: appColor),
                  child: Center(
                    child: CustomText(
                      text: "SAR $fees",
                      textSize: sizes!.fontRatio * 10,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
