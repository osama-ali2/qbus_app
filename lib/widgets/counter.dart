import 'package:flutter/material.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/widgets/custom_text.dart';

class Counter extends StatelessWidget {
  final int number;
  final Function onAdd;
  final Function onMinus;

  const Counter({
    Key? key,
    required this.number,
    required this.onAdd,
    required this.onMinus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onMinus.call(),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.primary)),
            child: const Center(
                child: CustomText(
                    text: "-",
                    textSize: 22,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.primary)),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        CustomText(
            text: "$number",
            textSize: 16,
            fontWeight: FontWeight.normal,
            textColor: Colors.black),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () => onAdd.call(),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.primary),
            ),
            child: const Center(
              child: CustomText(
                  text: "+",
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
