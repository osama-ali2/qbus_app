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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            text: AppLocalizations.of(context)!."change_password",
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
                hint: AppLocalizations.of(context)!.old_password,
              ).get20HorizontalPadding(),
              CommonPadding.sizeBoxWithHeight(height: 15),
              CustomTextField(
                controller: newPasswordController,
                padding: 0,
                validator: (val) => null,
                inputType: TextInputType.name,
                hint: AppLocalizations.of(context)!.new_password,
              ).get20HorizontalPadding(),
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
                      onTapped: () async {
                        await validateData();
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

  /// Validating Data
  Future<void> validateData() async {
    var currentPassword = oldPasswordController.text.toString().trim();
    var newPassword = newPasswordController.text.toString().trim();
    if (currentPassword.isNotEmpty && newPassword.isNotEmpty) {
      // Call API
      await changePasswordProvider.updateUserPassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      /// If password Updated
      if (changePasswordProvider.isPasswordUpdated == true) {
        if (!mounted) return;
        Navigator.pop(context);
      }
    } else if (currentPassword.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.old_password_required);
    } else if (newPassword.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.new_password_required);
    }
  }
}
