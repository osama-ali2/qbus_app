import 'package:flutter/material.dart';
import 'package:qbus/widgets/custom_text.dart';

class SettingCard extends StatelessWidget {
  final String name;
  final Function onTap;

  const SettingCard({Key? key, required this.name, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE7E8E8)), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: name,
                  textSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: const Color(0xff747268)),
              IconButton(
                  onPressed: ()=>onTap(),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ))

            ],
          ),
        ),
      ),
    );
  }
}
