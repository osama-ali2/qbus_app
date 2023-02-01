import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';
import 'booking_history_provider.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  late BookingHistoryProvider bookingHistoryProvider;

  late ScrollController _scrollController;
  int userRating = 0;
  int offsetIndex = 1;

  @override
  void initState() {
    super.initState();
    bookingHistoryProvider = BookingHistoryProvider();
    bookingHistoryProvider =
        Provider.of<BookingHistoryProvider>(context, listen: false);
    bookingHistoryProvider.init(context: context);

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        debugPrint("Ending...");
        setState(() {
          offsetIndex++;
          debugPrint("EndingIndex: $offsetIndex");
        });
        bookingHistoryProvider.getTripBookingHistoryData(offSet: offsetIndex);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookingHistoryProvider.getTripBookingHistoryData(offSet: offsetIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<BookingHistoryProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Trip History",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          width: sizes!.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookingHistoryProvider.isTripHistoryLoaded == true
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: bookingHistoryProvider
                            .tripHistoryResponse.data!.length,
                        itemBuilder: (context, index) {
                          var data = bookingHistoryProvider
                              .tripHistoryResponse.data![index];
                          var fromCity = data.startStationName!.en!.toString();
                          var toCity = data.arrivalStationName!.en!.toString();
                          var timeFromCity = data.timeFrom.toString();
                          var timeToCity = data.timeTo.toString();
                          var fee = data.fees.toString();
                          var rating = data.review.toString();
                          var type = data.status.toString();
                          var trip = data.providerName.toString();

                          var isUserAllowReview = data.isUserAllowReview;

                          var tripId = data.tripId;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizes!.widthRatio * 20,
                                vertical: sizes!.heightRatio * 5),
                            child: _bookingContainer(
                                fromCity: fromCity,
                                toCity: toCity,
                                fee: fee,
                                trip: trip,
                                rating: rating,
                                type: type,
                                timeFromCity: timeFromCity,
                                timeToCity: timeToCity,
                                onReviewIt: () {
                                  showAlertDialog(
                                      context: context, tripId: tripId!);
                                },
                                isUserAllowReview: isUserAllowReview!),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text("No Data Available"),
                    ),
              CommonPadding.sizeBoxWithHeight(height: 10),
              //TODO: Uncomment Package History Screen later when needed
              // CustomButton(
              //     name: "Package History",
              //     buttonColor: appColor,
              //     height: sizes!.heightRatio * 45,
              //     width: double.infinity,
              //     textSize: sizes!.fontRatio * 14,
              //     textColor: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     borderRadius: 5,
              //     onTapped: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const PackageHistoryScreen(),
              //         ),
              //       );
              //     },
              //     padding: 20),
              // CommonPadding.sizeBoxWithHeight(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  /// Booking Container
  Widget _bookingContainer({
    required String timeFromCity,
    required String fromCity,
    required String timeToCity,
    required String toCity,
    required String fee,
    required String trip,
    required String rating,
    required String type,
    required Function? onReviewIt,
    required bool isUserAllowReview,
  }) =>
      Container(
        height: sizes!.heightRatio * 190,
        width: sizes!.width,
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
              horizontal: sizes!.widthRatio * 10,
              vertical: sizes!.heightRatio * 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView.getGenericText(
                      text: trip,
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
                          text: rating,
                          textSize: sizes!.fontRatio * 16,
                          fontWeight: FontWeight.normal,
                          textColor: const Color(0xff747268)),
                    ],
                  ),
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
                    width: sizes!.widthRatio * 160,
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
                      text: "$timeFromCity $fromCity",
                      fontFamily: Assets.latoRegular,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                      lines: 1),
                  TextView.getGenericText(
                      text: "$timeToCity $toCity",
                      fontFamily: Assets.latoRegular,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                      lines: 1),
                ],
              ),
              CommonPadding.sizeBoxWithHeight(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextView.getGenericText(
                      text: "stationA",
                      fontFamily: Assets.latoRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                      lines: 1),
                  TextView.getGenericText(
                      text: "1 Stops",
                      fontFamily: Assets.latoRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                      lines: 1),
                  TextView.getGenericText(
                      text: "stationB",
                      fontFamily: Assets.latoRegular,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                      lines: 1),
                ],
              ),
              CommonPadding.sizeBoxWithHeight(height: 15),
              Row(
                children: [
                  Container(
                    height: sizes!.heightRatio * 20,
                    width: sizes!.widthRatio * 54,
                    decoration: BoxDecoration(
                        // color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: AppColors.greenTextColor, width: 1)),
                    child: Center(
                      child: TextView.getText10(type, Assets.latoRegular,
                          color: AppColors.greenTextColor, lines: 1),
                    ),
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 10),
                  isUserAllowReview == true
                      ? GestureDetector(
                          onTap: () {
                            if (onReviewIt != null) {
                              onReviewIt.call();
                            }
                          },
                          child: Container(
                            height: sizes!.heightRatio * 20,
                            width: sizes!.widthRatio * 54,
                            decoration: BoxDecoration(
                                // color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: AppColors.primary, width: 1)),
                            child: Center(
                              child: TextView.getText10(
                                  "review it", Assets.latoRegular,
                                  color: AppColors.primary, lines: 1),
                            ),
                          ),
                        )
                      : Container(),
                  const Spacer(),
                  Container(
                    height: sizes!.heightRatio * 20,
                    width: sizes!.widthRatio * 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appColor),
                    child: Center(
                      child: CustomText(
                          text: "SAR $fee",
                          textSize: sizes!.fontRatio * 10,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> showAlertDialog(
      {required BuildContext context, required int tripId}) async {
    // set up the buttons

    Widget continueButton = Container(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10),
      width: sizes!.widthRatio * 240,
      height: sizes!.heightRatio * 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary,
      ),
      child: TextButton(
        child: TextView.getRegularS17W400Text("Rate it", Assets.latoRegular,
            color: AppColors.white, lines: 1),
        onPressed: () async {
          //validateForumPost();

          await bookingHistoryProvider.markTripRating(
              tripId: tripId, rating: userRating);

          if (bookingHistoryProvider.isRatingMarked == true) {
            if (!mounted) return;
            Navigator.pop(context);
          }
        },
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: TextView.getRegularS17W400Text(
          "Rate your experience", Assets.latoBold,
          color: AppColors.black900, lines: 1),
      content: SizedBox(
          height: sizes!.heightRatio * 60,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  RatingBar.builder(
                    initialRating: 3.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 50,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: false,
                    onRatingUpdate: (rating) {
                      // onPress!.call(rating);
                      setState(() {
                        userRating = rating.toInt();
                        debugPrint("Rating: $rating");
                      });
                    },
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                ],
              );
            },
          )),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
