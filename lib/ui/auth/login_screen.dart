import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/ui/auth/Sign_up_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
      body: _getUI(context),
        )
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 90,
        ),
        Container(
          height: 52,
          width: 185,
          child: Image.asset('assets/images/appicon.png'),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomText(
            text: "Login Into You Account or Sign UP",
            textSize: 14,
            fontWeight: FontWeight.normal,
            textColor: Colors.black),
        SizedBox(
          height: 30,
        ),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Email",
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFeild(
          controller: _email,
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
            onTapped: () {
              NavigationHelper.pushRoute(context, SignUpScreen());
            },
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
            SizedBox(width: 10,),
            const CustomText(
                text: "Forget password",
                textSize: 13,
                fontWeight: FontWeight.normal,
                textColor: appColor),
          ],
        )
      ],
    );
  }
}