import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/screens/hotel_screens/hotel_provider.dart';
import 'package:qbus/screens/hotel_screens/hotel_screen.dart';
import 'package:qbus/screens/passenger_screens/passenger_provider.dart';
import 'package:qbus/screens/project_widgets/passenger_container_widget.dart';
import 'package:qbus/screens/review_order_screens/review_order_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/resources/resources.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackagePassengerScreen extends StatefulWidget {
  final int passengerCount;
  final int tripId;
  final List<Map<String, dynamic>> additionalList;
  final bool? isHotelEmpty;

  const PackagePassengerScreen({
    Key? key,
    required this.passengerCount,
    required this.tripId,
    required this.additionalList,
    this.isHotelEmpty,
  }) : super(key: key);

  @override
  State<PackagePassengerScreen> createState() => _PackagePassengerScreenState();
}

class _PackagePassengerScreenState extends State<PackagePassengerScreen> {
  late PassengerProvider passengerProvider;
  late HotelProvider hotelProvider;

  final List<TextEditingController> _controllers = [];
  final List<Widget> _fields = [];

  // Passenger Data Body
  final List<Map<String, dynamic>> _passengerBody = [];

  /// Fields
  final List<TextEditingController> _fullNameControllers = [];
  final List<TextEditingController> _idNumberControllers = [];

  late final _selectedIdentityType =
      AppLocalizations.of(context)!.identity_proof_type;
  late final _selectedCountry = AppLocalizations.of(context)!.country;

  @override
  void initState() {
    super.initState();

    passengerProvider = PassengerProvider();
    passengerProvider = Provider.of<PassengerProvider>(context, listen: false);
    passengerProvider.init(context: context);

    /// Hotel Provider
    hotelProvider = HotelProvider();
    hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    hotelProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addFields();
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
    _passengerBody.clear();
  }

  // Add Passengers TextField
  void _addFields() {
    if (widget.passengerCount > 10) {
      Toasts.getWarningToast(
          text: AppLocalizations.of(context)!.only_10_Passengers_allowed);
    } else {
      for (int i = 0; i < widget.passengerCount; i++) {
        final fullNameController = TextEditingController();
        final idNumberController = TextEditingController();

        final field = PassengerContainerWidget(
          key: Key("${i + 1}"),
          passengerNumber: "${i + 1}",
          fullNameController: fullNameController,
          idNumberController: idNumberController,
          selectedCountry: _selectedCountry,
          selectedIdentityType: _selectedIdentityType,
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
    Provider.of<HotelProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: AppLocalizations.of(context)!.passengers_data,
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
              name: AppLocalizations.of(context)!.next,
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 14,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
              borderRadius: 5,
              onTapped: () async {
               // _validateData();
              },
              padding: 0,
            ),
            CommonPadding.sizeBoxWithHeight(height: 20),
          ],
        ).get20HorizontalPadding(),
      ),
    );
  }

  // Validate Data Fields
  void _validateData() async {
    // Is user enter values
    bool isDataValidate = false;
    for (int i = 0; i < widget.passengerCount; i++) {
      if (_fullNameControllers[i].value.text.isNotEmpty ||
          _idNumberControllers[i].value.text.isNotEmpty) {
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
        _passengerBody.add(paraPassengerBody);
        debugPrint("passengerBody: ${_passengerBody.map((e) => e)} ");
        isDataValidate = true;
      } else {
        Toasts.getWarningToast(
            text: AppLocalizations.of(context)!.required_fields);
        isDataValidate = false;
      }
    }

    /// Validate Data
    if (isDataValidate == true) {
      /// Is Hotel Empty, save trip with hotel & additional empty data
      if (widget.isHotelEmpty == true) {
        debugPrint("isHotelEmpty: ${widget.isHotelEmpty}");

        /// Save Trip Order
        await _saveTripOrderWithEmptyHotelAndAdditional();
      } else {
        /// Hotel and Additional with data
        debugPrint("onPassengerScreen: ${widget.additionalList.map((e) => e)}");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelScreen(
              tripId: widget.tripId,
              passengerCounts: widget.passengerCount.toString(),
              paramPassengerBody: _passengerBody,
              paramAdditionalList: widget.additionalList,
            ),
          ),
        );
      }
    }
  }

  /// Save Trip Order
  Future<void> _saveTripOrderWithEmptyHotelAndAdditional() async {
    /// call API with Hotel and Additional Data empty
    debugPrint(
        "fromFunOnPassengerScreen: ${widget.additionalList.map((e) => e)}");
    await hotelProvider.oneWayOrderTripCallFromPassengerScreen(
      tripId: "${widget.tripId}",
      passengerCounts: widget.passengerCount.toString(),
      paramPassengerBody: _passengerBody,
      additionalList: widget.additionalList,
    );

    if (hotelProvider.isOneWayOrderTripSaved) {
      if (!mounted) return;
      var tripId = hotelProvider.oneWayOrdersTripResponse.data!.tripId;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewOrderScreen(
            tripId: tripId!,
          ),
        ),
      );
    }
  }
}
