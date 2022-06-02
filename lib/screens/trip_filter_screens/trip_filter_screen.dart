import 'package:flutter/material.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';

import '../../navigation/navigation_helper.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textField.dart';
import '../search_screens/search_result.dart';

class TripFilterScreen extends StatefulWidget {
  const TripFilterScreen({Key? key}) : super(key: key);

  @override
  State<TripFilterScreen> createState() => _TripFilterScreenState();
}

class _TripFilterScreenState extends State<TripFilterScreen> {
  late TextEditingController couponController;
  var selectedCity = "";
  bool hotel5start = false;
  bool internet = false;
  bool meal = false;
  bool additional = false;

  @override
  void initState() {
    super.initState();
    couponController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
            text: "Trips",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomTextField(
              controller: couponController,
              padding: 0,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "Coupon",
            ).get20HorizontalPadding(),
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomTextField(
              controller: couponController,
              padding: 0,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "Moving Date",
            ).get20HorizontalPadding(),
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomTextField(
              controller: couponController,
              padding: 0,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "Moving Time",
            ).get20HorizontalPadding(),
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomTextField(
              controller: couponController,
              padding: 0,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "Rating",
            ).get20HorizontalPadding(),
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
                    onTapped: () {
                      Navigator.pop(context);
                      // NavigationHelper.pushRoute(context, const SearchResult());
                    },
                    padding: 0)
                .get20HorizontalPadding(),
          ],
        ),
      ),
    ));
  }

  Widget checkBox(
      BuildContext context, bool isSelected, String name, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            height: sizes!.heightRatio * 18,
            width: sizes!.widthRatio * 18,
            decoration: BoxDecoration(
                color: isSelected ? appColor : Colors.white,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    color: isSelected ? appColor : Colors.grey.shade400)),
            child: const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CustomText(
              text: name,
              textSize: sizes!.fontRatio * 14,
              fontWeight: FontWeight.w400,
              textColor: Colors.black)
        ],
      ),
    );
  }
}
