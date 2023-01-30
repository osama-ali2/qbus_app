import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'change_password_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late ChangePasswordProvider changePasswordProvider;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    changePasswordProvider = ChangePasswordProvider();
    changePasswordProvider =
        Provider.of<ChangePasswordProvider>(context, listen: false); //Read
    changePasswordProvider.init(context: context);
  }

  @override
  void dispose() {
    super.dispose();

    oldPasswordController.dispose();
    newPasswordController.dispose();
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
                        validateData();
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

  Future<void> validateData() async {
    var fullName = oldPasswordController.text.toString().trim();
    var password = newPasswordController.text.toString().trim();
    if (fullName.isNotEmpty && password.isNotEmpty) {
    } else if (fullName.isEmpty) {
      Toasts.getErrorToast(text: "Old password is required");
    } else if (password.isEmpty) {
      Toasts.getErrorToast(text: "New password is required");
    }
  }
}
