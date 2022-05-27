import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widgets/custom_text.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Booking History",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
        return _card(context);
      }),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: 100,
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
                        text: " 10:30 Makkah",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xff747268),
                      size: 18,
                    ),
                    CustomText(
                        text: " 10:30 Makkah",
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
                  child: Center(
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
                CustomText(
                    text: "Jeddah Trip",
                    textSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xff747268)),
                Row(
                  children: [
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
            SizedBox(height: 10,),
            Container(
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: appColor)),
              child: const Center(
                child: CustomText(
                    text: "Booked",
                    textSize: 10,
                    fontWeight: FontWeight.normal,
                    textColor: appColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
