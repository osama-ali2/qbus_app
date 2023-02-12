import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/screens/auth/forgot_screens/forgot_provider.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/widgets/text_views.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_password_textField.dart';

class ForgotScreen extends StatefulWidget {
  final String? phoneNumber;

  const ForgotScreen({Key? key, this.phoneNumber}) : super(key: key);

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

  final ValueNotifier<bool> _isNewPassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isConfirmPassword = ValueNotifier<bool>(true);

  ForgotProvider forgotProvider = ForgotProvider();

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    forgotProvider = ForgotProvider();
    forgotProvider = Provider.of<ForgotProvider>(context, listen: false);
    forgotProvider.init(context: context);
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
    Provider.of<ForgotProvider>(context, listen: true);
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          width: sizes!.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonPadding.sizeBoxWithHeight(height: 90),
                Center(child: Image.asset("assets/png/main_logo.png")),
                CommonPadding.sizeBoxWithHeight(height: 30),
                Center(
                  child: TextView.getMediumText16(
                      AppLocalizations.of(context)!
                              .reset_password_token_sent_to +
                          "${widget.phoneNumber}",
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
                    Toasts.getSuccessToast(
                        text:
                            AppLocalizations.of(context)!.successful + "$pin");
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
                ValueListenableBuilder(
                  builder: (BuildContext context, value, Widget? child) {
                    return CustomPasswordTextField(
                      controller: passwordController,
                      padding: 20,
                      validator: (val) => null,
                      inputType: TextInputType.name,
                      hint: AppLocalizations.of(context)!.new_password,
                      isVisible: _isNewPassword.value,
                      onPress: () {
                        _isNewPassword.value = !_isNewPassword.value;
                      },
                    );
                  },
                  valueListenable: _isNewPassword,
                ),
                CommonPadding.sizeBoxWithHeight(height: 15),
                ValueListenableBuilder(
                  builder: (BuildContext context, value, Widget? child) {
                    return CustomPasswordTextField(
                      controller: confirmPasswordController,
                      padding: 20,
                      validator: (val) => null,
                      inputType: TextInputType.name,
                      hint: AppLocalizations.of(context)!.confirm_password,
                      isVisible: _isConfirmPassword.value,
                      onPress: () {
                        _isConfirmPassword.value = !_isConfirmPassword.value;
                      },
                    );
                  },
                  valueListenable: _isConfirmPassword,
                ),
                CommonPadding.sizeBoxWithHeight(height: 60),
                CustomButton(
                    name: AppLocalizations.of(context)!.reset_password,
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
    var code = codeController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    var confirmPassword = confirmPasswordController.text.toString().trim();

    if (code.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword) {
      await forgotProvider.forgetPasswordUser(password: password, code: code);

      if (forgotProvider.isSuccessful) {
        if (!mounted) return;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else if (code.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (confirmPassword.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (password != confirmPassword) {
      Toasts.getErrorToast(
          text: AppLocalizations.of(context)!.password_not_matched);
    }
  }
}
