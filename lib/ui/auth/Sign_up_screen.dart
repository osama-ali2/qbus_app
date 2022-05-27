
import 'package:flutter/material.dart';
import 'package:qbus/ui/bottombar/bottom_bar_screen.dart';

import '../../navigation/navigation_helper.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body: _getUI(context),
      )
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 52,
            width: 185,
            child: Image.asset('assets/images/appicon.png' , fit: BoxFit.fill,),
          ),
        ),
        SizedBox(
          height: 36,
        ),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Full name",
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Mobile number",
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Email address",
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 58,
            decoration:
            BoxDecoration(
                color: Colors.white,

                border: Border.all(color: Colors.grey.shade400)),
            child: Center(
              child: DropdownButton<String>(
                hint: CustomText(
                    text: "  Location",
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.grey.shade700),
                underline: SizedBox(),
                isExpanded: true,
                items: <String>['Riyadh', 'Abha', 'Dammam', 'Tabuk'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Your address",
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 58,
            decoration:
                BoxDecoration(
                    color: Colors.white,

                    border: Border.all(color: Colors.grey.shade400)),
            child: Center(
              child: DropdownButton<String>(
                hint: CustomText(
                    text: "  Marital Status",
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.grey.shade700),
                underline: SizedBox(),
                isExpanded: true,
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        ),
        SizedBox(
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
            name: "Sign up",
            buttonColor: appColor,
            height: 45,
            width: double.infinity,
            textSize: 14,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius: 5,
            onTapped: () {
              NavigationHelper.pushReplacement(context, BottomBarScreen());
            },
            padding: 20),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomText(
                text: "Already have an account? ",
                textSize: 13,
                fontWeight: FontWeight.normal,
                textColor: Colors.black),
            CustomText(
                text: "Sign In",
                textSize: 13,
                fontWeight: FontWeight.normal,
                textColor: appColor),
          ],
        )
      ],
    );
  }
}
