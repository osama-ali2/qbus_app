import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/hotel_screens/hotel_provider.dart';
import 'package:qbus/screens/review_order_screens/review_order_screen.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/counter.dart';
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
  int roomCounter = 0;
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
                  onTap: () => Toasts.getWarningToast(text: "Try it later"),
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
                              vertical: sizes!.heightRatio * 5),
                          child: packageCardContainer(
                            hotelTitle: hotelName ?? "First Class Hotel",
                            cityName: city,
                            rent: "100",
                            roomType: "Room Type",
                            hotelImage: "https://picsum.photos/200/300",
                            //"$imageUrl/$image"
                            houseNum: roomNum,
                            bedRoomNum: bedNum,
                            ratingNum: int.parse(rate),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            CommonPadding.sizeBoxWithHeight(height: 10),
            // CustomButton(
            //   name: "Save and select another Room",
            //   buttonColor: appColor,
            //   height: sizes!.heightRatio * 45,
            //   width: double.infinity,
            //   textSize: sizes!.fontRatio * 14,
            //   textColor: Colors.white,
            //   fontWeight: FontWeight.w500,
            //   borderRadius: 5,
            //   onTapped: () async {},
            //   padding: 0,
            // ),
            // CommonPadding.sizeBoxWithHeight(height: 10),
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
                        builder: (context) => const ReviewOrderScreen()));
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 10),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  /// Package Card Container
  Widget packageCardContainer({
    required String hotelTitle,
    required String cityName,
    required String rent,
    required String roomType,
    required String hotelImage,
    required String houseNum,
    required String bedRoomNum,
    required int ratingNum,
  }) =>
      Container(
        height: sizes!.heightRatio * 136,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.containerShadowColor,
                blurRadius: 10.0,
                offset: Offset(0, 2),
              ),
            ],
            color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: sizes!.heightRatio * 114,
              width: sizes!.widthRatio * 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  hotelImage,
                  height: sizes!.heightRatio * 100,
                  width: sizes!.widthRatio * 140,
                  fit: BoxFit.fill,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: sizes!.widthRatio * 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: hotelTitle,
                        textSize: sizes!.fontRatio * 14,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.black900),
                    CommonPadding.sizeBoxWithWidth(width: 40),
                    Container(
                      height: sizes!.heightRatio * 20,
                      width: sizes!.widthRatio * 60,
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: CustomText(
                            text: "SKR $rent",
                            textSize: sizes!.fontRatio * 10,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  children: [
                    for (int i = 0; i < 1; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    CommonPadding.sizeBoxWithWidth(width: 2),
                    CustomText(
                        text: "$ratingNum.0",
                        textSize: sizes!.fontRatio * 12,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black),
                  ],
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/location_icon.svg"),
                    CommonPadding.sizeBoxWithWidth(width: 4),
                    CustomText(
                        text: cityName,
                        textSize: sizes!.fontRatio * 12,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.gray),
                  ],
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  children: [
                    CustomText(
                        text: "Booking Days",
                        textSize: sizes!.fontRatio * 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.gray),
                    CommonPadding.sizeBoxWithWidth(width: 60),
                    Counter(
                        number: roomCounter,
                        onAdd: () {
                          roomCounter++;
                          setState(() {});
                        },
                        onMinus: () {
                          if (roomCounter > 1) {
                            roomCounter--;
                            setState(() {});
                          }
                        }),
                  ],
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Number of Rooms",
                        textSize: sizes!.fontRatio * 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.gray),
                    CommonPadding.sizeBoxWithWidth(width: 36),
                    Counter(
                        number: roomCounter,
                        onAdd: () {
                          roomCounter++;
                          setState(() {});
                        },
                        onMinus: () {
                          if (roomCounter > 1) {
                            roomCounter--;
                            setState(() {});
                          }
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}
