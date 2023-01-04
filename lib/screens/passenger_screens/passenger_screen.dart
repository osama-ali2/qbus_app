import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/hotel_screens/hotel_screen.dart';
import 'package:qbus/screens/passenger_screens/passenger_provider.dart';
import 'package:qbus/screens/project_widgets/passenger_container_widget.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';

class PassengerScreen extends StatefulWidget {
  final int passengerCount;
  final int tripId;
  final List<Map<String, dynamic>> additionalList;

  const PassengerScreen({
    Key? key,
    required this.passengerCount,
    required this.tripId,
    required this.additionalList,
  }) : super(key: key);

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  late PassengerProvider passengerProvider;

  final List<TextEditingController> _controllers = [];
  final List<Widget> _fields = [];
  final List<Map<String, dynamic>> passengerBody = [];

  /// Fields
  final List<TextEditingController> _fullNameControllers = [];
  final List<TextEditingController> _idNumberControllers = [];

  var selectedIdentityType = "Identity proof type";
  var selectedCountry = "Country";

  final List<String> identityTypeString = [];
  final List<String> countryString = [];

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
    super.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
    _fullNameControllers.clear();
    _idNumberControllers.clear();
  }

  void addFields() {
    if (widget.passengerCount > 10) {
      Toasts.getWarningToast(text: "Only 10 Passengers allowed");
    } else {
      for (int i = 0; i < widget.passengerCount; i++) {
        final fullNameController = TextEditingController();
        final idNumberController = TextEditingController();

        final field = PassengerContainerWidget(
          key: Key("${i + 1}"),
          passengerNumber: "${i + 1}",
          fullNameController: fullNameController,
          idNumberController: idNumberController,
          selectedCountry: selectedCountry,
          selectedIdentityType: selectedIdentityType,
          passengerProvider: passengerProvider,
        );

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
                validateData();
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  void validateData() async {
    for (int i = 0; i < widget.passengerCount; i++) {
      var fullName = _fullNameControllers[i].value.text.toString().trim();
      var idNumber = _idNumberControllers[i].value.text.toString().trim();

      var proofId = passengerProvider.userIdentityProofTypeId[i];
      var countryId = passengerProvider.userCountryId[i];

      debugPrint(
        "fullName: $fullName"
        "idNumber: $idNumber"
        "\n IdentityProofId: $proofId \n Country: $countryId",
      );

      Map<String, dynamic> paraPassengerBody = {
        "name": fullName,
        "id_proof_type": proofId,
        "id_number": idNumber,
        "country_id": countryId
      };
      debugPrint("paraPassengerBody: [$i] $paraPassengerBody");
      passengerBody.add(paraPassengerBody);
      debugPrint("passengerBody: ${passengerBody.map((e) => e)} ");
    }

    if (passengerBody.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HotelScreen(
            tripId: widget.tripId,
            passengerCounts: widget.passengerCount.toString(),
            paramPassengerBody: passengerBody,
            paramAdditionalList: widget.additionalList,
          ),
        ),
      );
    } else {
      Toasts.getWarningToast(text: "The fields is required");
    }
  }
}
