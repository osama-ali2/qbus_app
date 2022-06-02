import 'package:flutter/material.dart';
import 'package:qbus/res/colors.dart';

class PhoneActivationScreen extends StatefulWidget {
  const PhoneActivationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneActivationScreen> createState() => _PhoneActivationScreenState();
}

class _PhoneActivationScreenState extends State<PhoneActivationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.white,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
