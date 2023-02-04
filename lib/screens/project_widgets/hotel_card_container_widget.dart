// Created by Tayyab Mughal on 07/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbus/resources/resources.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_text.dart';

class HotelCardContainerWidget extends StatelessWidget {
  final String hotelTitle;
  final String cityName;
  final String rent;

  final String roomType;
  final String hotelImage;

  final String houseNum;
  final String bedRoomNum;
  final int ratingNum;

  final Function onPlusBookingDayPress;
  final Function onMinusBookingDayPress;

  final Function onPlusRoomPress;
  final Function onMinusRoomPress;

  final int bookingDayCounter;
  final int numberOfRoomCounter;

  const HotelCardContainerWidget({
    Key? key,
    required this.hotelTitle,
    required this.cityName,
    required this.rent,
    required this.roomType,
    required this.hotelImage,
    required this.houseNum,
    required this.bedRoomNum,
    required this.ratingNum,
    required this.onPlusBookingDayPress,
    required this.onMinusBookingDayPress,
    required this.onPlusRoomPress,
    required this.onMinusRoomPress,
    required this.bookingDayCounter,
    required this.numberOfRoomCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes!.heightRatio * 142,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.containerShadowColor,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: sizes!.heightRatio * 114,
            width: sizes!.widthRatio * 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                hotelImage,
                height: sizes!.heightRatio * 100,
                width: sizes!.widthRatio * 140,
                fit: BoxFit.fill,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: sizes!.widthRatio * 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: hotelTitle,
                      textSize: sizes!.fontRatio * 14,
                      fontWeight: FontWeight.w700,
                      textColor: AppColors.black900),
                  CommonPadding.sizeBoxWithWidth(width: 40),
                  Container(
                    height: sizes!.heightRatio * 20,
                    width: sizes!.widthRatio * 60,
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomText(
                        text: "ريال $rent",
                        textSize: sizes!.fontRatio * 10,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                children: [
                  for (int i = 0; i < 1; i++)
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                  CommonPadding.sizeBoxWithWidth(width: 2),
                  CustomText(
                    text: "$ratingNum.0",
                    textSize: sizes!.fontRatio * 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/svg/location_icon.svg"),
                  CommonPadding.sizeBoxWithWidth(width: 4),
                  CustomText(
                    text: cityName,
                    textSize: sizes!.fontRatio * 12,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.gray,
                  ),
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: AppLocalizations.of(context)!.booking_days,
                      textSize: sizes!.fontRatio * 12,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.gray),
                  CommonPadding.sizeBoxWithWidth(width: 80),
                  Counter(
                    number: bookingDayCounter,
                    onAdd: () => onPlusBookingDayPress.call(),
                    onMinus: () => onMinusBookingDayPress.call(),
                  ),
                ],
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppLocalizations.of(context)!.number_of_rooms,
                    textSize: sizes!.fontRatio * 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.gray,
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 36),
                  Counter(
                    number: numberOfRoomCounter,
                    onAdd: () => onPlusRoomPress.call(),
                    onMinus: () => onMinusRoomPress.call(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
