import 'package:flutter/material.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/setting_card.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Settings",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SettingCard(
          onTap: () {},
          name: 'Language',
        ),
      ],
    );
  }
}
