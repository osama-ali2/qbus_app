import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';
import '../package_passenger_screens/package_passenger_screen.dart';
import '../package_select_addition_screens/package_select_addition_screen.dart';
import 'package_detail_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackageDetailScreen extends StatefulWidget {
  final String? packageTitle;
  final String? packageId;
  final bool isHotelTripeOneEmpty;
  final int firstTripId;
  final int secondTripId;
  final bool isHotelRoomTripOneEmpty;
  final bool isHotelRoomTripTwoEmpty;

  const PackageDetailScreen({
    Key? key,
    this.packageTitle,
    this.packageId,
    required this.isHotelTripeOneEmpty,
    required this.firstTripId,
    required this.secondTripId,
    required this.isHotelRoomTripOneEmpty,
    required this.isHotelRoomTripTwoEmpty,
  }) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  late PackageDetailProvider packageDetailProvider;
  int passengersNumber = 1;

  @override
  void initState() {
    super.initState();

    packageDetailProvider = PackageDetailProvider();
    packageDetailProvider =
        Provider.of<PackageDetailProvider>(context, listen: false);
    packageDetailProvider.init(context: context);

    debugPrint("widget.packageId!: ${widget.packageId!}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageDetailProvider.getPackagesDetail(id: widget.packageId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageDetailProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: CustomText(
          text: widget.packageTitle ??
              AppLocalizations.of(context)!.package_detail,
          textSize: sizes!.fontRatio * 18,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: AppColors.white,
            height: sizes!.height,
            width: sizes!.width,
            child: packageDetailProvider.isDataLoaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: sizes!.heightRatio * 185,
                        width: sizes!.widthRatio * 375,
                        decoration: const BoxDecoration(
                          color: AppColors.gray100,
                        ),
                        child: CachedNetworkImage(
                          height: sizes!.heightRatio * 185,
                          width: sizes!.widthRatio * 375,
                          fit: BoxFit.cover,
                          imageUrl:
                              "${packageDetailProvider.packageDetailResponse.data!.imageBase}/${packageDetailProvider.packageDetailResponse.data!.packages!.image.toString()}",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: SizedBox(
                              height: sizes!.heightRatio * 20,
                              width: sizes!.widthRatio * 20,
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      CommonPadding.sizeBoxWithHeight(height: 16),
                      Row(
                        children: [
                          TextView.getMediumText16(
                            // packageDetailProvider.packageDetailResponse.data!
                            //         .packages!.name!.en
                            packageDetailProvider.packageDetailResponse.data!
                                    .packages!.name!.ar ??
                                "South Korea",
                            Assets.latoRegular,
                            color: AppColors.black900,
                            fontWeight: FontWeight.w500,
                            lines: 1,
                          ),
                          const Spacer(),
                          SvgPicture.asset("assets/svg/star_icon.svg"),
                          TextView.getMediumText14(
                            packageDetailProvider
                                .packageDetailResponse.data!.packages!.rate
                                .toString(),
                            Assets.latoBold,
                            color: AppColors.gray300,
                            fontWeight: FontWeight.w400,
                            lines: 1,
                          ),
                        ],
                      ).get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 16),
                      TextView.getMediumText14(
                        // packageDetailProvider.packageDetailResponse.data!
                        //         .packages!.description!.en

                        packageDetailProvider.packageDetailResponse.data!
                                .packages?.description ??
                            "Sed congue risus sit amet massa suscipit travel bibendum. Sed vulputate nec dolor at a tempus. Vestibulum a dolor posuere sapien laoreet trip a iaculis sit amet nec ipsum. Integer ac sapien on orci. Etiam quis neque eros. Sed enim an mauris, viverra sit amet velit non, maximus ullamcorper mauris. Sed fringilla velit a mollis vehicul travel.",
                        Assets.latoBold,
                        color: AppColors.gray300,
                        fontWeight: FontWeight.w400,
                        lines: 10,
                      ).get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 12),
                      TextView.getMediumText16(
                        AppLocalizations.of(context)!.additions,
                        Assets.latoBold,
                        color: AppColors.black900,
                        fontWeight: FontWeight.w500,
                        lines: 1,
                      ).get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 12),
                      SizedBox(
                        height: sizes!.heightRatio * 60,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 9 / 6,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: packageDetailProvider
                                .packageDetailResponse
                                .data!
                                .packages!
                                .additionals!
                                .length,
                            itemBuilder: (context, index) {
                              // var name = packageDetailProvider
                              //     .packageDetailResponse
                              //     .data!
                              //     .packages!
                              //     .additionals![index]
                              //     .name!
                              //     .en
                              //     .toString();

                              var name = packageDetailProvider
                                  .packageDetailResponse
                                  .data!
                                  .packages!
                                  .additionals![index]
                                  .name!
                                  .ar
                                  .toString();

                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: TextView.getMediumText14(
                                    name,
                                    Assets.latoBold,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    lines: 1,
                                  ),
                                ),
                              );
                            }),
                      ).get20HorizontalPadding(),
                      // CommonPadding.sizeBoxWithHeight(height: 16),
                      TextView.getMediumText16(
                              "Departure Date: ${packageDetailProvider.packageDetailResponse.data!.packages!.dateFrom.toString()}",
                              Assets.latoBold,
                              color: AppColors.black900,
                              fontWeight: FontWeight.w500,
                              lines: 1)
                          .get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 8),
                      TextView.getMediumText14(
                        "Time From: ${packageDetailProvider.packageDetailResponse.data!.packages!.timeFrom}",
                        Assets.latoRegular,
                        color: AppColors.gray300,
                        fontWeight: FontWeight.w400,
                        lines: 1,
                      ).get20HorizontalPadding(),
                      SizedBox(
                        height: sizes!.heightRatio * 20,
                      ),
                      CustomText(
                        text: AppLocalizations.of(context)!.passengers_count,
                        textSize: sizes!.fontRatio * 14,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black,
                      ).get20HorizontalPadding(),
                      SizedBox(
                        height: sizes!.heightRatio * 10,
                      ),
                      Counter(
                          number: passengersNumber,
                          onAdd: () {
                            if (passengersNumber > 9) {
                              Toasts.getWarningToast(
                                  text: AppLocalizations.of(context)!
                                      .only_10_Passengers_allowed);
                            } else {
                              passengersNumber++;
                              setState(() {});
                            }
                          },
                          onMinus: () {
                            if (passengersNumber > 1) {
                              passengersNumber--;
                              setState(() {});
                            }
                          }).get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 40),
                      CustomButton(
                        name: AppLocalizations.of(context)!.book_now,
                        buttonColor: appColor,
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        textSize: sizes!.fontRatio * 16,
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        borderRadius: 5,
                        onTapped: () {
                          var packageId = packageDetailProvider
                              .packageDetailResponse.data!.packages!.id
                              .toString();

                          if (packageDetailProvider.packageDetailResponse.data!
                              .packages!.additionals!.isNotEmpty) {
                            /// Navigate to Package Select Addition Screen
                            debugPrint(
                                "packageDetail:$passengersNumber, $packageId");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PackageSelectAdditionScreen(
                                  packageId: packageId,
                                  passengerCount: passengersNumber,
                                  isHotelTripeOneEmpty:
                                      widget.isHotelTripeOneEmpty,
                                  firstTripId: widget.firstTripId,
                                  secondTripId: widget.secondTripId,
                                  isHotelRoomTripOneEmpty:
                                      widget.isHotelRoomTripOneEmpty,
                                  isHotelRoomTripTwoEmpty:
                                      widget.isHotelRoomTripTwoEmpty,
                                ),
                              ),
                            );
                          } else {
                            /// Navigator to Package Passenger Screen
                            debugPrint(
                                "packageDetail:$passengersNumber, $packageId");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PackagePassengerScreen(
                                    passengerCount: passengersNumber,
                                    packageId: int.parse(packageId),
                                    additionalList: [],
                                    isHotelTripeOneEmpty:
                                        widget.isHotelTripeOneEmpty,
                                    firstTripId: widget.firstTripId,
                                    secondTripId: widget.secondTripId,
                                    isHotelRoomTripOneEmpty:
                                        widget.isHotelRoomTripOneEmpty,
                                    isHotelRoomTripTwoEmpty:
                                        widget.isHotelRoomTripTwoEmpty,
                                  ),
                                ));
                          }
                        },
                        padding: 0,
                      ).get20HorizontalPadding(),
                      CommonPadding.sizeBoxWithHeight(height: 20),
                    ],
                  )
                : Center(
                    child: TextView.getMediumText14(
                      AppLocalizations.of(context)!.no_data,
                      Assets.latoRegular,
                      color: AppColors.gray300,
                      fontWeight: FontWeight.w400,
                      lines: 1,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
