import 'package:flutter/material.dart';
import 'package:qbus/res/res.dart';

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
  late TextEditingController phoneNumberController;
  late TextEditingController subjectController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
            text: "Contact Us",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: _getUI(context),
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
          hint: "Name",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: emailController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Email address",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: phoneNumberController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Phone Number",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: subjectController,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Subject",
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
                maxLines: 20,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Your Message"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: sizes!.heightRatio * 20,
        ),
        CustomButton(
            name: "Send",
            buttonColor: appColor,
            height: sizes!.heightRatio * 45,
            width: double.infinity,
            textSize: sizes!.fontRatio * 14,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius: 5,
            onTapped: () {
              Navigator.pop(context);
            },
            padding: 20),
      ],
    );
  }
}
