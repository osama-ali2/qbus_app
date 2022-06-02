import 'package:flutter/material.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/widgets/text_views.dart';

import '../../../navigation/navigation_helper.dart';
import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.white,
        height: sizes!.height,
        width: sizes!.width,
        child: Column(
          children: [
            CommonPadding.sizeBoxWithHeight(height: 90),
            Center(child: Image.asset("assets/png/main_logo.png")),
            CommonPadding.sizeBoxWithHeight(height: 30),
            Center(
              child: TextView.getMediumText16(
                  "Reset Password Token has been sent to +966521***.",
                  Assets.latoBold,
                  color: AppColors.black900,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  lines: 4),
            ).get20HorizontalPadding(),
            CommonPadding.sizeBoxWithHeight(height: 60),
            CustomTextField(
              controller: passwordController,
              padding: 20,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "New Password",
            ),
            CommonPadding.sizeBoxWithHeight(height: 15),
            CustomTextField(
              controller: passwordController,
              padding: 20,
              validator: (val) => null,
              inputType: TextInputType.name,
              hint: "Confirm Password",
            ),
            CommonPadding.sizeBoxWithHeight(height: 60),
            CustomButton(
                name: "Reset Password",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                borderRadius: 5,
                onTapped: () {
                  Navigator.pop(context);
                },
                padding: 20),
          ],
        ),
      ),
    ));
  }
}
