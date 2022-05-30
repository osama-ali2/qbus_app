import 'package:flutter/material.dart';

import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../selectAddition/select_addition_screen.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: const CustomText(
            text: "Makkah - Al madina",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(itemBuilder: (context, i) {
        return InkWell(
            onTap: () {
              NavigationHelper.pushRoute(context, const SelectAdditionScreen());
            },
            child: _card(context));
      }),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                        text: "10:30 Makkah",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xff747268),
                      size: 18,
                    ),
                    CustomText(
                        text: "10:30 Makkah",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                  ],
                ),
                Container(
                  height: 20,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2), color: appColor),
                  child: const Center(
                    child: CustomText(
                        text: "SAR 90",
                        textSize: 10,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                        text: "Station A",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xff747268),
                      size: 18,
                    ),
                    CustomText(
                        text: "Station B",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                  ],
                ),
                const CustomText(
                    text: "5 Stops",
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: Color(0xff747268))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                    text: "Jeddah Trip",
                    textSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xff747268)),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    CustomText(
                        text: "(4/5)",
                        textSize: 16,
                        fontWeight: FontWeight.normal,
                        textColor: Color(0xff747268)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                text: "Ac / Hotel 3 star / meal",
                textSize: 14,
                fontWeight: FontWeight.w500,
                textColor: Colors.grey),
          ],
        ),
      ),
    );
  }
}
