// Created by Tayyab Mughal on 01/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/widgets/custom_text.dart';

import '../../utils/constant.dart';

class PackageCardContainerWidget extends StatelessWidget {
  final String title;
  final String rating;
  final String fee;
  final String dateFrom;
  final String detail;
  final String image;

  const PackageCardContainerWidget(
      {Key? key,
      required this.title,
      required this.rating,
      required this.fee,
      required this.dateFrom,
      required this.detail,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizes!.heightRatio * 100,
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
        children: [
          Container(
            height: sizes!.heightRatio * 90,
            width: sizes!.widthRatio * 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                image,
                height: sizes!.heightRatio * 100,
                width: sizes!.widthRatio * 140,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  text: title,
                  textSize: sizes!.fontRatio * 14,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              SizedBox(
                height: sizes!.heightRatio * 30,
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomText(
                  text: "$detail...",
                  textSize: sizes!.fontRatio * 10,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              CustomText(
                text: dateFrom,
                textSize: sizes!.fontRatio * 10,
                fontWeight: FontWeight.normal,
                textColor: Colors.black,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: sizes!.heightRatio * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 22,
                      ),
                      CustomText(
                          text: "$rating/5",
                          textSize: sizes!.fontRatio * 12,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.black)
                    ],
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 85),
                  Container(
                    height: sizes!.heightRatio * 20,
                    width: sizes!.widthRatio * 60,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: CustomText(
                          text: "SAR $fee",
                          textSize: sizes!.fontRatio * 10,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.white),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
