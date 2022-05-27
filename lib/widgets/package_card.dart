import 'package:flutter/material.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 130,
            width: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  "assets/images/asste.png",
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                  text: "Umrah Package",
                  textSize: 14,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const CustomText(
                  text: "Explore how to roast to brew coffee like the local.",
                  textSize: 10,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                text: "20/05/2022",
                textSize: 10,
                fontWeight: FontWeight.normal,
                textColor: Colors.black,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 22,
                      ),
                      CustomText(
                          text: "4.3",
                          textSize: 12,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.black)
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: CustomText(
                          text: "SKR 3.8k",
                          textSize: 10,
                          fontWeight: FontWeight.normal,
                          textColor: Colors.white),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
