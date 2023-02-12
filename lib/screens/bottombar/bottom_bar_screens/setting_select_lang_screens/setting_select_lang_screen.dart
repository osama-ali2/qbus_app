import 'package:flutter/material.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';

class SettingScreenSelectLang extends StatefulWidget {
  const SettingScreenSelectLang({Key? key}) : super(key: key);

  @override
  State<SettingScreenSelectLang> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreenSelectLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Select language",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
