import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/project_widgets/round_trip_passenger_container_widget.dart';
import 'package:qbus/screens/round_trip_flow/step_two/round_trip_step_two_result.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../round_trip_hotel_screens/round_trip_hotel_screen.dart';
import 'round_trip_passenger_provider.dart';

class RoundTripPassengerScreen extends StatefulWidget {
  final int passengerCount;
  final int tripId;
  final List<Map<String, dynamic>> additionalList;

  // Trip Data
  final TripFilterModel tripFilterModel;
  final String fromCity;
  final String toCity;
  final bool isRoundTripChecked;
  final Trips firstTripModel;
  final String tripFirstPassengersCount;
  final List<Map<String, dynamic>> tripFirstAdditionalList;
  final bool? isHotelEmpty;

  const RoundTripPassengerScreen({
    Key? key,
    required this.passengerCount,
    required this.tripId,
    required this.additionalList,
    required this.tripFilterModel,
    required this.fromCity,
    required this.toCity,
    required this.isRoundTripChecked,
    required this.firstTripModel,
    required this.tripFirstPassengersCount,
    required this.tripFirstAdditionalList,
    this.isHotelEmpty,
  }) : super(key: key);

  @override
  State<RoundTripPassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<RoundTripPassengerScreen> {
  late RoundTripPassengerProvider roundTripPassengerProvider;

  final fullNameController = TextEditingController();
  final idNumberController = TextEditingController();

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

    roundTripPassengerProvider = RoundTripPassengerProvider();
    roundTripPassengerProvider =
        Provider.of<RoundTripPassengerProvider>(context, listen: false);
    roundTripPassengerProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Create Passenger Fields
      _addFields();
      // Load Identity Proof Types
      roundTripPassengerProvider.getIdentityProofTypes();
      // Get Countries List
      roundTripPassengerProvider.getCountriesList();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addFields() {
    if (widget.passengerCount > 10) {
      Toasts.getWarningToast(text: "Only 10 Passengers allowed");
    } else {
      for (int i = 0; i < widget.passengerCount; i++) {
        final fullNameController = TextEditingController();
        final idNumberController = TextEditingController();

        final field = RoundTripPassengerContainerWidget(
          key: Key("${i + 1}"),
          passengerNumber: "${i + 1}",
          fullNameController: fullNameController,
          idNumberController: idNumberController,
          selectedCountry: selectedCountry,
          selectedIdentityType: selectedIdentityType,
          passengerProvider: roundTripPassengerProvider,
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
    Provider.of<RoundTripPassengerProvider>(context, listen: true);

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
                _validateData();
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  void _validateData() async {
    for (int i = 0; i < widget.passengerCount; i++) {
      if (_fullNameControllers[i].value.text.isNotEmpty ||
          _idNumberControllers[i].value.text.isNotEmpty) {
        var fullName = _fullNameControllers[i].value.text.toString().trim();
        var idNumber = _idNumberControllers[i].value.text.toString().trim();

        var proofId = roundTripPassengerProvider.userIdentityProofTypeId[i];
        var countryId = roundTripPassengerProvider.userCountryId[i];

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
      } else {
        Toasts.getWarningToast(text: "The fields are required");
      }
    }

    if (widget.isHotelEmpty == true) {
      debugPrint("isHotelEmpty: ${widget.isHotelEmpty}");
      // Step Two Trip
      _stepTwoTrip();
    } else {
      // Round Trip Hotel Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoundTripHotelScreen(
            tripId: widget.tripId,
            passengerCounts: widget.passengerCount.toString(),
            paramPassengerBody: passengerBody,
            paramAdditionalList: widget.additionalList,
            tripFilterModel: widget.tripFilterModel,
            fromCity: widget.fromCity,
            toCity: widget.toCity,
            isRoundTripChecked: widget.isRoundTripChecked,
            firstTripModel: widget.firstTripModel,
            tripFirstPassengersCount: widget.passengerCount.toString(),
            tripFirstAdditionalList: widget.tripFirstAdditionalList,
          ),
        ),
      );
    }
  }

  // Step Two Trip
  void _stepTwoTrip() async {
    /// TODO: Uncomment Round Trip Step Two Result;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoundTripStepTwoResult(
          toCity: widget.toCity,
          fromCity: widget.fromCity,
          tripFilterModel: widget.tripFilterModel,
          isRoundTripChecked: widget.isRoundTripChecked,
          tripFirstPassengersCount: widget.passengerCount.toString(),
          firstTripModel: widget.firstTripModel,
          tripFirstAdditionalList: widget.tripFirstAdditionalList,
          paramPassengerBody: passengerBody,
          paramHotelBody: [],
        ),
      ),
    );
  }
}
