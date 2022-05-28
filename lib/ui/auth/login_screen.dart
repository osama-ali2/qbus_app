import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/ui/bottombar/screens/home_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'package:qbus/core/api_client.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

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
              CustomTextFeild(
                controller: mobileOrEmailController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Mobile or Email",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFeild(
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
                  onTapped: loginhandler,
                  padding: 20),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      CustomText(
                          text: "Don’t have account ? ",
                          textSize: 13,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.black),
                      CustomText(
                          text: "Sign Up",
                          textSize: 13,
                          fontWeight: FontWeight.normal,
                          textColor: appColor),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CustomText(
                      text: "Forget password",
                      textSize: 13,
                      fontWeight: FontWeight.normal,
                      textColor: appColor),
                ],
              )
            ],
          ),
        ));
  }

  Future<void> loginhandler() async {
    if (mobileOrEmailController.text != "" && passwordController.text != "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Loging in ...'),
        backgroundColor: Colors.green.shade300,
      ));

      // String phone = "0552837665";
      // String password = "123456789";
      dynamic res = await _apiClient.login(
          mobileOrEmailController.text, passwordController.text);

      if (res.data['error'] != "Unauthorised") {
        String accessToken = res.data['success']['token'];
        //sucess
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Success Login"),
          backgroundColor: Colors.green.shade300,
        ));

        Timer(const Duration(seconds: 2), () {
          NavigationHelper.pushReplacement(context, const HomeScreen());
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.data['error']),
          backgroundColor: Colors.red.shade300,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("All fields requred"),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }
}
