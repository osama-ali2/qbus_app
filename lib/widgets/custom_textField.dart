import 'package:flutter/material.dart';
import 'package:qbus/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double padding;
  final Function(String) validator;
  final TextInputType inputType;
  final String hint;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.padding,
      required this.validator,
      required this.inputType,
      required this.hint})
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
              letterSpacing: 1, color: Colors.black, fontSize: 10),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: appColor),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: appColor)),
        ),
      ),
    );
  }
}
