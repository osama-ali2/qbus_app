import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/hotel_screens/hotel_screen.dart';
import 'package:qbus/screens/passenger_screens/passenger_provider.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';

import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';

class PassengerScreen extends StatefulWidget {
  final int passengerCount;
  final int tripId;

  const PassengerScreen(
      {Key? key, required this.passengerCount, required this.tripId})
      : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  late PassengerProvider passengerProvider;

  final fullNameController = TextEditingController();
  final idNumberController = TextEditingController();

  final List<TextEditingController> _controllers = [];
  final List<Widget> _fields = [];

  /// Fields
  final List<TextEditingController> _fullNameControllers = [];
  final List<TextEditingController> _idNumberControllers = [];

  final identityList = ["ID", "Passport"];
  final countryList = ["Saudi Arabic", "Qatar", "Pakistan"];
  var selectedIdentityType = "Identity proof type";
  var selectedCountry = "Country";

  @override
  void initState() {
    super.initState();

    passengerProvider = PassengerProvider();
    passengerProvider = Provider.of<PassengerProvider>(context, listen: false);
    passengerProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addFields();

      passengerProvider.getIdentityProofTypes();
      passengerProvider.getCountriesList();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addFields() {
    if (widget.passengerCount > 10) {
      Toasts.getWarningToast(text: "Only 10 Passengers allowed");
    } else {
      for (int i = 0; i < widget.passengerCount; i++) {
        final fullNameController = TextEditingController();
        final idNumberController = TextEditingController();
        final field = passengerContainer(
          passengerNumber: "${i + 1}",
          fullNameController: fullNameController,
          idNumberController: idNumberController,
        );

        // final field = passengerOnlyFieldsContainer(
        //   passengerNumber: "${i + 1}",
        //   fullNameController: fullNameController,
        //   idNumberController: idNumberController,
        // );

        debugPrint("functionCalled: $i");
        setState(() {
          _fullNameControllers.add(fullNameController);
          _idNumberControllers.add(idNumberController);
          _fields.add(field);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PassengerProvider>(context, listen: true);

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
            // passengerDropDownContainer(),
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
                for (int i = 0; i < _fullNameControllers.length; i++) {
                  debugPrint(
                      "fullName: ${_fullNameControllers[i].value.text.toString().trim()}\nidNumber: ${_idNumberControllers[i].value.text.toString().trim()}");
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelScreen(
                      tripId: widget.tripId,
                    ),
                  ),
                );
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  Widget passengerContainer({
    required String passengerNumber,
    required TextEditingController fullNameController,
    required TextEditingController idNumberController,
  }) {
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
              items: passengerProvider.identityProofTypeNameList
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  // selectedIdentityType = value!;

                  selectedIdentityType = value!;
                  debugPrint("selectedIdentityType: $selectedIdentityType");
                  var l = passengerProvider.identityProofTypeNameList.length;
                  for (int i = 0; i < l; i++) {
                    String name =
                        passengerProvider.identityProofTypesMapList[i]['name'];
                    String id =
                        passengerProvider.identityProofTypesMapList[i]['id'];
                    debugPrint("city: $name, id: $id");
                    if (name.contains(selectedIdentityType)) {
                      // departureFromID = id;
                      debugPrint("identityType&Id: $name, $id");
                    }
                  }
                });
              },
            ),
          ),
        ),
        CommonPadding.sizeBoxWithHeight(height: 10),
        CustomTextField(
          controller: idNumberController,
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
              items: passengerProvider.countryNameList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;

                  debugPrint("selectedCountry: $selectedCountry");
                  var l = passengerProvider.countryNameList.length;
                  for (int i = 0; i < l; i++) {
                    String name = passengerProvider.countryMapList[i]['name'];
                    String id = passengerProvider.countryMapList[i]['id'];
                    debugPrint("city: $name, id: $id");
                    if (name.contains(selectedCountry)) {
                      // departureFromID = id;
                      debugPrint("countryCity&Id: $name, $id");
                    }
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget passengerOnlyFieldsContainer({
    required String passengerNumber,
    required TextEditingController fullNameController,
    required TextEditingController idNumberController,
  }) {
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
        CustomTextField(
          controller: idNumberController,
          padding: 0,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: "ID Number",
        ),
        // CommonPadding.sizeBoxWithHeight(height: 10),
      ],
    );
  }

  Widget passengerDropDownContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonPadding.sizeBoxWithHeight(height: 20),
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
        CommonPadding.sizeBoxWithHeight(height: 10),
      ],
    );
  }
}
