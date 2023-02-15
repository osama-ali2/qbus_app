import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qbus/local_notification_service/local_notification_service.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/screens/get_started_screens/get_started_provider.dart';
import 'package:qbus/screens/project_widgets/package_card_container_widget.dart';
import 'package:qbus/screens/round_trip_flow/step_one/round_trip_step_one_result.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../../../widgets/custom_button.dart';
import '../package_screens/package_detail_screens/package_detail_screen.dart';
import '../package_screens/package_screen.dart';
import '../trips_search_screens/trips_search_result.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late GetStartedProvider getStartedProvider;

  bool oneWayTrip = false;
  bool roundTrip = true;
  bool multiTrip = false;
  bool tripType = false;
  int passengersNumber = 1;

  // Dates
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  String _startDate = "تاريخ المغادرة";
  String _endDate = "تاريخ العودة";

  final departureFromController = TextEditingController();
  final arrivalToController = TextEditingController();
  final dateController = TextEditingController();

  late var departureFrom = AppLocalizations.of(context)!.departure_from;
  late var returnTo = AppLocalizations.of(context)!.arrival_to;

  var returnToID = "-1";
  var departureFromID = "-1";

  @override
  void initState() {
    super.initState();
    getStartedProvider = GetStartedProvider();
    getStartedProvider =
        Provider.of<GetStartedProvider>(context, listen: false);
    getStartedProvider.init(context: context);

    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();

    // Firebase Notification
    LocalNotificationService.instance.initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message [GetStartedScreen] whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint(
            'Message also contained a notification: ${message.notification!.title}');

        LocalNotificationService.instance.showNotification(
            id: 1,
            title: message.notification!.title!,
            body: message.notification!.body!);

        if (message.data['type'] == 'chat') {
          debugPrint("Type is Chat Opened");
        }
      }
    });

    // Load Pacakges and Cities
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStartedProvider.getPackagesData();
      getStartedProvider.getCitiesData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    departureFromController.dispose();
    arrivalToController.dispose();
    dateController.dispose();
  }

  // Present Start Date
  void _presentStartDate() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return 'no date selected';
      }
      setState(() {
        _selectedStartDate = pickedDate;
        _startDate =
            DateFormat('yyyy-MM-dd').format(_selectedStartDate).toString();
        debugPrint("_selectedStartDate: $_selectedStartDate");
      });
    });
  }

  // Present End Date
  void _presentEndDate() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return 'no date selected';
      }
      setState(() {
        _selectedEndDate = pickedDate;
        _endDate = DateFormat('yyyy-MM-dd').format(_selectedEndDate).toString();
        debugPrint("_selectedEndDate: $_selectedEndDate");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GetStartedProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: _getUI(context),
        ),
      ),
    );
  }

  /// Get UI
  Widget _getUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: sizes!.heightRatio * 14,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
              text: AppLocalizations.of(context)!.home_title,
              textSize: sizes!.fontRatio * 18,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              textAlign: TextAlign.start,
            ),
          ]),
          SizedBox(
            height: sizes!.fontRatio * 20,
          ),
          Row(
            children: [
              checkBox(
                  context, oneWayTrip, AppLocalizations.of(context)!.one_way,
                  () {
                multiTrip = false;
                roundTrip = false;
                oneWayTrip = true;
                setState(() {
                  tripType = oneWayTrip;
                });
              }),
              CommonPadding.sizeBoxWithWidth(width: 20),
              checkBox(
                  context, roundTrip, AppLocalizations.of(context)!.round_trip,
                  () {
                multiTrip = false;
                roundTrip = true;
                oneWayTrip = false;
                setState(() {
                  tripType = roundTrip;
                });
              }),
            ],
          ),
          SizedBox(
            height: sizes!.fontRatio * 20,
          ),
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
                    text: departureFrom,
                    textSize: 12,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                  ),
                ),
                underline: const SizedBox(),
                isExpanded: true,
                items: getStartedProvider.cityList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    departureFrom = value!;
                    debugPrint("selectedCity: $departureFrom");
                    var l = getStartedProvider.citiesList.length;
                    for (int i = 0; i < l; i++) {
                      String name = getStartedProvider.citiesList[i]['city'];
                      String id = getStartedProvider.citiesList[i]['id'];
                      debugPrint("city: $name, id: $id");
                      if (name.contains(departureFrom)) {
                        departureFromID = id;
                        debugPrint("MatchedCity&Id: $name, $departureFromID");
                      }
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
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
                      text: returnTo,
                      textSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black),
                ),
                underline: const SizedBox(),
                isExpanded: true,
                items: getStartedProvider.cityList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    returnTo = value!;
                    debugPrint("selectedCity: $returnTo");

                    var l = getStartedProvider.citiesList.length;
                    for (int i = 0; i < l; i++) {
                      String name = getStartedProvider.citiesList[i]['city'];
                      String id = getStartedProvider.citiesList[i]['id'];
                      debugPrint("city: $name, id: $id");
                      if (name.contains(returnTo)) {
                        returnToID = id;
                        debugPrint("MatchedCity&Id: $name, $returnToID");
                      }
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          GestureDetector(
            onTap: () {
              _presentStartDate();
            },
            child: Container(
              height: sizes!.heightRatio * 48,
              width: sizes!.widthRatio * 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 6),
                    child: Text(
                      _startDate,
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
          roundTrip == true
              ? SizedBox(
                  height: sizes!.heightRatio * 10,
                )
              : Container(),
          roundTrip == true
              ? GestureDetector(
                  onTap: () {
                    _presentEndDate();
                  },
                  child: Container(
                    height: sizes!.heightRatio * 48,
                    width: sizes!.widthRatio * 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.widthRatio * 6),
                          child: Text(
                            _endDate,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: sizes!.heightRatio * 20,
          ),
          CustomText(
              text: AppLocalizations.of(context)!.passengers_count,
              textSize: sizes!.fontRatio * 14,
              fontWeight: FontWeight.normal,
              textColor: Colors.black),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          Counter(
              number: passengersNumber,
              onAdd: () {
                if (passengersNumber > 9) {
                  Toasts.getWarningToast(
                      text: AppLocalizations.of(context)!
                          .only_10_Passengers_allowed);
                } else {
                  passengersNumber++;
                  setState(() {});
                }
              },
              onMinus: () {
                if (passengersNumber > 1) {
                  passengersNumber--;
                  setState(() {});
                }
              }),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
          CustomButton(
              name: AppLocalizations.of(context)!.search,
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 16,
              textColor: Colors.white,
              fontWeight: FontWeight.normal,
              borderRadius: 5,
              onTapped: () => validateTripData(),
              padding: 0),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: AppLocalizations.of(context)!.packages,
                  textSize: sizes!.fontRatio * 18,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              InkWell(
                onTap: () {
                  NavigationHelper.pushRoute(
                      context,
                      PackageScreen(
                        packageFilterModel: PackageFilterModel(),
                      ));
                },
                child: Row(
                  children: [
                    CustomText(
                        text: AppLocalizations.of(context)!.explore,
                        textSize: sizes!.fontRatio * 16,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
          getStartedProvider.isDataLoaded == true
              ? SizedBox(
                  height: sizes!.heightRatio * 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: getStartedProvider
                        .packagesResponse.data!.packages!.length,
                    itemBuilder: (context, i) {
                      var data = getStartedProvider
                          .packagesResponse.data!.packages![i];
                      var packageId = data.id.toString();
                      // var packageName = data.name!.en.toString();
                      var packageName = data.name!.toString();

                      var rating = data.rate.toString();
                      var fee = data.fees.toString();
                      var image = data.image.toString();

                      var baseUrl = getStartedProvider
                          .packagesResponse.data!.imageBase
                          .toString();
                      var thumbnailImage = "$baseUrl/$image";
                      var dateFrom = data.dateFrom.toString();
                      var detail = data.description!.toString();
                      // debugPrint("thumbnailImage: $thumbnailImage");

                      var firstTripId = data.firstTripId;
                      var secondTripId = data.secondTripId;

                      var isHotelRoomTripOneEmpty =
                          data.hotelRoomTripOne!.isEmpty;
                      var isHotelRoomTripTwoEmpty =
                          data.hotelRoomTripTwo!.isEmpty;

                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: sizes!.heightRatio * 8.0),
                        child: GestureDetector(
                          onTap: () {
                            debugPrint("packageName:$packageName");
                            debugPrint("packageId:$packageId");
                            debugPrint(
                                "hotelRoomTripOne:${data.hotelRoomTripOne!.isEmpty}");
                            NavigationHelper.pushRoute(
                              context,
                              PackageDetailScreen(
                                packageTitle: packageName,
                                packageId: packageId,
                                isHotelTripeOneEmpty:
                                    data.hotelRoomTripOne!.isEmpty,
                                firstTripId: firstTripId!,
                                secondTripId: secondTripId!,
                                isHotelRoomTripOneEmpty:
                                    isHotelRoomTripOneEmpty,
                                isHotelRoomTripTwoEmpty:
                                    isHotelRoomTripTwoEmpty,
                              ),
                            );
                          },
                          child: PackageCardContainerWidget(
                            title: packageName,
                            rating: rating,
                            fee: fee,
                            dateFrom: dateFrom,
                            detail: detail,
                            image: thumbnailImage,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: CustomText(
                      //"No Package Available"
                      text: AppLocalizations.of(context)!.no_package_avilable,
                      textSize: sizes!.fontRatio * 14,
                      fontWeight: FontWeight.normal,
                      textColor: Colors.black),
                ),
          CommonPadding.sizeBoxWithHeight(height: 20),
        ],
      ),
    );
  }

  /// Validate Trip Data
  void validateTripData() {
    debugPrint("departureFromID: $departureFromID, "
        "arrivalToID: $returnToID,"
        "_startDate: $_startDate, "
        "_endDate: $_endDate,"
        "departureFrom: $departureFrom, arrivalTo:$returnTo");

    if (departureFromID != "-1" &&
        returnToID != "-1" &&
        _startDate != "" &&
        departureFrom != "" &&
        returnTo != "") {
      if (roundTrip == true) {
        debugPrint("roundTrip == $roundTrip");
        NavigationHelper.pushRoute(
          context,
          RoundTripStepOneResult(
            fromCity: departureFrom,
            toCity: returnTo,
            isRoundTripChecked: roundTrip,
            passengersCount: "$passengersNumber",
            tripFilterModel: TripFilterModel(
              from_city_id: departureFromID,
              to_city_id: returnToID,
              date_from: _startDate,
              date_to: _endDate,
            ),
          ),
        );
      } else {
        // One Way Trip Search Result Screen
        NavigationHelper.pushRoute(
          context,
          SearchResult(
            fromCity: departureFrom,
            toCity: returnTo,
            isMultiDestinationChecked: multiTrip,
            isOneWayTripChecked: oneWayTrip,
            isRoundTripChecked: roundTrip,
            passengersCount: "$passengersNumber",
            tripFilterModel: TripFilterModel(
              from_city_id: departureFromID,
              to_city_id: returnToID,
              date_from: _startDate,
              // date_to: _endDate,
            ),
          ),
        );
      }
    } else {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    }
  }

  /// Check Box
  Widget checkBox(
      BuildContext context, bool isSelected, String name, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            height: sizes!.heightRatio * 18,
            width: sizes!.widthRatio * 18,
            decoration: BoxDecoration(
              color: isSelected ? appColor : Colors.white,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                  color: isSelected ? appColor : Colors.grey.shade400),
            ),
            child: const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          CustomText(
            text: name,
            textSize: sizes!.fontRatio * 12,
            fontWeight: FontWeight.normal,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
