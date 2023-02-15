import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/screens/hotel_screens/hotel_provider.dart';
import 'package:qbus/screens/package_screens/package_hotels/package_hotels.dart';
import 'package:qbus/screens/project_widgets/package_passenger_container_widget.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/resources/resources.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package_passenger_provider.dart';

class PackagePassengerScreen extends StatefulWidget {
  final int passengerCount;
  final int packageId;
  final List<Map<String, dynamic>> additionalList;
  final bool isHotelTripeOneEmpty;
  final int firstTripId;
  final int secondTripId;

  const PackagePassengerScreen({
    Key? key,
    required this.passengerCount,
    required this.additionalList,
    required this.isHotelTripeOneEmpty,
    required this.packageId,
    required this.firstTripId,
    required this.secondTripId,
  }) : super(key: key);

  @override
  State<PackagePassengerScreen> createState() => _PackagePassengerScreenState();
}

class _PackagePassengerScreenState extends State<PackagePassengerScreen> {
  // Providers
  late PackagePassengerProvider packagePassengerProvider;
  late HotelProvider hotelProvider;

  // Lists
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

    packagePassengerProvider = PackagePassengerProvider();
    packagePassengerProvider =
        Provider.of<PackagePassengerProvider>(context, listen: false);
    packagePassengerProvider.init(context: context);

    /// Hotel Provider
    hotelProvider = HotelProvider();
    hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    hotelProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addFields();
      packagePassengerProvider.getIdentityProofTypes();
      packagePassengerProvider.getCountriesList();
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

        final field = PackagePassengerContainerWidget(
          key: Key("${i + 1}"),
          passengerNumber: "${i + 1}",
          fullNameController: fullNameController,
          idNumberController: idNumberController,
          selectedCountry: _selectedCountry,
          selectedIdentityType: _selectedIdentityType,
          passengerProvider: packagePassengerProvider,
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
    Provider.of<PackagePassengerProvider>(context, listen: true);
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

  /// Validate Data Fields
  void _validateData() async {
    // Is user enter values
    bool isDataValidate = false;

    /// Loop throw
    for (int i = 0; i < widget.passengerCount; i++) {
      if (_fullNameControllers[i].value.text.isNotEmpty &&
          _idNumberControllers[i].value.text.isNotEmpty &&
          _idNumberControllers[i].value.text.length <= 10) {
        var fullName = _fullNameControllers[i].value.text.toString().trim();
        var idNumber = _idNumberControllers[i].value.text.toString().trim();

        var proofId = packagePassengerProvider.userIdentityProofTypeId[i];
        var countryId = packagePassengerProvider.userCountryId[i];

        debugPrint(
          "fullName: $fullName"
          "idNumber: $idNumber"
          "\n IdentityProofId: $proofId \n Country: $countryId",
        );

        /// Parameter Passenger Body
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
      } else if (_idNumberControllers[i].value.text.length > 10) {
        Toasts.getWarningToast(
            text: AppLocalizations.of(context)!.max_input_id_10);
        isDataValidate = false;
      } else {
        Toasts.getWarningToast(
            text: AppLocalizations.of(context)!.required_fields);
        isDataValidate = false;
      }
    }

    /// Validate Data
    if (isDataValidate == true) {
      /// Is Hotel Empty, save trip with hotel & additional empty data
      if (widget.isHotelTripeOneEmpty == true) {
        debugPrint("isHotelTripeOneEmpty: ${widget.isHotelTripeOneEmpty}");

        /// Save Trip Order
        //await _saveTripOrderWithEmptyHotelAndAdditional();

        debugPrint(
            "packagePassengerScreen: ${widget.packageId}, ${widget.passengerCount.toString()}, $_passengerBody, ${widget.additionalList.map((e) => e)}");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageHotelTripTwoScreen(
                packageId: widget.packageId,
                passengerCounts: widget.passengerCount.toString(),
                paramPassengerBody: _passengerBody,
                paramAdditionalList: widget.additionalList,
                secondTripId: widget.secondTripId,
                hotelOneBody: [],
              ),
            ));
      } else {
        /// Hotel and Additional with data
        debugPrint("onPassengerScreen: ${widget.additionalList.map((e) => e)}");
        debugPrint(
            "packagePassengerScreen: ${widget.packageId}, ${widget.passengerCount.toString()}, $_passengerBody, ${widget.additionalList.map((e) => e)}");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageHotelTripOneScreen(
                passengerCounts: widget.passengerCount.toString(),
                paramPassengerBody: _passengerBody,
                paramAdditionalList: widget.additionalList,
                firstTripId: widget.firstTripId,
                packageId: widget.packageId,
                secondTripId: widget.secondTripId,
              ),
            ));
      }
    }
  }
}
