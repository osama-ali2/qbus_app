import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/auth/sign_up_screens/sign_up_provider.dart';
//import '../../../navigation/navigation_helper.dart';
import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_password_textField.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textField.dart';
//import '../phone_activation_screens/phone_activation_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  var selectedCity = "Riyadh";
  var selectedCityId = "-1";
  var selectedMartialStatus = "Single";

  late SignUpProvider signUpProvider;
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    signUpProvider = SignUpProvider();
    signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    signUpProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpProvider.getCitiesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SignUpProvider>(context, listen: true);
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
              CommonPadding.sizeBoxWithHeight(height: 60),
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
              SizedBox(
                height: sizes!.heightRatio * 10,
              ),
               CustomText(
                  text: AppLocalizations.of(context)!.sign_up_title,
                  textSize: 14,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              SizedBox(
                height: sizes!.heightRatio * 20,
              ),
              CustomTextField(
                controller: _fullNameController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: AppLocalizations.of(context)!.full_name,
              ),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              CustomTextField(
                controller: _phoneNumberController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.number,
                hint: AppLocalizations.of(context)!.mobile_number,
              ),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              CustomTextField(
                controller: _emailController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.emailAddress,
                hint: AppLocalizations.of(context)!.email,
              ),
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: sizes!.heightRatio * 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: CustomText(
                            text: selectedCity,
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: signUpProvider.cityList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(
                          () {
                            selectedCity = value!;
                            debugPrint("selectedCity: $selectedCity");

                            var l = signUpProvider.citiesList.length;
                            for (int i = 0; i < l; i++) {
                              String name =
                                  signUpProvider.citiesList[i]['city'];
                              String id = signUpProvider.citiesList[i]['id'];
                              debugPrint("city: $name, id: $id");
                              if (name.contains(selectedCity)) {
                                selectedCityId = id;
                                debugPrint(
                                    "MatchedCity&Id: $name, $selectedCityId");
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizes!.heightRatio * 10,
              ),
              CustomTextField(
                controller: _yourAddressController,
                padding: 20,
                validator: (val) => null,
                inputType: TextInputType.text,
                hint: AppLocalizations.of(context)!.address,
              ),
              SizedBox(
                height: sizes!.heightRatio * 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: sizes!.heightRatio * 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes!.widthRatio * 10),
                        child: CustomText(
                            text: selectedMartialStatus,
                            textSize: sizes!.fontRatio * 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: <String>["Single", "Married"].map((String value) {
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
              SizedBox(
                height: sizes!.heightRatio * 10,
              ),
              ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return CustomPasswordTextField(
                    controller: _passwordController,
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
                height: sizes!.heightRatio * 10,
              ),
              CustomButton(
                  name: AppLocalizations.of(context)!.sign_up,
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
              SizedBox(
                height: sizes!.heightRatio * 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: AppLocalizations.of(context)!.already_have_account,
                      textSize: sizes!.fontRatio * 13,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: CustomText(
                        text: AppLocalizations.of(context)!.sign_in,
                        textSize: sizes!.fontRatio * 13,
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
      await signUpProvider.signUpNewUser(
          userName: fullName,
          phoneNumber: mobilePhone,
          email: email,
          address: yourAddress,
          password: password,
          status: selectedMartialStatus,
          cityId: selectedCityId);
      if (signUpProvider.isDataLoaded == true) {
        if (!mounted) return;
       Toasts.getSuccessToast(text: "Sign Up");
      }
    } else if (fullName.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (mobilePhone.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (email.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (yourAddress.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (selectedMartialStatus == "") {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    } else if (selectedCity == "") {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    }
  }
}
