import 'package:flutter/material.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../auth/login_screens/login_screen.dart';

class SelectAdditionScreen extends StatefulWidget {
  const SelectAdditionScreen({Key? key}) : super(key: key);

  @override
  State<SelectAdditionScreen> createState() => _SelectAdditionScreenState();
}

class _SelectAdditionScreenState extends State<SelectAdditionScreen> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: sizes!.heightRatio * 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomButton(
                name: "PROCEED TO PAYMENT",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () {
                  Toasts.getErrorToast(text: "Try it Later");
                },
                padding: 20),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: sizes!.heightRatio * 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: appColor)),
                  child: Center(
                    child: CustomText(
                        text: "Continue",
                        textSize: sizes!.fontRatio * 15,
                        fontWeight: FontWeight.w500,
                        textColor: appColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Select Additions",
            textSize: sizes!.fontRatio * 18,
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
        const SizedBox(
          height: 10,
        ),
        _items(context, "Hotel 5 Sar (600)", () {
          hotel++;
          setState(() {});
        }, () {
          if (hotel > 0) {
            hotel--;
            setState(() {});
          }
        }, hotel),
        _items(context, "Chicken legs (30)", () {
          chicken++;
          setState(() {});
        }, () {
          if (chicken > 0) {
            chicken--;
            setState(() {});
          }
        }, chicken),
        _items(context, "Water (1)", () {
          water++;
          setState(() {});
        }, () {
          if (water > 0) {
            water--;
            setState(() {});
          }
        }, water),
      ],
    );
  }

  Widget _items(BuildContext context, String name, Function add, Function minus,
      int number) {
    return Container(
      height: sizes!.heightRatio * 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: name,
                textSize: sizes!.fontRatio * 16,
                fontWeight: FontWeight.normal,
                textColor: const Color(0xff747268)),
            Counter(number: number, onAdd: () => add(), onMinus: () => minus())
          ],
        ),
      ),
    );
  }
}
