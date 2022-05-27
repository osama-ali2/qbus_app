import 'package:flutter/material.dart';
import 'package:qbus/utils/constant.dart';

import 'custom_text.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final double padding;
  final Function(String) validator;
  final TextInputType inputType;
  final String hint;
  const CustomTextFeild(
      {Key? key,
      required this.controller,
      required this.padding,
      required this.validator,
      required this.inputType, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        keyboardType: inputType,
        validator: (val) => validator(val!),
        controller: controller,
        style: const TextStyle(
            letterSpacing: 0,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            letterSpacing: 1,
            color: Colors.black,
            fontSize: 10
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: new BorderSide(color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor),
              borderRadius: BorderRadius.circular(0)),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: new BorderSide(color: appColor)),
        ),
      ),
    );
  }
}
