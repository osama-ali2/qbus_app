import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
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
                    CommonPadding.sizeBoxWithHeight(height: 10),
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
                                        passengersCount: widget.passengersCount,
                                        toCityId:
                                            widget.tripFilterModel!.to_city_id,
                                        fromCityId: widget
                                            .tripFilterModel!.from_city_id,
                                      ),
                                    );
                                  },
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
                                    additionals: data.additionals!,
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
                    // searchProvider.isTripDataLoaded
                    //     ? CustomButton(
                    //             name: "Filter Result",
                    //             buttonColor: appColor,
                    //             height: sizes!.heightRatio * 45,
                    //             width: double.infinity,
                    //             textSize: sizes!.fontRatio * 16,
                    //             textColor: Colors.white,
                    //             fontWeight: FontWeight.normal,
                    //             borderRadius: 5,
                    //             onTapped: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       const TripFilterScreen(),
                    //                 ),
                    //               );
                    //             },
                    //             padding: 0)
                    //         .get20HorizontalPadding()
                    //     : Container(),
                    // CommonPadding.sizeBoxWithHeight(height: 10),
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
