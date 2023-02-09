import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/project_widgets/hotel_card_container_widget.dart';
import 'package:qbus/screens/review_order_screens/review_order_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';

import 'hotel_filter_screens/hotel_filter_screen.dart';
import 'package_hotel_provider.dart';

class PackageHotelScreen extends StatefulWidget {
  final int tripId;

  final String passengerCounts;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramAdditionalList;

  const PackageHotelScreen({
    Key? key,
    required this.tripId,
    required this.passengerCounts,
    required this.paramPassengerBody,
    required this.paramAdditionalList,
  }) : super(key: key);

  @override
  State<PackageHotelScreen> createState() => _PackageHotelScreenState();
}

class _PackageHotelScreenState extends State<PackageHotelScreen> {
  late PackageHotelProvider packageHotelProvider;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    packageHotelProvider = PackageHotelProvider();
    packageHotelProvider =
        Provider.of<PackageHotelProvider>(context, listen: false);
    packageHotelProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // packageHotelProvider.getHotels(tripId: widget.tripId);
    });
  }

  @override
  void dispose() {
    super.dispose();

    packageHotelProvider.selectBookingDaysList.clear();
    packageHotelProvider.selectNumberOfRoomsList.clear();
    packageHotelProvider.hotelRoomBody.clear();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageHotelProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
          text: AppLocalizations.of(context)!.hotels,
          textSize: sizes!.fontRatio * 18,
          fontWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
        actions: [
          Center(
            child: Padding(
                padding: EdgeInsets.only(
                  right: sizes!.widthRatio * 20,
                  left: sizes!.widthRatio * 20,
                ),
                child: GestureDetector(
                  onTap: () async => _skipAndSaveTripOrder(),
                  child: TextView.getGenericText(
                      text: AppLocalizations.of(context)!.skip,
                      fontFamily: Assets.latoRegular,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteTextColor,
                      lines: 1),
                )),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonPadding.sizeBoxWithHeight(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PackageHotelFilterScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.filter,
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
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            packageHotelProvider.isHotelLoaded == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount: packageHotelProvider
                          .hotelRoomResponse.data!.rooms!.length,
                      itemBuilder: (context, index) {
                        currentIndex = index;

                        var data = packageHotelProvider
                            .hotelRoomResponse.data!.rooms![index];

                        // var hotelName = data.name?.en.toString();
                        var hotelName = data.name?.ar.toString();

                        var city = data.city.toString();
                        var rate = data.rate.toString();

                        var roomNum = data.roomQuantity.toString();
                        var bedNum = data.bedQuantity.toString();
                        var imageUrl = packageHotelProvider
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
                            roomType: AppLocalizations.of(context)!.room_type,
                            hotelImage: thumbnailUrl,
                            houseNum: roomNum,
                            bedRoomNum: bedNum,
                            ratingNum: int.parse(rate),
                            onPlusBookingDayPress: () {
                              onPlusBookingDay(index: index, roomId: roomId);
                            },
                            onMinusBookingDayPress: () {
                              onMinusBookingDay(index: index, roomId: roomId);
                            },
                            onPlusRoomPress: () {
                              onPlusRoom(index: index, roomId: roomId);
                            },
                            onMinusRoomPress: () {
                              onMinusRoom(index: index, roomId: roomId);
                            },
                            bookingDayCounter: packageHotelProvider
                                    .selectBookingDaysList.isNotEmpty
                                ? packageHotelProvider
                                    .selectBookingDaysList[index]
                                : 0,
                            numberOfRoomCounter: packageHotelProvider
                                    .selectNumberOfRoomsList.isNotEmpty
                                ? packageHotelProvider
                                    .selectNumberOfRoomsList[index]
                                : 0,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: TextView.getGenericText(
                        text: AppLocalizations.of(context)!.no_hotel_found,
                        fontFamily: Assets.latoRegular,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.whiteTextColor,
                        lines: 1),
                  ),
            CommonPadding.sizeBoxWithHeight(height: 10),
            packageHotelProvider.isHotelLoaded == true
                ? CustomButton(
                    name: AppLocalizations.of(context)!.confirm_order,
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () async {
                      await _saveTripOrder();
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

  // On Plus Booking Day
  void onPlusBookingDay({required int index, required int roomId}) {
    setState(() {
      packageHotelProvider.selectBookingDaysList[index]++;
      Map<String, dynamic> selected = {
        "room_id": roomId,
        "rooms_number": packageHotelProvider.selectNumberOfRoomsList[index],
        "days": packageHotelProvider.selectBookingDaysList[index],
      };
      debugPrint("bookingDaysCounter:$selected");
      packageHotelProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  // On Minus Booking Day
  void onMinusBookingDay({required int index, required int roomId}) {
    if (packageHotelProvider.selectBookingDaysList[index] > 0) {
      setState(() {
        packageHotelProvider.selectBookingDaysList[index]--;
        Map<String, dynamic> selected = {
          "room_id": roomId,
          "rooms_number": packageHotelProvider.selectNumberOfRoomsList[index],
          "days": packageHotelProvider.selectBookingDaysList[index],
        };
        debugPrint("bookingDaysCounter:$selected");
        packageHotelProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  // On Plus Room
  void onPlusRoom({required int index, required int roomId}) {
    setState(() {
      packageHotelProvider.selectNumberOfRoomsList[index]++;
      Map<String, dynamic> selected = {
        "room_id": roomId,
        "rooms_number": packageHotelProvider.selectNumberOfRoomsList[index],
        //numberOfRoomsCounter,
        "days": packageHotelProvider.selectBookingDaysList[index],
        //bookingDaysCounter
      };
      debugPrint("numberOfRoomsCounter:$selected");
      packageHotelProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  // On Minus Room
  void onMinusRoom({required int index, required int roomId}) {
    if (packageHotelProvider.selectNumberOfRoomsList[index] > 0) {
      setState(() {
        packageHotelProvider.selectNumberOfRoomsList[index]--;
        Map<String, dynamic> selected = {
          "room_id": roomId,
          "rooms_number": packageHotelProvider.selectNumberOfRoomsList[index],
          //numberOfRoomsCounter,
          "days": packageHotelProvider.selectBookingDaysList[index],
          //bookingDaysCounter
        };
        debugPrint("numberOfRoomsCounter:$selected");
        packageHotelProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  /// Save Trip Order
  Future<void> _saveTripOrder() async {
    await packageHotelProvider.oneWayOrderTrip(
      tripId: "${widget.tripId}",
      passengerCounts: widget.passengerCounts,
      paramPassengerBody: widget.paramPassengerBody,
      additionalList: widget.paramAdditionalList,
    );

    /// One way order Trip save successfully
    if (packageHotelProvider.isOneWayOrderTripSaved) {
      if (!mounted) return;
      var tripId = packageHotelProvider.oneWayOrdersTripResponse.data!.tripId;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewOrderScreen(
            tripId: tripId!,
          ),
        ),
      );
    } else {
      Toasts.getErrorToast(text: "Server Error");
    }
  }

  /// Skip And Save Trip Order
  Future<void> _skipAndSaveTripOrder() async {
    /// Skipping the hotels
    debugPrint(
        "SkippingHotelAdditional: ${widget.paramAdditionalList.map((e) => e)}");
    await packageHotelProvider.skipHotelOneWayOrderTrip(
      tripId: "${widget.tripId}",
      passengerCounts: widget.passengerCounts,
      paramPassengerBody: widget.paramPassengerBody,
      additionalList: widget.paramAdditionalList,
    );

    if (packageHotelProvider.isOneWayOrderTripSaved) {
      if (!mounted) return;
      var tripId = packageHotelProvider.oneWayOrdersTripResponse.data!.tripId;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewOrderScreen(
            tripId: tripId!,
          ),
        ),
      );
    }
  }
}
