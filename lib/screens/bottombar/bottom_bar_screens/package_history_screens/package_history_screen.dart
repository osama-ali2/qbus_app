import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  int userRating = 0;

  @override
  void initState() {
    super.initState();

    packageHistoryProvider = PackageHistoryProvider();
    packageHistoryProvider =
        Provider.of<PackageHistoryProvider>(context, listen: false);
    packageHistoryProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      packageHistoryProvider.getPackageBookingHistoryData(offSet: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageHistoryProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
          text: "Package History",
          textSize: 18,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          width: sizes!.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              packageHistoryProvider.isPackageHistoryLoaded == true
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: packageHistoryProvider
                            .packageHistoryResponse.data!.length,
                        itemBuilder: (context, index) {
                          var data = packageHistoryProvider
                              .packageHistoryResponse.data![index];
                          var from = data.startingCityName!.en!.toString();
                          var to = data.name!.en!.toString();
                          var fee = data.fees.toString();
                          var rating = data.review.toString();
                          var type = data.status.toString();
                          var trip = data.providerName.toString();
                          var packageId = data.packageId;

                          var startingTime = data.startingTime.toString();
                          var startCityName =
                              data.startingCityName!.en.toString();
                          var startingDate = data.startingDate.toString();

                          var isUserAllowReview = data.isUserAllowReview!;

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sizes!.widthRatio * 20,
                                vertical: sizes!.heightRatio * 5),
                            child: _bookingContainer(
                              startingTime: startingTime,
                              startCityName: startCityName,
                              startingDate: startingDate,
                              from: from,
                              to: to,
                              fee: fee,
                              trip: trip,
                              rating: rating,
                              type: type,
                              isUserAllowReview: isUserAllowReview,
                              onReviewIt: () {
                                showAlertDialog(
                                    context: context, packageId: packageId!);
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text("No Data Available"),
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
      ),
    );
  }

  Widget _bookingContainer(
          {required String from,
          required String to,
          required String fee,
          required String trip,
          required String rating,
          required String type,
          required Function? onReviewIt,
          required bool isUserAllowReview,
          required String startingDate,
          required String startingTime,
          required String startCityName}) =>
      Container(
        height: sizes!.heightRatio * 115,
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
                    TextView.getMediumText14(
                        "$startingDate $startingTime $startCityName",
                        Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w300,
                        lines: 1),
                    // SvgPicture.asset(
                    //   "assets/svg/skip_icon.svg",
                    //   height: sizes!.heightRatio * 24,
                    //   width: sizes!.widthRatio * 24,
                    // ),
                    // TextView.getMediumText14(to, Assets.latoRegular,
                    //     color: AppColors.gray100,
                    //     fontWeight: FontWeight.w300,
                    //     lines: 1),
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
                    TextView.getMediumText14("($rating/5)", Assets.latoRegular,
                        color: AppColors.gray100,
                        fontWeight: FontWeight.w400,
                        lines: 1),
                  ],
                ),
              ),
              // CommonPadding.sizeBoxWithHeight(height: 10),
              TextView.getMediumText14(to, Assets.latoRegular,
                  color: AppColors.gray100,
                  fontWeight: FontWeight.w300,
                  lines: 1),
              CommonPadding.sizeBoxWithHeight(height: 10),
              Row(
                children: [
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
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> showAlertDialog(
      {required BuildContext context, required int packageId}) async {
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
          await packageHistoryProvider.markPackageRating(
              packageId: packageId, rating: userRating);

          if (packageHistoryProvider.isRatingMarked == true) {
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
