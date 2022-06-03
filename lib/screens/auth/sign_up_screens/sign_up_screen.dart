import 'package:flutter/material.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screen.dart';
import '../../../navigation/navigation_helper.dart';
import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textField.dart';
import '../phone_activation_screens/phone_activation_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _yourAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var selectedCity = "";
  var selectedMartialStatus = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 52,
                  width: 185,
                  child: Image.asset(
                    'assets/images/appicon.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                  text: "Lets Get Started!",
                  textSize: 14,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _fullNameController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Full name",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _phoneNumberController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Mobile number",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _emailController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Email address",
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: const CustomText(
                            text: "City",
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: <String>['Riyadh', 'Abha', 'Dammam', 'Tabuk']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                        debugPrint("selectedCity: $selectedCity");
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _yourAddressController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Your address",
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: const CustomText(
                            text: "Marital Status",
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMartialStatus = value!;
                        });
                        debugPrint(
                            "selected Martial Status: $selectedMartialStatus ");
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _passwordController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  name: "Sign up",
                  buttonColor: appColor,
                  height: sizes!.heightRatio * 45,
                  width: double.infinity,
                  textSize: sizes!.fontRatio * 14,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  borderRadius: 5,
                  onTapped: () {
                    validateSignUpData();
                  },
                  padding: 20),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                      text: "Already have an account? ",
                      textSize: 13,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const CustomText(
                        text: "Sign In",
                        textSize: 13,
                        fontWeight: FontWeight.normal,
                        textColor: appColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> validateSignUpData() async {
    var fullName = _fullNameController.text.toString().trim();
    var mobilePhone = _phoneNumberController.text.toString().trim();
    var email = _emailController.text.toString().trim();
    var yourAddress = _yourAddressController.text.toString().trim();
    var password = _passwordController.text.toString().trim();

    if (fullName.isNotEmpty &&
        mobilePhone.isNotEmpty &&
        email.isNotEmpty &&
        yourAddress.isNotEmpty &&
        password.isNotEmpty &&
        selectedMartialStatus != "" &&
        selectedCity != "") {
      NavigationHelper.pushRoute(context, const PhoneActivationScreen());
    } else if (fullName.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (mobilePhone.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (email.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (yourAddress.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: "Field is required");
    } else if (selectedMartialStatus == "") {
      Toasts.getErrorToast(text: "Field is required");
    } else if (selectedCity == "") {
      Toasts.getErrorToast(text: "Field is required");
    }
  }
}
