import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import '../hotel_provider.dart';

class HotelFilterScreen extends StatefulWidget {
  const HotelFilterScreen({Key? key}) : super(key: key);

  @override
  State<HotelFilterScreen> createState() => _HotelFilterScreenState();
}

class _HotelFilterScreenState extends State<HotelFilterScreen> {
  late TextEditingController couponController;
  late HotelProvider hotelProvider;

  List<String> roomQuantityList = ["1", "2", "3", "4", "5"];
  List<String> maxAdultsList = ["1", "2", "3", "4", "5"];

  var roomQuantity = "Room Quantity";
  var maxAdults = "Max Adults";

  @override
  void initState() {
    super.initState();

    hotelProvider = HotelProvider();
    hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    hotelProvider.init(context: context);
    couponController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HotelProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
            text: "Hotels",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: AppColors.white,
            height: sizes!.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomTextField(
                  controller: couponController,
                  padding: 0,
                  validator: (val) => null,
                  inputType: TextInputType.name,
                  hint: "Hotel Name",
                ),
                CommonPadding.sizeBoxWithHeight(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: sizes!.heightRatio * 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: CustomText(
                            text: roomQuantity,
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: roomQuantityList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          roomQuantity = value!;
                        });
                      },
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: sizes!.heightRatio * 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: CustomText(
                            text: maxAdults,
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: maxAdultsList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          maxAdults = value!;
                          debugPrint("maxAdults: $maxAdults");
                        });
                      },
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomButton(
                    name: "Filter Result",
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.normal,
                    borderRadius: 5,
                    onTapped: () {},
                    padding: 0),
                CommonPadding.sizeBoxWithHeight(height: 20),
              ],
            ).get20HorizontalPadding(),
          ),
        ),
      ),
    );
  }
}
