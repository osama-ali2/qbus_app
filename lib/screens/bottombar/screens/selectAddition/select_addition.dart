import 'package:flutter/material.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../../auth/login_screens/login_screen.dart';

class SelectAddition extends StatefulWidget {
  const SelectAddition({Key? key}) : super(key: key);

  @override
  State<SelectAddition> createState() => _SelectAdditionState();
}

class _SelectAdditionState extends State<SelectAddition> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomButton(
                name: "PROCEED TO PAYMENT",
                buttonColor: appColor,
                height: 45,
                width: double.infinity,
                textSize: 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () {},
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
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: appColor)),
                  child: const Center(
                    child: CustomText(
                        text: "Login",
                        textSize: 15,
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
        title: const CustomText(
            text: "Select Additions",
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
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: name,
                textSize: 16,
                fontWeight: FontWeight.normal,
                textColor: const Color(0xff747268)),
            Counter(number: number, onAdd: () => add(), onMinus: () => minus())
          ],
        ),
      ),
    );
  }
}
