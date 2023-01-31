import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/project_widgets/hotel_card_container_widget.dart';
import 'package:qbus/screens/round_trip_flow/step_two/round_trip_step_two_result.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';

import 'round_trip_hotel_provider.dart';

class RoundTripHotelScreen extends StatefulWidget {
  final int tripId;
  final String passengerCounts;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramAdditionalList;

// Trip Data
  final TripFilterModel tripFilterModel;
  final String fromCity;
  final String toCity;
  final bool isRoundTripChecked;
  final Trips firstTripModel;
  final String tripFirstPassengersCount;
  final List<Map<String, dynamic>> tripFirstAdditionalList;

  const RoundTripHotelScreen({
    Key? key,
    required this.tripId,
    required this.passengerCounts,
    required this.paramPassengerBody,
    required this.paramAdditionalList,
    required this.tripFilterModel,
    required this.fromCity,
    required this.toCity,
    required this.isRoundTripChecked,
    required this.firstTripModel,
    required this.tripFirstPassengersCount,
    required this.tripFirstAdditionalList,
  }) : super(key: key);

  @override
  State<RoundTripHotelScreen> createState() => _RoundTripHotelScreenState();
}

class _RoundTripHotelScreenState extends State<RoundTripHotelScreen> {
  late RoundTripHotelProvider roundTripHotelProvider;

  int currentIndex = 0;
  int bookingDaysCounter = 1;
  int numberOfRoomsCounter = 1;

  @override
  void initState() {
    super.initState();

    roundTripHotelProvider = RoundTripHotelProvider();
    roundTripHotelProvider =
        Provider.of<RoundTripHotelProvider>(context, listen: false);
    roundTripHotelProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      roundTripHotelProvider.getHotels(tripId: widget.tripId);
    });
  }

  @override
  void dispose() {
    super.dispose();
    roundTripHotelProvider.selectBookingDaysList.clear();
    roundTripHotelProvider.selectNumberOfRoomsList.clear();
    roundTripHotelProvider.hotelRoomBody.clear();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RoundTripHotelProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Hotels",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: sizes!.widthRatio * 20),
              child: GestureDetector(
                onTap: () async => _skipAndStepTwoTrip(),
                child: TextView.getGenericText(
                    text: "Skip",
                    fontFamily: Assets.latoRegular,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteTextColor,
                    lines: 1),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonPadding.sizeBoxWithHeight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: sizes!.fontRatio * 14,
                    fontFamily: Assets.latoRegular,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                CommonPadding.sizeBoxWithWidth(width: 4),
                SvgPicture.asset(
                  "assets/svg/filter_icon.svg",
                  height: sizes!.heightRatio * 16,
                  width: sizes!.widthRatio * 16,
                ),
              ],
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            roundTripHotelProvider.isHotelLoaded == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount: roundTripHotelProvider
                          .hotelRoomResponse.data!.rooms!.length,
                      itemBuilder: (context, index) {
                        currentIndex = index;
                        var data = roundTripHotelProvider
                            .hotelRoomResponse.data!.rooms![index];
                        var hotelName = data.name?.en.toString();
                        var city = data.city.toString();
                        var rate = data.rate.toString();
                        var roomNum = data.roomQuantity.toString();
                        var bedNum = data.bedQuantity.toString();
                        var imageUrl = roundTripHotelProvider
                            .hotelRoomResponse.data!.imageBase
                            .toString();
                        var image = data.image.toString();
                        var thumbnailUrl = "$imageUrl/$image";
                        var roomId = int.parse("${data.id}");

                        var rent = data.fees.toString();

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: sizes!.heightRatio * 5,
                          ),
                          child: HotelCardContainerWidget(
                            key: Key("$index"),
                            hotelTitle: hotelName ?? "First Class Hotel",
                            cityName: city,
                            rent: rent,
                            roomType: "Room Type",
                            hotelImage: thumbnailUrl,
                            houseNum: roomNum,
                            bedRoomNum: bedNum,
                            ratingNum: int.parse(rate),
                            onPlusBookingDayPress: () {
                              _onPlusBookingDay(index: index, roomId: roomId);
                            },
                            onMinusBookingDayPress: () {
                              _onMinusBookingDay(index: index, roomId: roomId);
                            },
                            onPlusRoomPress: () {
                              _onPlusRoom(index: index, roomId: roomId);
                            },
                            onMinusRoomPress: () {
                              _onMinusRoom(index: index, roomId: roomId);
                            },
                            bookingDayCounter: roundTripHotelProvider
                                    .selectBookingDaysList.isNotEmpty
                                ? roundTripHotelProvider
                                    .selectBookingDaysList[index]
                                : 0,
                            numberOfRoomCounter: roundTripHotelProvider
                                    .selectNumberOfRoomsList.isNotEmpty
                                ? roundTripHotelProvider
                                    .selectNumberOfRoomsList[index]
                                : 0,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: TextView.getGenericText(
                        text: "No Hotel Founds",
                        fontFamily: Assets.latoRegular,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.whiteTextColor,
                        lines: 1),
                  ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            roundTripHotelProvider.isHotelLoaded == true
                ? CustomButton(
                    name: "Save And Start Trip Two",
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () async {
                      // saveTripOrder();
                      _stepTwoTrip();
                      debugPrint(
                          "hotelData:${widget.tripId}, ${widget.passengerCounts}, ${widget.paramPassengerBody}, ${widget.paramAdditionalList}, ${roundTripHotelProvider.hotelRoomBody}");
                    },
                    padding: 0,
                  )
                : Container(),
            CommonPadding.sizeBoxWithHeight(height: 10),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  /// On Plus Booking Day
  void _onPlusBookingDay({required int index, required int roomId}) {
    setState(() {
      roundTripHotelProvider.selectBookingDaysList[index]++;
      Map<String, dynamic> selected = {
        "room_id": roomId,
        "rooms_number": roundTripHotelProvider.selectNumberOfRoomsList[index],
        "days": roundTripHotelProvider.selectBookingDaysList[index],
      };
      debugPrint("bookingDaysCounter:$selected");
      roundTripHotelProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  /// On Minus Booking Day
  void _onMinusBookingDay({required int index, required int roomId}) {
    if (roundTripHotelProvider.selectBookingDaysList[index] > 0) {
      setState(() {
        roundTripHotelProvider.selectBookingDaysList[index]--;
        Map<String, dynamic> selected = {
          "room_id": roomId,
          "rooms_number": roundTripHotelProvider.selectNumberOfRoomsList[index],
          "days": roundTripHotelProvider.selectBookingDaysList[index],
        };
        debugPrint("bookingDaysCounter:$selected");
        roundTripHotelProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  /// On Plus Room
  void _onPlusRoom({required int index, required int roomId}) {
    setState(() {
      roundTripHotelProvider.selectNumberOfRoomsList[index]++;
      Map<String, dynamic> selected = {
        "room_id": roomId,
        "rooms_number": roundTripHotelProvider.selectNumberOfRoomsList[index],
        //numberOfRoomsCounter,
        "days": roundTripHotelProvider.selectBookingDaysList[index],
        //bookingDaysCounter
      };
      debugPrint("numberOfRoomsCounter:$selected");
      roundTripHotelProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  /// On Minus Room
  void _onMinusRoom({required int index, required int roomId}) {
    if (roundTripHotelProvider.selectNumberOfRoomsList[index] > 0) {
      setState(() {
        roundTripHotelProvider.selectNumberOfRoomsList[index]--;
        Map<String, dynamic> selected = {
          "room_id": roomId,
          "rooms_number": roundTripHotelProvider.selectNumberOfRoomsList[index],
          //numberOfRoomsCounter,
          "days": roundTripHotelProvider.selectBookingDaysList[index],
          //bookingDaysCounter
        };
        debugPrint("numberOfRoomsCounter:$selected");
        roundTripHotelProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  /// Step Two Trip
  void _stepTwoTrip() async {
    /// TODO: Uncomment Round Trip Step Two Result;
    debugPrint(
        "fromNewHotelBody:${roundTripHotelProvider.hotelRoomBody.map((e) => e)}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoundTripStepTwoResult(
          toCity: widget.toCity,
          fromCity: widget.fromCity,
          tripFilterModel: widget.tripFilterModel,
          isRoundTripChecked: widget.isRoundTripChecked,
          tripFirstPassengersCount: widget.passengerCounts,
          firstTripModel: widget.firstTripModel,
          tripFirstAdditionalList: widget.paramAdditionalList,
          paramPassengerBody: widget.paramPassengerBody,
          paramHotelBody: roundTripHotelProvider.hotelRoomBody,
        ),
      ),
    );
  }

  /// Skip And Step Two Trip
  void _skipAndStepTwoTrip() async {
    /// TODO: Uncomment Round Trip Step Two Result;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoundTripStepTwoResult(
          toCity: widget.toCity,
          fromCity: widget.fromCity,
          tripFilterModel: widget.tripFilterModel,
          isRoundTripChecked: widget.isRoundTripChecked,
          tripFirstPassengersCount: widget.passengerCounts,
          firstTripModel: widget.firstTripModel,
          tripFirstAdditionalList: widget.paramAdditionalList,
          paramPassengerBody: widget.paramPassengerBody,
          paramHotelBody: [],
        ),
      ),
    );
  }
}
