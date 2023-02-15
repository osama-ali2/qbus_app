import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/auth/UserResponse.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/widgets/custom_outline_button.dart';

import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/custom_textField.dart';
import '../change_password_screens/change_password_screen.dart';
import 'edit_user_profile_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditUserProfileScreen extends StatefulWidget {
  final UserResponse userResponse;

  const EditUserProfileScreen({
    Key? key,
    required this.userResponse,
  }) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  late EditUserProfileProvider editUserProfileProvider;

  late TextEditingController userNameController;
  late TextEditingController emailController;

  var selectMaritalStatus = "اختار الحالة الاجتماعية";
  var updateCity = "المدينة";
  var updateCityID = "-1";

  @override
  void initState() {
    super.initState();
    editUserProfileProvider = EditUserProfileProvider();
    editUserProfileProvider =
        Provider.of<EditUserProfileProvider>(context, listen: false); //Read
    editUserProfileProvider.init(context: context);

    debugPrint(
        "fullName: ${widget.userResponse.data!.user!.name.toString()}, email: ${widget.userResponse.data!.user!.email.toString()}");

    userNameController = TextEditingController(
        text: widget.userResponse.data!.user!.name.toString());
    emailController = TextEditingController(
        text: widget.userResponse.data!.user!.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EditUserProfileProvider>(context, listen: true); //Watch
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
            text: "تحديث الملف الشخصي",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: AppColors.white,
            height: sizes!.height,
            width: sizes!.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomTextField(
                  controller: userNameController,
                  padding: 0,
                  validator: (val) => null,
                  inputType: TextInputType.name,
                  hint: AppLocalizations.of(context)!.full_name,
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 15),
                CustomTextField(
                  controller: emailController,
                  padding: 0,
                  validator: (val) => null,
                  inputType: TextInputType.emailAddress,
                  hint: AppLocalizations.of(context)!.email,
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 20.0),
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
                            text: updateCity,
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black,
                          ),
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        items: editUserProfileProvider.cityList
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            updateCity = value!;
                            debugPrint("selectedCity: $updateCity");

                            var l = editUserProfileProvider.citiesList.length;
                            for (int i = 0; i < l; i++) {
                              String name =
                                  editUserProfileProvider.citiesList[i]['city'];
                              String id =
                                  editUserProfileProvider.citiesList[i]['id'];
                              debugPrint("city: $name, id: $id");
                              if (name.contains(updateCity)) {
                                updateCityID = id;
                                debugPrint(
                                    "MatchedCity&Id: $name, $updateCityID");
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 20.0),
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
                          child: CustomText(
                              text: selectMaritalStatus,
                              //AppLocalizations.of(context)!.marital_status,
                              textSize: 12,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.black),
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        items:
                            <String>['Single', 'Married'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectMaritalStatus = value!;
                          });
                          debugPrint("selectedCity: $selectMaritalStatus");
                        },
                      ),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomButton(
                        name: AppLocalizations.of(context)!.update,
                        buttonColor: appColor,
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        textSize: sizes!.fontRatio * 16,
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        borderRadius: 5,
                        onTapped: () {
                          updateUserProfile();
                        },
                        padding: 0)
                    .get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 10),
                CustomOutlineButton(
                        name: AppLocalizations.of(context)!.change_password,
                        buttonColor: appColor,
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        textSize: sizes!.fontRatio * 16,
                        textColor: AppColors.primary,
                        fontWeight: FontWeight.normal,
                        borderRadius: 5,
                        onTapped: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen(),
                            ),
                          );
                        },
                        padding: 0)
                    .get20HorizontalPadding(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateUserProfile() async {
    var name = userNameController.text.toString().trim();
    var userEmail = emailController.text.toString().trim();

    if (name.isNotEmpty &&
        userEmail.isNotEmpty &&
        selectMaritalStatus != "" &&
        updateCity != "" &&
        updateCityID != "") {
      await editUserProfileProvider.updateUserProfile(
          userEmail: userEmail,
          name: name,
          cityId: updateCityID,
          maritalStatus: selectMaritalStatus,
          address: "address");
      if (editUserProfileProvider.isProfileUpdated == true) {
        if (!mounted) return;
        Navigator.pop(context);
      }
    } else if (name.isEmpty) {
      Toasts.getErrorToast(text: "Name is required");
    } else if (userEmail.isEmpty) {
      Toasts.getErrorToast(text: "Email is required");
    }
  }
}
