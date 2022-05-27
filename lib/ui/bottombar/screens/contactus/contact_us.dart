import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_textField.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _email = TextEditingController();

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
        SizedBox(height: 40),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Name",
        ),
        SizedBox(height: 10),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Email address",
        ),
        SizedBox(height: 10),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Phone Number",
        ),
        SizedBox(height: 10),
        CustomTextFeild(
          controller: _email,
          padding: 20,
          validator: (val) => null,
          inputType: TextInputType.name,
          hint: "Subject",
        ),
        SizedBox(height: 10),
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
                decoration: InputDecoration(
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
