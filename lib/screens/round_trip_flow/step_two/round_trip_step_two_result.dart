import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/project_widgets/trip_card_container_widget.dart';
import 'package:qbus/screens/round_trip_flow/step_two/step_two_select_addition/step_two_select_addition_provider.dart';
import 'package:qbus/screens/round_trip_flow/step_two/step_two_select_addition/step_two_select_addition_screen.dart';
import 'package:qbus/screens/trip_filter_screens/trip_filter_screen.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../project_widgets/filter_container_widget.dart';
import 'round_trip_review_order_screens/round_trip_review_order_screen.dart';
import 'round_trip_step_two_provider.dart';

class RoundTripStepTwoResult extends StatefulWidget {
  final TripFilterModel tripFilterModel;
  final String fromCity;
  final String toCity;
  final bool isRoundTripChecked;
  final Trips firstTripModel;
  final String tripFirstPassengersCount;
  final List<Map<String, dynamic>> tripFirstAdditionalList;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramHotelBody;

  const RoundTripStepTwoResult({
    Key? key,
    required this.tripFilterModel,
    required this.fromCity,
    required this.toCity,
    required this.isRoundTripChecked,
    // this.passengersCount,
    required this.firstTripModel,
    required this.tripFirstPassengersCount,
    required this.tripFirstAdditionalList,
    required this.paramPassengerBody,
    required this.paramHotelBody,
  }) : super(key: key);

  @override
  State<RoundTripStepTwoResult> createState() => _RoundTripStepTwoResultState();
}

class _RoundTripStepTwoResultState extends State<RoundTripStepTwoResult> {
  late RoundTripStepTwoProvider roundTripStepTwoProvider;
  late StepTwoSelectAdditionProvider stepTwoSelectAdditionProvider;

  //Controller
  late ScrollController _scrollController;
  int index = 0;

  @override
  void initState() {
    super.initState();

    roundTripStepTwoProvider = RoundTripStepTwoProvider();
    roundTripStepTwoProvider =
        Provider.of<RoundTripStepTwoProvider>(context, listen: false);
    roundTripStepTwoProvider.init(context: context);

    /// StepTwoSelectAdditionProvider
    stepTwoSelectAdditionProvider = StepTwoSelectAdditionProvider();
    stepTwoSelectAdditionProvider =
        Provider.of<StepTwoSelectAdditionProvider>(context, listen: false);
    stepTwoSelectAdditionProvider.init(context: context);

    debugPrint("stepTwoResult: ${widget.paramHotelBody.map((e) => e)}");

    // Pagination
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        debugPrint("Ending...");
        setState(() {
          index++;
          debugPrint("EndingIndex: $index");
        });
        roundTripStepTwoProvider.getTripsData(
            tripFilterModel: widget.tripFilterModel, offset: index);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        // Load Trip
        roundTripStepTwoProvider.getTripsData(
            tripFilterModel: widget.tripFilterModel, offset: index);
      },
    );

    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RoundTripStepTwoProvider>(context, listen: true);
    Provider.of<StepTwoSelectAdditionProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
          text: "${widget.fromCity} - ${widget.toCity}",
          textSize: 18,
          fontWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CommonPadding.sizeBoxWithHeight(height: 10),
            FilterContainerWidget(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TripFilterScreen(),
                  ),
                );
              },
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            roundTripStepTwoProvider.isTripDataLoaded
                ? Expanded(
                    child: roundTripStepTwoProvider
                            .tripsResponse.data!.trips!.isNotEmpty
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: roundTripStepTwoProvider
                                .tripsResponse.data!.trips!.length,
                            itemBuilder: (context, i) {
                              var data = roundTripStepTwoProvider
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
                                onTap: () async {
                                  if (data.additionals!.isEmpty) {
                                    debugPrint(
                                      "roundTripAdditional:${data.additionals!.isEmpty}",
                                    );
                                    debugPrint(
                                      "roundTripHotels:${data.hotels!.isEmpty}",
                                    );
                                    await _callOrderTrip(tripId: data);
                                  } else {
                                    NavigationHelper.pushRoute(
                                      context,
                                      StepTwoSelectAdditionScreen(
                                        tripSecondId: tripId,
                                        secondTripsModel: data,
                                        isRoundTripChecked:
                                            widget.isRoundTripChecked,
                                        passengersCount:
                                            widget.tripFirstPassengersCount,
                                        toCityId:
                                            widget.tripFilterModel.to_city_id,
                                        fromCityId:
                                            widget.tripFilterModel.from_city_id,
                                        firstTripModel: widget.firstTripModel,
                                        tripFirstAdditionalList:
                                            widget.tripFirstAdditionalList,
                                        tripFirstPassengersCount:
                                            widget.tripFirstPassengersCount,
                                        paramPassengerBody:
                                            widget.paramPassengerBody,
                                        paramHotelBody: widget.paramHotelBody,
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
                                ),
                              );
                            },
                          )
                        : Center(
                            child: TextView.getSubHeadingTextWith15(
                                "No Data Available", Assets.latoBold,
                                color: AppColors.blueHomeColor,
                                lines: 1,
                                fontWeight: FontWeight.normal),
                          ),
                  )
                : Container(),
            CommonPadding.sizeBoxWithHeight(height: 10),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  /// Call Order Trip
  Future<void> _callOrderTrip({required Trips tripId}) async {
    debugPrint("stepTwoResult: ${widget.paramHotelBody.map((e) => e)}");

    if (widget.isRoundTripChecked == true) {
      await stepTwoSelectAdditionProvider.roundOrderTripCallFromStepTwo(
        tripFirstId: widget.firstTripModel,
        passengersCount: widget.tripFirstPassengersCount,
        tripFirstAdditionalList: widget.tripFirstAdditionalList,
        tripSecondId: tripId,
        paramPassengerBody: widget.paramPassengerBody,
        paramHotelBody: widget.paramHotelBody,
      );

      if (stepTwoSelectAdditionProvider.isRoundOrderTripSaved == true) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoundTripReviewOrderScreen(
              orderId: stepTwoSelectAdditionProvider
                  .roundOrderTripResponse.data!.tripId!,
            ),
          ),
        );
      }
    }
  }
}
