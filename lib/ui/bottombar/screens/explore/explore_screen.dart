import 'package:flutter/material.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/package_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
            text: "Explore Package",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, i) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: PackageCard(),
                );
              }),
        ),
        CustomButton(
            name: "Filter",
            buttonColor: appColor,
            height: 45,
            width: double.infinity,
            textSize: 14,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius: 5,
            onTapped: () {},
            padding: 0),
      ],
    );
  }
}
