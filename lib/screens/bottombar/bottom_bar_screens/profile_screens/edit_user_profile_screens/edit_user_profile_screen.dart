import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/profile_screens/change_password_screens/change_password_screen.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/profile_screens/edit_user_profile_screens/edit_user_profile_provider.dart';
import 'package:qbus/widgets/custom_outline_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../res/colors.dart';
import '../../../../../res/common_padding.dart';
import '../../../../../res/res.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/custom_textField.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  late EditUserProfileProvider editUserProfileProvider;
  late TextEditingController userNameController;
  late TextEditingController emailController;

  var selectedCity = "City";

  @override
  void initState() {
    super.initState();
    editUserProfileProvider = EditUserProfileProvider();
    editUserProfileProvider =
        Provider.of<EditUserProfileProvider>(context, listen: false); //Read
    editUserProfileProvider.init(context: context);

    userNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EditUserProfileProvider>(context, listen: true); //Watch
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          title: const CustomText(
              text: "Edit Profile",
              textSize: 18,
              fontWeight: FontWeight.w700,
              textColor: Colors.white),
        ),
        body: Container(
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
                inputType: TextInputType.name,
                hint: AppLocalizations.of(context)!.email,
              ).get20HorizontalPadding(),
              CommonPadding.sizeBoxWithHeight(height: 15),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
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
                        child:  CustomText(
                            text: AppLocalizations.of(context)!.city,
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
              CommonPadding.sizeBoxWithHeight(height: 15),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
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
                        child:  CustomText(
                            text: AppLocalizations.of(context)!.marital_status,
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
              CommonPadding.sizeBoxWithHeight(height: 20),
              CustomButton(
                      name: "Update",
                      buttonColor: appColor,
                      height: sizes!.heightRatio * 45,
                      width: double.infinity,
                      textSize: sizes!.fontRatio * 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.normal,
                      borderRadius: 5,
                      onTapped: () {
                        Navigator.pop(context);
                      },
                      padding: 0)
                  .get20HorizontalPadding(),
              CommonPadding.sizeBoxWithHeight(height: 10),
              CustomOutlineButton(
                      name: "Change Password",
                      buttonColor: appColor,
                      height: sizes!.heightRatio * 45,
                      width: double.infinity,
                      textSize: sizes!.fontRatio * 16,
                      textColor: AppColors.primary,
                      fontWeight: FontWeight.normal,
                      borderRadius: 5,
                      onTapped: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChangePasswordScreen()));
                      },
                      padding: 0)
                  .get20HorizontalPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
