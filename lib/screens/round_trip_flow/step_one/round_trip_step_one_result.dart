import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/round_trip_flow/step_one/step_one_select_addition/step_one_select_addition_screen.dart';
import 'package:qbus/screens/trip_filter_screens/trip_filter_screen.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../project_widgets/filter_container_widget.dart';
import '../../project_widgets/trip_card_container_widget.dart';
import 'round_trip_passenger_screens/round_trip_passenger_screen.dart';
import 'round_trip_step_one_provider.dart';

class RoundTripStepOneResult extends StatefulWidget {
  final TripFilterModel? tripFilterModel;
  final String? fromCity;
  final String? toCity;
  final bool? isRoundTripChecked;
  final String? passengersCount;

  const RoundTripStepOneResult(
      {Key? key,
      this.tripFilterModel,
      this.fromCity,
      this.toCity,
      this.isRoundTripChecked,
      this.passengersCount})
      : super(key: key);

  @override
  State<RoundTripStepOneResult> createState() => _RoundTripStepOneResultState();
}

class _RoundTripStepOneResultState extends State<RoundTripStepOneResult> {
  late RoundTripStepOneProvider searchProvider;
  late ScrollController _scrollController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    searchProvider = RoundTripStepOneProvider();
    searchProvider =
        Provider.of<RoundTripStepOneProvider>(context, listen: false);
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

    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RoundTripStepOneProvider>(context, listen: true);
    return Scaffold(
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
                    child: searchProvider.tripsResponse.data!.trips!.isNotEmpty
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: searchProvider
                                .tripsResponse.data!.trips!.length,
                            itemBuilder: (context, i) {
                              var data =
                                  searchProvider.tripsResponse.data!.trips![i];
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

                              return GestureDetector(
                                  onTap: () {
                                    if (data.additionals!.isEmpty) {
                                      debugPrint(
                                          "roundTripAdditional:${data.additionals!.isEmpty}");
                                      debugPrint(
                                          "roundTripHotels:${data.hotels!.isEmpty}");

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RoundTripPassengerScreen(
                                            isHotelEmpty: data.hotels!.isEmpty,
                                            passengerCount: int.parse(
                                                widget.passengersCount!),
                                            tripId: int.parse(tripId),
                                            additionalList: const [],
                                            tripFilterModel:
                                                widget.tripFilterModel!,
                                            fromCity: widget.fromCity!,
                                            toCity: widget.toCity!,
                                            isRoundTripChecked:
                                                widget.isRoundTripChecked!,
                                            firstTripModel: data,
                                            tripFirstPassengersCount: widget
                                                .passengersCount
                                                .toString(),
                                            tripFirstAdditionalList: const [],
                                          ),
                                        ),
                                      );
                                    } else {
                                      NavigationHelper.pushRoute(
                                        context,
                                        StepOneSelectAdditionScreen(
                                          isHotelEmpty: data.hotels!.isEmpty,
                                          tripId: tripId,
                                          firstTripsModel: data,
                                          isRoundTripChecked:
                                              widget.isRoundTripChecked,
                                          passengersCount:
                                              widget.passengersCount,
                                          toCityId: widget
                                              .tripFilterModel!.to_city_id,
                                          fromCityId: widget
                                              .tripFilterModel!.from_city_id,
                                          tripFilterModel:
                                              widget.tripFilterModel,
                                          fromCity: widget.fromCity,
                                          toCity: widget.toCity,
                                        ),
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: sizes!.heightRatio * 5),
                                    child: TripCardContainerWidget(
                                      // context: context,
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
                                  ));
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
    );
  }
}
