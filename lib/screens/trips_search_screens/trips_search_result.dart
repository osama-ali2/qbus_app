import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/passenger_screens/passenger_screen.dart';
import 'package:qbus/screens/project_widgets/filter_container_widget.dart';
import 'package:qbus/screens/project_widgets/trip_card_container_widget.dart';
import 'package:qbus/screens/trip_filter_screens/trip_filter_screen.dart';

import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../widgets/text_views.dart';
import '../select_addition_screens/select_addition_screen.dart';
import 'trips_search_provider.dart';

class SearchResult extends StatefulWidget {
  final TripFilterModel? tripFilterModel;
  final String? fromCity;
  final String? toCity;
  final bool? isOneWayTripChecked;
  final bool? isRoundTripChecked;
  final bool? isMultiDestinationChecked;
  final String? passengersCount;

  const SearchResult({
    Key? key,
    this.tripFilterModel,
    this.fromCity,
    this.toCity,
    this.isOneWayTripChecked,
    this.isRoundTripChecked,
    this.isMultiDestinationChecked,
    this.passengersCount,
  }) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late SearchProvider searchProvider;
  late ScrollController _scrollController;
  int index = 0;

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
                    CommonPadding.sizeBoxWithHeight(height: 10),
                    FilterContainerWidget(onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TripFilterScreen(),
                        ),
                      );
                    }),
                    CommonPadding.sizeBoxWithHeight(height: 5),
                    Expanded(
                      child: searchProvider
                              .tripsResponse.data!.trips!.isNotEmpty
                          ? ListView.builder(
                              controller: _scrollController,
                              itemCount: searchProvider
                                  .tripsResponse.data!.trips!.length,
                              itemBuilder: (context, i) {
                                var tripData = searchProvider
                                    .tripsResponse.data!.trips![i];
                                var stationA =
                                    tripData.startStationName!.en.toString();
                                var stationB =
                                    tripData.arrivalStationName!.en.toString();
                                var fees = tripData.fees.toString();
                                var rate = tripData.rate.toString();
                                var fromCityName =
                                    tripData.fromCityName!.en.toString();
                                var toCityName =
                                    tripData.toCityName!.en.toString();
                                var timeFrom = tripData.timeFrom.toString();
                                var timeTo = tripData.timeTo.toString();
                                var stops = tripData.stops.toString();
                                var providerName =
                                    tripData.providerName.toString();

                                //var tripId = tripData.id.toString();

                                return InkWell(
                                  onTap: () {
                                    if (tripData.additionals!.isEmpty) {
                                      debugPrint(
                                          "tripData.additionals!.isEmpty:${tripData.additionals!.isEmpty}");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PassengerScreen(
                                            passengerCount: int.parse(
                                                widget.passengersCount!),
                                            tripId: tripData.id!,
                                            additionalList: const [],
                                          ),
                                        ),
                                      );
                                    } else {
                                      NavigationHelper.pushRoute(
                                        context,
                                        SelectAdditionScreen(
                                          tripsModel: tripData,
                                          isOneWayTripChecked:
                                              widget.isOneWayTripChecked!,
                                          isRoundTripChecked:
                                              widget.isRoundTripChecked!,
                                          isMultiDestinationChecked:
                                              widget.isMultiDestinationChecked!,
                                          passengersCount:
                                              widget.passengersCount!,
                                          toCityId: widget
                                              .tripFilterModel!.to_city_id!,
                                          fromCityId: widget
                                              .tripFilterModel!.from_city_id!,
                                        ),
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: sizes!.heightRatio * 4),
                                    child: TripCardContainerWidget(
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
                                      additionals: tripData.additionals!,
                                    ),
                                  ),
                                );
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
                  ],
                ).get20HorizontalPadding(),
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
}
