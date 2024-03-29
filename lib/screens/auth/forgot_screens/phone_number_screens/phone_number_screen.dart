import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/auth/forgot_screens/forgot_screen.dart';
import 'package:qbus/screens/auth/forgot_screens/phone_number_screens/phone_number_provider.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'package:qbus/widgets/text_views.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late TextEditingController phoneNumberController;

  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  bool showError = false;

  late PhoneNumberProvider phoneNumberProvider;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();

    phoneNumberProvider = PhoneNumberProvider();
    phoneNumberProvider =
        Provider.of<PhoneNumberProvider>(context, listen: false);
    phoneNumberProvider.init(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PhoneNumberProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        color: AppColors.white,
        width: sizes!.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonPadding.sizeBoxWithHeight(height: 90),
                Center(child: Image.asset("assets/png/main_logo.png")),
                CommonPadding.sizeBoxWithHeight(height: 30),
                Center(
                  child: TextView.getMediumText16(
                      AppLocalizations.of(context)!
                          .enter_mobile_number_get_activation_code,
                      Assets.latoBold,
                      color: AppColors.black900,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      lines: 4),
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 30),
                CustomTextField(
                  controller: phoneNumberController,
                  padding: 20,
                  validator: (val) => null,
                  inputType: TextInputType.number,
                  hint: AppLocalizations.of(context)!.mobile_number,
                ),
                CommonPadding.sizeBoxWithHeight(height: 30),
                CustomButton(
                    name: AppLocalizations.of(context)!.submit,
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
      ),
    );
  }

  Future<void> validateData() async {
    var phoneNumber = phoneNumberController.text.toString().trim();

    if (phoneNumber.isNotEmpty && phoneNumber.length >= 8) {
      await phoneNumberProvider.forgetPasswordUser(phoneNumber: phoneNumber);

      if (phoneNumberProvider.isSuccessful == true) {
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotScreen(
              phoneNumber: phoneNumber,
            ),
          ),
        );
      }
    } else if (phoneNumber.isEmpty) {
      Toasts.getErrorToast(text: "");
    } else if (phoneNumber.length < 8) {
      Toasts.getErrorToast(text: "The Phone must be at least 8");
    }
  }
}
