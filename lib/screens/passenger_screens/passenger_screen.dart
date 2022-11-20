import 'package:flutter/material.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/hotel_screens/hotel_screen.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';

import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';

class PassengerScreen extends StatefulWidget {
  final num passengerCount;

  const PassengerScreen({Key? key, required this.passengerCount})
      : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final fullNameController = TextEditingController();
  final controller = TextEditingController();

  final List<TextEditingController> _controllers = [];

  final List<Widget> _fields = [];

  final identityList = ["ID", "Passport"];
  final countryList = ["Saudi Arabic", "Qatar", "Pakistan"];
  var selectedIdentityType = "Identity proof type";
  var selectedCountry = "Country";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addFields();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addFields() {
    for (int i = 0; i < widget.passengerCount; i++) {
      final controller = TextEditingController();
      final field =
          passengerContainer(passengerNumber: "${_controllers.length + 1}");

      setState(() {
        _controllers.add(controller);
        _fields.add(field);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Add Passengers",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _fields.length,
                itemBuilder: (context, index) {
                  return _fields[index];
                },
              ),
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
            CustomButton(
              name: "Next",
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 14,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
              borderRadius: 5,
              onTapped: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HotelScreen()));
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  Widget passengerContainer({required String passengerNumber}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonPadding.sizeBoxWithHeight(height: 20),
        CustomText(
            text: "Passenger $passengerNumber",
            textSize: sizes!.fontRatio * 14,
            fontWeight: FontWeight.w700,
            textColor: Colors.black),
        CommonPadding.sizeBoxWithHeight(height: 10),
        CustomTextField(
          controller: fullNameController,
          padding: 0,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: "Full Name",
        ),
        CommonPadding.sizeBoxWithHeight(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: sizes!.heightRatio * 48,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: DropdownButton<String>(
              hint: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10),
                child: CustomText(
                    text: selectedIdentityType,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black),
              ),
              underline: const SizedBox(),
              isExpanded: true,
              items: identityList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedIdentityType = value!;
                });
              },
            ),
          ),
        ),
        CommonPadding.sizeBoxWithHeight(height: 10),
        CustomTextField(
          controller: fullNameController,
          padding: 0,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: "ID Number",
        ),
        CommonPadding.sizeBoxWithHeight(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: sizes!.heightRatio * 48,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: DropdownButton<String>(
              hint: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10),
                child: CustomText(
                    text: selectedCountry,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black),
              ),
              underline: const SizedBox(),
              isExpanded: true,
              items: countryList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
