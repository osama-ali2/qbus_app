import 'package:flutter/material.dart';

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
  final TextEditingController _email = TextEditingController();

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
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Name",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Email address",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Phone Number",
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _email,
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
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: TextFormField(
                maxLines: 1000,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Your Message"),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
            name: "Send",
            buttonColor: appColor,
            height: 45,
            width: double.infinity,
            textSize: 14,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius: 5,
            onTapped: () {},
            padding: 20),
      ],
    );
  }
}
