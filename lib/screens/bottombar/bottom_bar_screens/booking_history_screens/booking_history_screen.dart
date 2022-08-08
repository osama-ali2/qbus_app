import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/package_history_screens/package_history_screen.dart';

import '../../../../../res/assets.dart';
import '../../../../../res/colors.dart';
import '../../../../../res/common_padding.dart';
import '../../../../../res/res.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/text_views.dart';
import '../../../../widgets/custom_button.dart';
import 'booking_history_provider.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  late BookingHistoryProvider bookingHistoryProvider;

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
    bookingHistoryProvider = BookingHistoryProvider();
    bookingHistoryProvider =
        Provider.of<BookingHistoryProvider>(context, listen: false);
    bookingHistoryProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bookingHistoryProvider.getTripBookingHistoryData(offSet: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookingHistoryProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Trip History",
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
            bookingHistoryProvider.isTripHistoryLoaded == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount: bookingHistoryProvider
                          .tripHistoryResponse.data!.length,
                      itemBuilder: (context, index) {
                        var data = bookingHistoryProvider
                            .tripHistoryResponse.data![index];
                        var from = data.startStationName!.en!.toString();
                        var to = data.arrivalStationName!.en!.toString();
                        var fee = data.fees.toString();
                        var rating = data.review.toString();
                        var type = data.status.toString();
                        var trip = data.providerName.toString();

                        // var from = dataMap[index]['from'].toString();
                        // var to = dataMap[index]['to'].toString();
                        // var fee = dataMap[index]['fee'].toString();
                        // var trip = dataMap[index]['trip'].toString();
                        // var rating = dataMap[index]['rating'].toString();
                        // var type = dataMap[index]['type'].toString();

                        //     {
                        //   "from": "10:Makkah",
                        // "to": "12:30 Al Madina",
                        // "fee": "90",
                        // "trip": "Medina Trip",
                        // "rating": "(5/5)",
                        // "type": "Booked",
                        // },

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
                  )
                : const Center(
                    child: Text("No Data Available"),
                  ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            CustomButton(
                name: "Package History",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                borderRadius: 5,
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PackageHistoryScreen()));
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
              Container(
                  height: sizes!.heightRatio * 20,
                  width: sizes!.widthRatio * 54,
                  decoration: BoxDecoration(
                      // color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.primary, width: 1)),
                  child: Center(
                    child: TextView.getText10(type, Assets.latoRegular,
                        color: AppColors.primary, lines: 1),
                  ))
              // type == "Booked"
              //     ? Container(
              //         height: sizes!.heightRatio * 20,
              //         width: sizes!.widthRatio * 54,
              //         decoration: BoxDecoration(
              //             // color: AppColors.primary,
              //             borderRadius: BorderRadius.circular(5),
              //             border:
              //                 Border.all(color: AppColors.primary, width: 1)),
              //         child: Center(
              //           child: TextView.getText10(type, Assets.latoRegular,
              //               color: AppColors.primary, lines: 1),
              //         ))
              //     : Container(
              //         height: sizes!.heightRatio * 20,
              //         width: sizes!.widthRatio * 54,
              //         decoration: BoxDecoration(
              //             // color: AppColors.primary,
              //             borderRadius: BorderRadius.circular(5),
              //             border:
              //                 Border.all(color: AppColors.redColor, width: 1)),
              //         child: Center(
              //           child: TextView.getText10("Booked", Assets.latoRegular,
              //               color: AppColors.redColor, lines: 1),
              //         )),
            ],
          ),
        ),
      );
}
