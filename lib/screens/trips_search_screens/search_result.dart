import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/trip_filter_screens/trip_filter_screen.dart';

import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../models/trips/TripsResponse.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_views.dart';
import '../selectAddition/select_addition_screen.dart';
import 'search_provider.dart';

class SearchResult extends StatefulWidget {
  final TripFilterModel? tripFilterModel;
  final String? fromCity;
  final String? toCity;
  final bool? isOneWayTripChecked;
  final bool? isRoundTripChecked;
  final bool? isMultiDestinationChecked;
  final String? passengersCount;

  const SearchResult(
      {Key? key,
      this.tripFilterModel,
      this.fromCity,
      this.toCity,
      this.isOneWayTripChecked,
      this.isRoundTripChecked,
      this.isMultiDestinationChecked,
      this.passengersCount})
      : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late SearchProvider searchProvider;
  late ScrollController _scrollController;
  int index = 0;

  final demList = [
    {"en: AC"},
    {"en": "Hotel 3Stars"},
  ];

  @override
  void initState() {
    super.initState();

    searchProvider = SearchProvider();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.init(context: context);

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        debugPrint("Ending...");
        setState(() {
          index++;
          debugPrint("EndingIndex: $index");
        });
        searchProvider.getTripsData(
            tripFilterModel: widget.tripFilterModel!, offset: index);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchProvider.getTripsData(
          tripFilterModel: widget.tripFilterModel!, offset: index);
    });

    debugPrint("isOneWayTripChecked: ${widget.isOneWayTripChecked}");
    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
    debugPrint(
        "isMultiDestinationChecked: ${widget.isMultiDestinationChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          centerTitle: false,
          title: CustomText(
              text: "${widget.fromCity ?? ""} - ${widget.toCity ?? ""}",
              textSize: 18,
              fontWeight: FontWeight.w400,
              textColor: Colors.white),
        ),
        body: searchProvider.isTripDataLoaded
            ? SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: searchProvider
                              .tripsResponse.data!.trips!.isNotEmpty
                          ? ListView.builder(
                              controller: _scrollController,
                              itemCount: searchProvider
                                  .tripsResponse.data!.trips!.length,
                              itemBuilder: (context, i) {
                                var data = searchProvider
                                    .tripsResponse.data!.trips![i];
                                var stationA =
                                    data.startStationName!.en.toString();
                                var stationB =
                                    data.arrivalStationName!.en.toString();
                                var fees = data.fees.toString();
                                var rate = data.rate.toString();
                                var fromCityName =
                                    data.fromCityName!.en.toString();
                                var toCityName = data.toCityName!.en.toString();
                                var timeFrom = data.timeFrom.toString();
                                var timeTo = data.timeTo.toString();
                                var stops = data.stops.toString();
                                var providerName = data.providerName.toString();

                                var tripId = data.id.toString();

                                return InkWell(
                                    onTap: () {
                                      NavigationHelper.pushRoute(
                                        context,
                                        SelectAdditionScreen(
                                          tripId: tripId,
                                          tripsModel: data,
                                          isRoundTripChecked:
                                              widget.isRoundTripChecked,
                                          isOneWayTripChecked:
                                              widget.isOneWayTripChecked,
                                          isMultiDestinationChecked:
                                              widget.isMultiDestinationChecked,
                                          passengersCount:
                                              widget.passengersCount,
                                          toCityId: widget
                                              .tripFilterModel!.to_city_id,
                                          fromCityId: widget
                                              .tripFilterModel!.from_city_id,
                                        ),
                                      );
                                    },
                                    child: _redesignCardContainer(
                                        stationA: stationA,
                                        stationB: stationB,
                                        fees: fees,
                                        rate: rate,
                                        fromCityName: fromCityName,
                                        toCityName: toCityName,
                                        timeFrom: timeFrom,
                                        timeTo: timeTo,
                                        stops: stops,
                                        providerName: providerName,
                                        additionals: data.additionals!));
                              })
                          : Center(
                              child: TextView.getSubHeadingTextWith15(
                                  "No Data Available", Assets.latoBold,
                                  color: AppColors.blueHomeColor,
                                  lines: 1,
                                  fontWeight: FontWeight.normal),
                            ),
                    ),
                    CommonPadding.sizeBoxWithHeight(height: 10),
                    searchProvider.isTripDataLoaded
                        ? CustomButton(
                                name: "Filter Result",
                                buttonColor: appColor,
                                height: sizes!.heightRatio * 45,
                                width: double.infinity,
                                textSize: sizes!.fontRatio * 16,
                                textColor: Colors.white,
                                fontWeight: FontWeight.normal,
                                borderRadius: 5,
                                onTapped: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TripFilterScreen(),
                                    ),
                                  );
                                },
                                padding: 0)
                            .get20HorizontalPadding()
                        : Container(),
                    CommonPadding.sizeBoxWithHeight(height: 10),
                  ],
                ),
              )
            : Center(
                child: TextView.getSubHeadingTextWith15(
                    "No Trip Available", Assets.latoBold,
                    color: AppColors.blueHomeColor,
                    lines: 1,
                    fontWeight: FontWeight.normal),
              ),
      ),
    );
  }

  Widget _redesignCardContainer({
    required String stationA,
    required String stationB,
    required String fees,
    required String rate,
    required String fromCityName,
    required String toCityName,
    required String timeFrom,
    required String timeTo,
    required String stops,
    required String providerName,
    required List<Additionals> additionals,
  }) =>
      Container(
        height: sizes!.heightRatio * 188,
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
              vertical: sizes!.heightRatio * 20),
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
                          textColor: const Color(0xff747268)),
                    ],
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 4),
                  Container(
                    height: sizes!.heightRatio * 20,
                    width: sizes!.widthRatio * 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: appColor),
                    child: Center(
                      child: CustomText(
                          text: "SAR $fees",
                          textSize: sizes!.fontRatio * 10,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.white),
                    ),
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
                      text: "$timeFrom $fromCityName",
                      fontFamily: Assets.latoRegular,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor,
                      lines: 1),
                  TextView.getGenericText(
                      text: "$timeTo $toCityName",
                      fontFamily: Assets.latoRegular,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor,
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
              SizedBox(
                height: sizes!.heightRatio * 20,
                // width: sizes!.widthRatio * 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: additionals.length,
                  itemBuilder: (context, index) {
                    var data = additionals[index].en;
                    return CustomText(
                        text: "$data/",
                        textSize: sizes!.fontRatio * 14,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey);
                  },
                ),
              ),
            ],
          ),
        ),
      ).get20HorizontalPadding();
}
