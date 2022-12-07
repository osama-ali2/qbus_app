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

  const HotelScreen({
    Key? key,
    required this.tripId,
  }) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  int _bookingDayCounter = 0;
  int _numberOfRoomCounter = 0;
  List<int> roomCounterList = [];
  late HotelProvider hotelProvider;

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

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: sizes!.heightRatio * 5,
                          ),
                          child: HotelCardContainerWidget(
                            hotelTitle: hotelName ?? "First Class Hotel",
                            cityName: city,
                            rent: "100",
                            roomType: "Room Type",
                            hotelImage: "$imageUrl/$image",
                            houseNum: roomNum,
                            bedRoomNum: bedNum,
                            ratingNum: int.parse(rate),
                            onPlusBookingDayPress: () {
                              _bookingDayCounter++;
                              setState(() {});
                            },
                            onMinusBookingDayPress: () {
                              if (_bookingDayCounter > 1) {
                                _bookingDayCounter--;
                                setState(() {});
                              }
                            },
                            onPlusRoomPress: () {
                              _numberOfRoomCounter++;
                              setState(() {});
                            },
                            onMinusRoomPress: () {
                              if (_numberOfRoomCounter > 1) {
                                _numberOfRoomCounter--;
                                setState(() {});
                              }
                            },
                            bookingDayCounter: _bookingDayCounter,
                            numberOfRoomCounter: _numberOfRoomCounter,
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            CommonPadding.sizeBoxWithHeight(height: 10),
            CustomButton(
              name: "Save And Review The Order",
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 14,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
              borderRadius: 5,
              onTapped: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewOrderScreen(),
                  ),
                );
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }
}
