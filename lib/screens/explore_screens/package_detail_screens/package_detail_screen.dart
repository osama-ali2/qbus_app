import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/toasts.dart';

import '../../../res/assets.dart';
import '../../../res/colors.dart';
import '../../../res/common_padding.dart';
import '../../../res/res.dart';
import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/text_views.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          title: CustomText(
              text: "Package Detail",
              textSize: sizes!.fontRatio * 18,
              fontWeight: FontWeight.w700,
              textColor: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            height: sizes!.height,
            width: sizes!.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: sizes!.heightRatio * 185,
                  width: sizes!.widthRatio * 375,
                  decoration: const BoxDecoration(
                    color: AppColors.gray100,
                  ),
                  child: Image.asset(
                    "assets/png/thumbnail.png",
                    fit: BoxFit.fill,
                    height: sizes!.heightRatio * 185,
                    width: sizes!.widthRatio * 375,
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 16),
                Row(
                  children: [
                    TextView.getMediumText16("South Korea", Assets.latoRegular,
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    const Spacer(),
                    SvgPicture.asset("assets/svg/star_icon.svg"),
                    TextView.getMediumText14("(4.8)", Assets.latoBold,
                        color: AppColors.gray300,
                        fontWeight: FontWeight.w400,
                        lines: 1),
                  ],
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 16),
                TextView.getMediumText14(
                  "Sed congue risus sit amet massa suscipit travel bibendum. Sed vulputate nec dolor at a tempus. Vestibulum a dolor posuere sapien laoreet trip a iaculis sit amet nec ipsum. Integer ac sapien on orci. Etiam quis neque eros. Sed enim an mauris, viverra sit amet velit non, maximus ullamcorper mauris. Sed fringilla velit a mollis vehicul travel.",
                  Assets.latoBold,
                  color: AppColors.gray300,
                  fontWeight: FontWeight.w400,
                  lines: 10,
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 16),
                TextView.getMediumText16("Additions", Assets.latoBold,
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500,
                        lines: 1)
                    .get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: sizes!.heightRatio * 34,
                      width: sizes!.widthRatio * 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextView.getMediumText14(
                            "Meals", Assets.latoBold,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            lines: 1),
                      ),
                    ),
                    Container(
                      height: sizes!.heightRatio * 34,
                      width: sizes!.widthRatio * 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextView.getMediumText14(
                            "Hotel", Assets.latoBold,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            lines: 1),
                      ),
                    ),
                    Container(
                      height: sizes!.heightRatio * 34,
                      width: sizes!.widthRatio * 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextView.getMediumText14(
                            "Drinks", Assets.latoBold,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            lines: 1),
                      ),
                    )
                  ],
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 16),
                TextView.getMediumText16(
                        "Departure Date  : 10 Dec 2022", Assets.latoBold,
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500,
                        lines: 1)
                    .get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 8),
                TextView.getMediumText14(
                        "Time From: 10:00 AM", Assets.latoRegular,
                        color: AppColors.gray300,
                        fontWeight: FontWeight.w400,
                        lines: 1)
                    .get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomButton(
                        name: "Book Now",
                        buttonColor: appColor,
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        textSize: sizes!.fontRatio * 16,
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        borderRadius: 5,
                        onTapped: () {
                          Toasts.getErrorToast(text: "Try it later");
                        },
                        padding: 0)
                    .get20HorizontalPadding(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
