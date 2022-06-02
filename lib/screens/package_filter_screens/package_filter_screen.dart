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

class PackageFilterScreen extends StatefulWidget {
  const PackageFilterScreen({Key? key}) : super(key: key);

  @override
  State<PackageFilterScreen> createState() => _PackageFilterScreenState();
}

class _PackageFilterScreenState extends State<PackageFilterScreen> {
  late TextEditingController couponController;

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
            text: "Packages",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
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
                      // NavigationHelper.pushRoute(context, const SearchResult());
                    },
                    padding: 0)
                .get20HorizontalPadding(),
          ],
        ),
      ),
    ));
  }
}
