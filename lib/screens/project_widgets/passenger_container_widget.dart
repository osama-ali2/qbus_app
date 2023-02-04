// Created by Tayyab Mughal on 08/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/custom_textField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../passenger_screens/passenger_provider.dart';

class PassengerContainerWidget extends StatefulWidget {
  final String passengerNumber;
  final TextEditingController fullNameController;
  final TextEditingController idNumberController;
  String selectedCountry;
  String selectedIdentityType;
  PassengerProvider passengerProvider;

  PassengerContainerWidget({
    Key? key,
    required this.passengerNumber,
    required this.fullNameController,
    required this.idNumberController,
    required this.selectedCountry,
    required this.selectedIdentityType,
    required this.passengerProvider,
  }) : super(key: key);

  @override
  State<PassengerContainerWidget> createState() =>
      _PassengerContainerWidgetState();
}

class _PassengerContainerWidgetState extends State<PassengerContainerWidget> {
  late PassengerProvider passengerProvider;

  @override
  void initState() {
    super.initState();

    passengerProvider = PassengerProvider();
    passengerProvider = Provider.of<PassengerProvider>(context, listen: false);
    passengerProvider.init(context: context);
    //
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.passengerNumber == 1) {
        debugPrint("passengerNumber: ${widget.passengerNumber}");
        passengerProvider.getIdentityProofTypes();
        passengerProvider.getCountriesList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PassengerProvider>(context, listen: true);
    debugPrint("passengerNumberRebuild: ${widget.passengerNumber}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonPadding.sizeBoxWithHeight(height: 20),
        CustomText(
            text: AppLocalizations.of(context)!.passenger +
                " ${widget.passengerNumber}",
            textSize: sizes!.fontRatio * 14,
            fontWeight: FontWeight.w700,
            textColor: Colors.black),
        CommonPadding.sizeBoxWithHeight(height: 10),
        CustomTextField(
          controller: widget.fullNameController,
          padding: 0,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: AppLocalizations.of(context)!.full_name,
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
                    text: widget.selectedIdentityType,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black),
              ),
              underline: const SizedBox(),
              isExpanded: true,
              items: widget.passengerProvider.identityProofTypeNameList
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.selectedIdentityType = value!;
                  debugPrint(
                      "selectedIdentityType: ${widget.selectedIdentityType}");
                  var l =
                      widget.passengerProvider.identityProofTypeNameList.length;
                  for (int i = 0; i < l; i++) {
                    String name = widget
                        .passengerProvider.identityProofTypesMapList[i]['name'];
                    String id = widget
                        .passengerProvider.identityProofTypesMapList[i]['id'];
                    debugPrint("city: $name, id: $id");
                    if (name.contains(widget.selectedIdentityType)) {
                      debugPrint("identityType&Id: $name, $id");
                      var proofId = int.parse(id);
                      widget.passengerProvider.userIdentityProofTypeId
                          .add(proofId);
                    }
                  }
                });
              },
            ),
          ),
        ),
        CommonPadding.sizeBoxWithHeight(height: 10),
        CustomTextField(
          controller: widget.idNumberController,
          padding: 0,
          validator: (val) => null,
          inputType: TextInputType.text,
          hint: AppLocalizations.of(context)!.id_number,
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
                    text: widget.selectedCountry,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black),
              ),
              underline: const SizedBox(),
              isExpanded: true,
              items:
                  widget.passengerProvider.countryNameList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.selectedCountry = value!;

                  debugPrint("selectedCountry: ${widget.selectedCountry}");
                  var l = widget.passengerProvider.countryNameList.length;
                  for (int i = 0; i < l; i++) {
                    String name =
                        widget.passengerProvider.countryMapList[i]['name'];
                    String id =
                        widget.passengerProvider.countryMapList[i]['id'];
                    debugPrint("city: $name, id: $id");
                    if (name.contains(widget.selectedCountry)) {
                      // departureFromID = id;
                      debugPrint("countryCity&Id: $name, $id");
                      var countryId = int.parse(id);
                      widget.passengerProvider.userCountryId.add(countryId);
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
}
