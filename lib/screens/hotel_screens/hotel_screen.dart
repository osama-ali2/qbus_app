import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/hotel_screens/hotel_provider.dart';
import 'package:qbus/screens/project_widgets/hotel_card_cotnainer_widget.dart';
import 'package:qbus/screens/review_order_screens/review_order_screen.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';

class HotelScreen extends StatefulWidget {
  final int tripId;

  final String passengerCounts;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramAdditionalList;

  const HotelScreen({
    Key? key,
    required this.tripId,
    required this.passengerCounts,
    required this.paramPassengerBody,
    required this.paramAdditionalList,
  }) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late HotelProvider hotelProvider;
  int currentIndex = 0;

  int bookingDaysCounter = 0;
  int numberOfRoomsCounter = 0;

  @override
  void initState() {
    super.initState();

    hotelProvider = HotelProvider();
    hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    hotelProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      hotelProvider.getHotels(tripId: widget.tripId);
    });
  }

  @override
  void dispose() {
    super.dispose();

    hotelProvider.selectBookingDaysList.clear();
    hotelProvider.selectNumberOfRoomsList.clear();
    hotelProvider.hotelRoomBody.clear();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HotelProvider>(context, listen: true);
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
                  onTap: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewOrderScreen(),
                    ),
                  ),
                  child: TextView.getGenericText(
                      text: "Skip",
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
            hotelProvider.isHotelLoaded == true
                ? Expanded(
                    child: ListView.builder(
                      itemCount:
                          hotelProvider.hotelRoomResponse.data!.rooms!.length,
                      itemBuilder: (context, index) {
                        currentIndex = index;
                        var data =
                            hotelProvider.hotelRoomResponse.data!.rooms![index];
                        var hotelName = data.name?.en.toString();
                        var city = data.city.toString();
                        var rate = data.rate.toString();
                        var roomNum = data.roomQuantity.toString();
                        var bedNum = data.bedQuantity.toString();
                        var imageUrl = hotelProvider
                            .hotelRoomResponse.data!.imageBase
                            .toString();
                        var image = data.image.toString();

                        var thumbnailUrl = "$imageUrl/$image";

                        var roomId = int.parse("${data.id}");

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: sizes!.heightRatio * 5,
                          ),
                          child: HotelCardContainerWidget(
                            key: Key("$index"),
                            hotelTitle: hotelName ?? "First Class Hotel",
                            cityName: city,
                            rent: "100",
                            roomType: "Room Type",
                            hotelImage: thumbnailUrl,
                            houseNum: roomNum,
                            bedRoomNum: bedNum,
                            ratingNum: int.parse(rate),
                            onPlusBookingDayPress: () {
                              setState(() {
                                bookingDaysCounter = hotelProvider
                                    .selectBookingDaysList[index]++;
                                Map<String, dynamic> selected = {
                                  "room_id": roomId,
                                  "rooms_number": numberOfRoomsCounter,
                                  "days": bookingDaysCounter + 1
                                };
                                debugPrint("bookingDaysCounter:$selected");
                                hotelProvider.hotelRoomBody[index]
                                    .addAll(selected);
                              });
                            },
                            onMinusBookingDayPress: () {
                              if (hotelProvider.selectBookingDaysList[index] >
                                  0) {
                                setState(() {
                                  bookingDaysCounter = hotelProvider
                                      .selectBookingDaysList[index]--;
                                  Map<String, dynamic> selected = {
                                    "room_id": roomId,
                                    "rooms_number": numberOfRoomsCounter,
                                    "days": bookingDaysCounter - 1
                                  };
                                  debugPrint("bookingDaysCounter:$selected");
                                  hotelProvider.hotelRoomBody[index]
                                      .addAll(selected);
                                });
                              }
                            },
                            onPlusRoomPress: () {
                              setState(() {
                                numberOfRoomsCounter = hotelProvider
                                    .selectNumberOfRoomsList[index]++;
                                Map<String, dynamic> selected = {
                                  "room_id": roomId,
                                  "rooms_number": numberOfRoomsCounter + 1,
                                  "days": bookingDaysCounter
                                };
                                debugPrint("numberOfRoomsCounter:$selected");

                                hotelProvider.hotelRoomBody[index]
                                    .addAll(selected);
                              });
                            },
                            onMinusRoomPress: () {
                              if (hotelProvider.selectNumberOfRoomsList[index] >
                                  0) {
                                setState(() {
                                  numberOfRoomsCounter = hotelProvider
                                      .selectNumberOfRoomsList[index]--;
                                  Map<String, dynamic> selected = {
                                    "room_id": roomId,
                                    "rooms_number": numberOfRoomsCounter - 1,
                                    "days": bookingDaysCounter
                                  };
                                  debugPrint("numberOfRoomsCounter:$selected");

                                  hotelProvider.hotelRoomBody[index]
                                      .addAll(selected);
                                });
                              }
                            },
                            bookingDayCounter:
                                hotelProvider.selectBookingDaysList.isNotEmpty
                                    ? hotelProvider.selectBookingDaysList[index]
                                    : 0,
                            numberOfRoomCounter: hotelProvider
                                    .selectNumberOfRoomsList.isNotEmpty
                                ? hotelProvider.selectNumberOfRoomsList[index]
                                : 0,
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            CommonPadding.sizeBoxWithHeight(height: 10),
            hotelProvider.isHotelLoaded == true
                ? CustomButton(
                    name: "Save And Review The Order",
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () async {
                      saveTripOrder();
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

  void saveTripOrder() async {
    await hotelProvider.oneWayOrderTrip(
      tripId: "${widget.tripId}",
      passengerCounts: widget.passengerCounts,
      paramPassengerBody: widget.paramPassengerBody,
      additionalList: widget.paramAdditionalList,
    );

    if (hotelProvider.isOneWayOrderTripSaved) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReviewOrderScreen(),
        ),
      );
    }
  }
}
