import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/screens/bottombar/bottom_bar_screens/contact_us_screens/contact_us_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_textField.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;
  late TextEditingController phoneNumberController;
  late ContactUsProvider contactUsProvider;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    phoneNumberController = TextEditingController();

    contactUsProvider = ContactUsProvider();
    contactUsProvider = Provider.of<ContactUsProvider>(context, listen: false);
    contactUsProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ContactUsProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: CustomText(
          text: AppLocalizations.of(context)!.contact_us,
          textSize: 18,
          fontWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: SingleChildScrollView(child: _getUI(context))),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        CustomTextField(
          controller: fullNameController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: AppLocalizations.of(context)!.full_name,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: emailController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.emailAddress,
          hint: AppLocalizations.of(context)!.email,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: phoneNumberController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.phone,
          hint: AppLocalizations.of(context)!.mobile_number,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: subjectController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: AppLocalizations.of(context)!.subject,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: TextFormField(
                controller: messageController,
                keyboardType: TextInputType.text,
                maxLines: 20,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppLocalizations.of(context)!.your_message,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizes!.heightRatio * 20,
        ),
        CustomButton(
            name: AppLocalizations.of(context)!.send,
            buttonColor: appColor,
            height: sizes!.heightRatio * 45,
            width: double.infinity,
            textSize: sizes!.fontRatio * 14,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius: 5,
            onTapped: () {
              validateData();
            },
            padding: 20),
      ],
    );
  }

  /// Validate Data
  Future<void> validateData() async {
    var name = fullNameController.text.toString().trim();
    var email = emailController.text.toString().trim();
    var phoneNumber = phoneNumberController.text.toString().trim();
    var subject = subjectController.text.toString().trim();
    var message = messageController.text.toString().trim();

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        subject.isNotEmpty &&
        subject.length > 8 &&
        message.isNotEmpty &&
        phoneNumber.isNotEmpty) {
      await contactUsProvider.contactUsSubmit(
          name: name,
          email: email,
          subject: subject,
          message: message,
          phoneNumber: phoneNumber);
      if (contactUsProvider.isDataSubmitted) {
        if (!mounted) return;
        Navigator.pop(context);
      }
    } else if (name.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.name_required);
    } else if (email.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.email_required);
    } else if (subject.isEmpty) {
      Toasts.getErrorToast(
          text: AppLocalizations.of(context)!.subject_required);
    } else if (subject.length < 8) {
      Toasts.getErrorToast(
          text: AppLocalizations.of(context)!.subject_length_required);
    } else if (message.isEmpty) {
      Toasts.getErrorToast(
          text: AppLocalizations.of(context)!.message_required);
    } else if (phoneNumber.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.mobile_required);
    }
  }
}
