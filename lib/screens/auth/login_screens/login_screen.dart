import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/auth/sign_up_screens/sign_up_screen.dart';
import 'package:qbus/screens/get_started_screens/get_started_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'package:qbus/core/api_client.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: _getUI(context),
    ));
  }

  Widget _getUI(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 52,
                width: 185,
                child: Image.asset('assets/images/appicon.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                  //text: "Login Into You Account or Sign UP",
                  text: AppLocalizations.of(context)!.language,
                  textSize: 14,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: mobileOrEmailController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Mobile or Email",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Password",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  name: "Login",
                  buttonColor: appColor,
                  height: 45,
                  width: double.infinity,
                  textSize: 14,
                  textColor: Colors.white,
                  fontWeight: FontWeight.normal,
                  borderRadius: 5,
                  // onTapped: () {
                  //   NavigationHelper.pushRoute(context, SignUpScreen());
                  // },
                  onTapped: () {
                    NavigationHelper.pushReplacement(
                        context, const BottomBarScreen());
                  },
                  padding: 20),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomText(
                      text: "Forget password",
                      textSize: 13,
                      fontWeight: FontWeight.normal,
                      textColor: appColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CustomText(
                          text: "Don’t have account ? ",
                          textSize: 13,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const CustomText(
                            text: "Sign Up",
                            textSize: 13,
                            fontWeight: FontWeight.normal,
                            textColor: appColor),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Future<void> loginHandler() async {
    var mobileOrEmail = mobileOrEmailController.text.toString().trim();
    var password = passwordController.text.toString().trim();

    if (mobileOrEmail.isNotEmpty && password.isNotEmpty) {
    } else if (mobileOrEmail.isEmpty) {
      Toasts.getErrorToast(text: "Mobile/Email Field is required");
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: "Password Field is required");
    }

    // if (mobileOrEmailController.text != "" && passwordController.text != "") {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text('Logging in ...'),
    //     backgroundColor: Colors.green.shade300,
    //   ));
    //
    //   // String phone = "0552837665";
    //   // String password = "123456789";
    //   dynamic res = await _apiClient.login(
    //       mobileOrEmailController.text, passwordController.text);
    //
    //   if (res.data['error'] != "Unauthorised") {
    //     String accessToken = res.data['success']['token'];
    //     //success
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: const Text("Success Login"),
    //       backgroundColor: Colors.green.shade300,
    //     ));
    //
    //     Timer(const Duration(seconds: 2), () {
    //       NavigationHelper.pushReplacement(context, const GetStartedScreen());
    //     });
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(res.data['error']),
    //       backgroundColor: Colors.red.shade300,
    //     ));
    //   }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text("All fields required"),
    //     backgroundColor: Colors.red.shade300,
    //   ));
    // }
  }
}
