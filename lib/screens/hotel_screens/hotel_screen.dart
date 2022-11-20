import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/widgets/custom_outline_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/counter.dart';
import '../../widgets/custom_button.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  int roomCounter = 0;
  List<int> roomCounterList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonPadding.sizeBoxWithHeight(height: 20),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: sizes!.heightRatio * 5),
                        child: packageCardContainer(
                          hotelTitle: "First Class",
                          cityName: "Gaga",
                          rent: "200",
                          roomType: "Room Type",
                          hotelImage: "https://picsum.photos/200/300",
                          houseNum: "10",
                          bedRoomNum: "10",
                          ratingNum: 3,
                        ),
                      );
                    })),
            CommonPadding.sizeBoxWithHeight(height: 10),
            CustomOutlineButton(
                name: "Skip",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: appColor,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () async {},
                padding: 0),
            CommonPadding.sizeBoxWithHeight(height: 10),
            CustomButton(
              name: "Save and select another Room",
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 14,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
              borderRadius: 5,
              onTapped: () async {},
              padding: 0,
            ),
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
              onTapped: () async {},
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
        height: sizes!.heightRatio * 100,
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
          children: [
            Container(
              height: sizes!.heightRatio * 100,
              width: sizes!.widthRatio * 140,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CustomText(
                        text: hotelTitle,
                        textSize: sizes!.fontRatio * 14,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.black),
                    CommonPadding.sizeBoxWithWidth(width: 10),
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
                    CustomText(
                        text: cityName,
                        textSize: sizes!.fontRatio * 12,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black),
                    CommonPadding.sizeBoxWithWidth(width: 4),
                    for (int i = 0; i < ratingNum; i++)
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                  ],
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                CustomText(
                    text: "Room Type",
                    textSize: sizes!.fontRatio * 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/home_icon.svg",
                          height: sizes!.heightRatio * 17,
                          width: sizes!.widthRatio * 18,
                        ),
                        CommonPadding.sizeBoxWithWidth(width: 2),
                        CustomText(
                            text: houseNum,
                            textSize: sizes!.fontRatio * 15,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ],
                    ),
                    CommonPadding.sizeBoxWithWidth(width: 2),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/bedroom_icon.svg",
                          height: sizes!.heightRatio * 17,
                          width: sizes!.widthRatio * 18,
                        ),
                        CommonPadding.sizeBoxWithWidth(width: 2),
                        CustomText(
                            text: bedRoomNum,
                            textSize: sizes!.fontRatio * 15,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ],
                    ),
                    CommonPadding.sizeBoxWithWidth(width: 15),
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
