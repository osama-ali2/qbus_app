import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/package_history_screens/package_history_provider.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/res.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/text_views.dart';

class PackageHistoryScreen extends StatefulWidget {
  const PackageHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PackageHistoryScreen> createState() => _PackageHistoryScreenState();
}

class _PackageHistoryScreenState extends State<PackageHistoryScreen> {
  late PackageHistoryProvider packageHistoryProvider;

  final dataMap = [
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Jeddah Trip",
      "rating": "(3/5)",
      "type": "Canceled",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Jeddah Trip",
      "rating": "(3/5)",
      "type": "Canceled",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Jeddah Trip",
      "rating": "(3/5)",
      "type": "Canceled",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Jeddah Trip",
      "rating": "(3/5)",
      "type": "Canceled",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Medina Trip",
      "rating": "(3/5)",
      "type": "Booked",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Medina Trip",
      "rating": "(4/5)",
      "type": "Booked",
    },
    {
      "from": "10:Makkah",
      "to": "12:30 Al Madina",
      "fee": "90",
      "trip": "Medina Trip",
      "rating": "(5/5)",
      "type": "Booked",
    },
  ];

  @override
  void initState() {
    super.initState();

    packageHistoryProvider = PackageHistoryProvider();
    packageHistoryProvider =
        Provider.of<PackageHistoryProvider>(context, listen: false);
    packageHistoryProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageHistoryProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
            text: "Package History",
            //AppLocalizations.of(context)!.booking_history,
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: Container(
        color: AppColors.white,
        // height: sizes!.height,
        width: sizes!.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CommonPadding.sizeBoxWithHeight(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dataMap.length,
                itemBuilder: (context, index) {
                  var from = dataMap[index]['from'].toString();
                  var to = dataMap[index]['to'].toString();
                  var fee = dataMap[index]['fee'].toString();
                  var trip = dataMap[index]['trip'].toString();
                  var rating = dataMap[index]['rating'].toString();
                  var type = dataMap[index]['type'].toString();

                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizes!.widthRatio * 20,
                        vertical: sizes!.heightRatio * 5),
                    child: _bookingContainer(
                        from: from,
                        to: to,
                        fee: fee,
                        trip: trip,
                        rating: rating,
                        type: type),
                  );
                },
              ),
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            CustomButton(
                name: "Trip History",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                borderRadius: 5,
                onTapped: () {
                  Navigator.pop(context);
                },
                padding: 20),
            CommonPadding.sizeBoxWithHeight(height: 10),
          ],
        ),
      ),
    ));
  }

  Widget _bookingContainer({
    required String from,
    required String to,
    required String fee,
    required String trip,
    required String rating,
    required String type,
  }) =>
      Container(
        height: sizes!.heightRatio * 110,
        width: sizes!.widthRatio * 375,
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizes!.widthRatio * 15,
              vertical: sizes!.heightRatio * 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView.getMediumText14(from, Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w300,
                        lines: 1),
                    SvgPicture.asset(
                      "assets/svg/skip_icon.svg",
                      height: sizes!.heightRatio * 24,
                      width: sizes!.widthRatio * 24,
                    ),
                    TextView.getMediumText14(to, Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w300,
                        lines: 1),
                    const Spacer(),
                    Container(
                      height: sizes!.heightRatio * 20,
                      width: sizes!.widthRatio * 54,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextView.getText10(
                            "SAR $fee", Assets.latoRegular,
                            color: AppColors.white, lines: 1),
                      ),
                    )
                  ],
                ),
              ),
              CommonPadding.sizeBoxWithHeight(height: 10),
              Expanded(
                child: Row(
                  children: [
                    TextView.getMediumText16(trip, Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    const Spacer(),
                    SvgPicture.asset("assets/svg/star_icon.svg"),
                    CommonPadding.sizeBoxWithWidth(width: 4),
                    TextView.getMediumText14(rating, Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w400,
                        lines: 1),
                  ],
                ),
              ),
              CommonPadding.sizeBoxWithHeight(height: 10),
              type == "Booked"
                  ? Container(
                      height: sizes!.heightRatio * 20,
                      width: sizes!.widthRatio * 54,
                      decoration: BoxDecoration(
                          // color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.primary, width: 1)),
                      child: Center(
                        child: TextView.getText10("Booked", Assets.latoRegular,
                            color: AppColors.primary, lines: 1),
                      ))
                  : Container(
                      height: sizes!.heightRatio * 20,
                      width: sizes!.widthRatio * 54,
                      decoration: BoxDecoration(
                          // color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: AppColors.redColor, width: 1)),
                      child: Center(
                        child: TextView.getText10("Booked", Assets.latoRegular,
                            color: AppColors.redColor, lines: 1),
                      )),
            ],
          ),
        ),
      );
}
