import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/extensions.dart';

import '../../../../../res/colors.dart';
import '../../../../../res/common_padding.dart';
import '../../../../../res/res.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/custom_textField.dart';
import 'change_password_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late ChangePasswordProvider changePasswordProvider;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;

  @override
  void initState() {
    super.initState();
    changePasswordProvider = ChangePasswordProvider();
    changePasswordProvider =
        Provider.of<ChangePasswordProvider>(context, listen: false); //Read
    changePasswordProvider.init(context: context);

    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ChangePasswordProvider>(context, listen: true); //Watch
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
            text: "Change Password",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          height: sizes!.height,
          width: sizes!.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonPadding.sizeBoxWithHeight(height: 20),
              CustomTextField(
                controller: oldPasswordController,
                padding: 0,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "Old Password",
              ).get20HorizontalPadding(),
              CommonPadding.sizeBoxWithHeight(height: 15),
              CustomTextField(
                controller: newPasswordController,
                padding: 0,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: "New Password",
              ).get20HorizontalPadding(),
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
            ],
          ),
        ),
      ),
    );
  }
}
