import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/package_screens/package_hotels/package_hotels.dart';
import 'package:qbus/screens/package_screens/package_review_order_screens/package_review_order_screen.dart';
import 'package:qbus/screens/project_widgets/hotel_card_container_widget.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';

class PackageHotelTripTwoScreen extends StatefulWidget {
  final int secondTripId;
  final int packageId;
  final String passengerCounts;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramAdditionalList;
  final List<Map<String, dynamic>> hotelOneBody;

  const PackageHotelTripTwoScreen({
    Key? key,
    required this.passengerCounts,
    required this.paramPassengerBody,
    required this.paramAdditionalList,
    required this.secondTripId,
    required this.packageId,
    required this.hotelOneBody,
  }) : super(key: key);

  @override
  State<PackageHotelTripTwoScreen> createState() =>
      _PackageHotelTripTwoScreenState();
}

class _PackageHotelTripTwoScreenState extends State<PackageHotelTripTwoScreen> {
  late PackageHotelTripTwoProvider packageHotelTripTwoProvider;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    packageHotelTripTwoProvider = PackageHotelTripTwoProvider();
    packageHotelTripTwoProvider =
        Provider.of<PackageHotelTripTwoProvider>(context, listen: false);
    packageHotelTripTwoProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageHotelTripTwoProvider.getHotels(tripId: widget.secondTripId);
    });
  }

  @override
  void dispose() {
    super.dispose();

    packageHotelTripTwoProvider.selectBookingDaysList.clear();
    packageHotelTripTwoProvider.selectNumberOfRoomsList.clear();
    packageHotelTripTwoProvider.hotelRoomBody.clear();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageHotelTripTwoProvider>(context, listen: true);
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
                    builder: (context) =>
                        const PackageHotelTripTwoFilterScreen(),
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
            packageHotelTripTwoProvider.isHotelLoaded == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount: packageHotelTripTwoProvider
                          .hotelRoomResponse.data!.rooms!.length,
                      itemBuilder: (context, index) {
                        currentIndex = index;

                        var data = packageHotelTripTwoProvider
                            .hotelRoomResponse.data!.rooms![index];

                        // var hotelName = data.name?.en.toString();
                        var hotelName = data.name?.ar.toString();

                        var city = data.city.toString();
                        var rate = data.rate.toString();

                        var roomNum = data.roomQuantity.toString();
                        var bedNum = data.bedQuantity.toString();
                        var imageUrl = packageHotelTripTwoProvider
                            .hotelRoomResponse.data!.imageBase
                            .toString();

                        var image = data.image.toString();
                        var thumbnailUrl = "$imageUrl/$image";
                        var roomId = int.parse("${data.id}");
                        var tripId = int.parse("${data.id}");

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
                              onPlusBookingDay(
                                index: index,
                                roomId: roomId,
                                tripId: tripId,
                              );
                            },
                            onMinusBookingDayPress: () {
                              onMinusBookingDay(
                                index: index,
                                roomId: roomId,
                                tripId: tripId,
                              );
                            },
                            onPlusRoomPress: () {
                              onPlusRoom(
                                index: index,
                                roomId: roomId,
                                tripId: tripId,
                              );
                            },
                            onMinusRoomPress: () {
                              onMinusRoom(
                                index: index,
                                roomId: roomId,
                                tripId: tripId,
                              );
                            },
                            bookingDayCounter: packageHotelTripTwoProvider
                                    .selectBookingDaysList.isNotEmpty
                                ? packageHotelTripTwoProvider
                                    .selectBookingDaysList[index]
                                : 0,
                            numberOfRoomCounter: packageHotelTripTwoProvider
                                    .selectNumberOfRoomsList.isNotEmpty
                                ? packageHotelTripTwoProvider
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
            packageHotelTripTwoProvider.isHotelLoaded == true
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
                      await _savePackageOrder();
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
  void onPlusBookingDay({
    required int index,
    required int roomId,
    required int tripId,
  }) {
    setState(() {
      packageHotelTripTwoProvider.selectBookingDaysList[index]++;
      Map<String, dynamic> selected = {
        "trip_id": tripId,
        "room_id": roomId,
        "rooms_number":
            packageHotelTripTwoProvider.selectNumberOfRoomsList[index],
        "days": packageHotelTripTwoProvider.selectBookingDaysList[index],
      };
      debugPrint("bookingDaysCounter:$selected");
      packageHotelTripTwoProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  /// On Minus Booking Day
  void onMinusBookingDay({
    required int index,
    required int roomId,
    required int tripId,
  }) {
    if (packageHotelTripTwoProvider.selectBookingDaysList[index] > 0) {
      setState(() {
        packageHotelTripTwoProvider.selectBookingDaysList[index]--;
        Map<String, dynamic> selected = {
          "trip_id": tripId,
          "room_id": roomId,
          "rooms_number":
              packageHotelTripTwoProvider.selectNumberOfRoomsList[index],
          "days": packageHotelTripTwoProvider.selectBookingDaysList[index],
        };
        debugPrint("bookingDaysCounter:$selected");
        packageHotelTripTwoProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  /// On Plus Room
  void onPlusRoom({
    required int index,
    required int roomId,
    required int tripId,
  }) {
    setState(() {
      packageHotelTripTwoProvider.selectNumberOfRoomsList[index]++;
      Map<String, dynamic> selected = {
        "trip_id": tripId,
        "room_id": roomId,
        "rooms_number":
            packageHotelTripTwoProvider.selectNumberOfRoomsList[index],
        //numberOfRoomsCounter,
        "days": packageHotelTripTwoProvider.selectBookingDaysList[index],
        //bookingDaysCounter
      };
      debugPrint("numberOfRoomsCounter:$selected");
      packageHotelTripTwoProvider.hotelRoomBody[index].addAll(selected);
    });
  }

  /// On Minus Room
  void onMinusRoom({
    required int index,
    required int roomId,
    required int tripId,
  }) {
    if (packageHotelTripTwoProvider.selectNumberOfRoomsList[index] > 0) {
      setState(() {
        packageHotelTripTwoProvider.selectNumberOfRoomsList[index]--;
        Map<String, dynamic> selected = {
          "trip_id": tripId,
          "room_id": roomId,
          "rooms_number":
              packageHotelTripTwoProvider.selectNumberOfRoomsList[index],
          //numberOfRoomsCounter,
          "days": packageHotelTripTwoProvider.selectBookingDaysList[index],
          //bookingDaysCounter
        };
        debugPrint("numberOfRoomsCounter:$selected");
        packageHotelTripTwoProvider.hotelRoomBody[index].addAll(selected);
      });
    }
  }

  /// Save Trip Order
  Future<void> _savePackageOrder() async {
    debugPrint(
        "_savePackageOrder: ${widget.packageId}, ${widget.passengerCounts},\n${widget.paramPassengerBody.map((e) => e)},\n${widget.paramAdditionalList.map((e) => e)}");

    await packageHotelTripTwoProvider.savePackageOrders(
      packageId: widget.packageId,
      passengerCounts: int.parse(widget.passengerCounts),
      paramPassengerBody: widget.paramPassengerBody,
      additionalList: widget.paramAdditionalList,
      hotelOneBody: widget.hotelOneBody,
    );

    /// One way order Trip save successfully
    if (packageHotelTripTwoProvider.isPackageOrdersSaved) {
      if (!mounted) return;
      var packageId =
          packageHotelTripTwoProvider.packageOrderResponse.data!.packageOrderId;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PackageReviewOrderScreen(
            packageId: packageId!,
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
    await packageHotelTripTwoProvider.skipHotelTwoFromScreen(
      packageId: widget.packageId,
      passengerCounts: int.parse(widget.passengerCounts),
      paramPassengerBody: widget.paramPassengerBody,
      additionalList: widget.paramAdditionalList,
      hotelOneBody: widget.hotelOneBody,
    );

    if (packageHotelTripTwoProvider.isPackageOrdersSaved) {
      if (!mounted) return;
      var packageId =
          packageHotelTripTwoProvider.packageOrderResponse.data!.packageOrderId;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PackageReviewOrderScreen(
            packageId: packageId!,
          ),
        ),
      );
    }
  }
}
