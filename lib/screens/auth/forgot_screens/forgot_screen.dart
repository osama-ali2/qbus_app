import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/text_views.dart';

import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  late TextEditingController codeController;
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const length = 4;
    const borderColor = AppColors.primary;
    const errorColor = AppColors.error400;
    final defaultPinTheme = PinTheme(
      width: sizes!.widthRatio * 48,
      height: sizes!.heightRatio * 48,
      textStyle: GoogleFonts.poppins(
        fontSize: sizes!.fontRatio * 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
    );

    final followingPinTheme = PinTheme(
      width: sizes!.widthRatio * 48,
      height: sizes!.heightRatio * 48,
      textStyle: GoogleFonts.poppins(
        fontSize: sizes!.fontRatio * 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        // color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray100, width: 1),
      ),
    );

    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.white,
        // height: sizes!.height,
        width: sizes!.width,
        child: SingleChildScrollView(
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
              CommonPadding.sizeBoxWithHeight(height: 50),
              Pinput(
                length: length,
                controller: codeController,
                pinAnimationType: PinAnimationType.scale,
                focusNode: focusNode,
                followingPinTheme: followingPinTheme,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (pin) {
                  setState(() => showError = pin != '5555');
                },
                onSubmitted: (pin) {
                  debugPrint("Successful :$pin");
                  Toasts.getSuccessToast(text: "Successful :$pin");
                },
                focusedPinTheme: defaultPinTheme.copyWith(
                  height: sizes!.fontRatio * 58,
                  width: sizes!.fontRatio * 58,
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: borderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: errorColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              CommonPadding.sizeBoxWithHeight(height: 50),
              CustomTextField(
                controller: passwordController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "New Password",
              ),
              CommonPadding.sizeBoxWithHeight(height: 15),
              CustomTextField(
                controller: confirmPasswordController,
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
                    validateData();
                  },
                  padding: 20),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> validateData() async {
    var code = codeController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    var confirmPassword = confirmPasswordController.text.toString().trim();

    if (code.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty) {
      Navigator.pop(context);
    } else if (code.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (confirmPassword.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    }
  }
}
