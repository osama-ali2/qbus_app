import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/auth/forgot_screens/forgot_screen.dart';
import 'package:qbus/screens/auth/login_screens/login_provider.dart';
import 'package:qbus/screens/auth/sign_up_screens/sign_up_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_password_textField.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'dart:async';
import '../../bottombar/bottom_bar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late LoginProvider loginProvider;

  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    loginProvider = LoginProvider();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: sizes!.height,
        width: sizes!.width,
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizes!.heightRatio * 100,
              ),
              SizedBox(
                height: sizes!.heightRatio * 52,
                width: sizes!.widthRatio * 185,
                child: Image.asset('assets/images/appicon.png'),
              ),
              SizedBox(
                height: sizes!.heightRatio * 20,
              ),
              CustomText(
                  //text: "Login Into You Account or Sign UP",
                  text: AppLocalizations.of(context)!.login_title,
                  textSize: sizes!.fontRatio * 14,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              SizedBox(
                height: sizes!.heightRatio * 100,
              ),
              CustomTextField(
                controller: mobileOrEmailController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.number,
                hint: AppLocalizations.of(context)!.mobile_number,
              ),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return CustomPasswordTextField(
                    controller: passwordController,
                    padding: 20,
                    validator: (val) => null,
                    inputType: TextInputType.name,
                    hint: AppLocalizations.of(context)!.password,
                    isVisible: _isVisible.value,
                    onPress: () {
                      _isVisible.value = !_isVisible.value;
                    },
                  );
                },
                valueListenable: _isVisible,
              ),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              CustomButton(
                  name: AppLocalizations.of(context)!.login,
                  buttonColor: appColor,
                  height: sizes!.heightRatio * 45,
                  width: double.infinity,
                  textSize: sizes!.fontRatio * 14,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  borderRadius: 5,
                  onTapped: () {
                    loginHandler();
                  },
                  padding: 20),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: AppLocalizations.of(context)!.dont_have_account,
                          textSize: sizes!.fontRatio * 14,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: CustomText(
                            text: AppLocalizations.of(context)!.sign_up,
                            textSize: sizes!.fontRatio * 13,
                            fontWeight: FontWeight.w500,
                            textColor: appColor),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotScreen()));
                    },
                    child: CustomText(
                        text: AppLocalizations.of(context)!.forget_password,
                        textSize: sizes!.fontRatio * 14,
                        fontWeight: FontWeight.w400,
                        textColor: appColor),
                  ),
                ],
              ).get20HorizontalPadding(),
            ],
          ),
        ),
      ),
    )));
  }

  Future<void> loginHandler() async {
    var mobileOrEmail = mobileOrEmailController.text.toString().trim();
    var password = passwordController.text.toString().trim();

    if (mobileOrEmail.isNotEmpty && password.isNotEmpty) {
      await loginProvider.loginUser(
          phoneNumber: mobileOrEmail, password: password);
      if (loginProvider.isDataLoaded) {
        if (!mounted) return;
        NavigationHelper.pushReplacement(context, const BottomBarScreen());
      }
    } else if (mobileOrEmail.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.mobile_required);
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.password_required);
    }
  }
}
