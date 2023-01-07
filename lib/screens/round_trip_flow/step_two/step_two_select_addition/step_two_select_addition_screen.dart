import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';

import '../round_trip_review_order_screens/round_trip_review_order_screen.dart';
import 'step_two_select_addition_provider.dart';

class StepTwoSelectAdditionScreen extends StatefulWidget {
  final String? tripSecondId;
  final Trips? secondTripsModel;
  final bool? isRoundTripChecked;
  final String? passengersCount;
  final String? toCityId;
  final String? fromCityId;
  final List<Map<String, dynamic>> paramPassengerBody;
  final List<Map<String, dynamic>> paramHotelBody;

  //First Trip
  final Trips? firstTripModel;
  final String? tripFirstPassengersCount;
  final List<Map<String, dynamic>>? tripFirstAdditionalList;

  const StepTwoSelectAdditionScreen({
    Key? key,
    this.tripSecondId,
    this.secondTripsModel,
    this.isRoundTripChecked,
    this.passengersCount,
    this.toCityId,
    this.fromCityId,
    this.firstTripModel,
    this.tripFirstPassengersCount,
    this.tripFirstAdditionalList,
    required this.paramPassengerBody,
    required this.paramHotelBody,
  }) : super(key: key);

  @override
  State<StepTwoSelectAdditionScreen> createState() =>
      _StepTwoSelectAdditionScreenState();
}

class _StepTwoSelectAdditionScreenState
    extends State<StepTwoSelectAdditionScreen> {
  int currentIndex = 0;
  int isRoundTripCounter = 0;
  late StepTwoSelectAdditionProvider stepTwoSelectAdditionProvider;

  @override
  void initState() {
    super.initState();
    stepTwoSelectAdditionProvider = StepTwoSelectAdditionProvider();
    stepTwoSelectAdditionProvider =
        Provider.of<StepTwoSelectAdditionProvider>(context, listen: false);
    stepTwoSelectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load Additionals.
      stepTwoSelectAdditionProvider.getAdditionalData(id: widget.tripSecondId!);
    });

    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<StepTwoSelectAdditionProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Trip Select Additions",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: stepTwoSelectAdditionProvider.isTripLoaded == true
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: stepTwoSelectAdditionProvider
                            .tripAdditionalsResponse.data!.additional!.length,
                        itemBuilder: (context, index) {
                          currentIndex = index;
                          var name = stepTwoSelectAdditionProvider
                              .tripAdditionalsResponse
                              .data!
                              .additional![index]
                              .name!
                              .en
                              .toString();
                          var additionId = stepTwoSelectAdditionProvider
                              .tripAdditionalsResponse
                              .data!
                              .additional![index]
                              .id
                              .toString();
                          return itemContainer(
                              name: name, index: index, additionId: additionId);
                        }),
                  ),
                  CustomButton(
                      name: "Save Second Trip & Review Order",
                      buttonColor: appColor,
                      height: sizes!.heightRatio * 45,
                      width: double.infinity,
                      textSize: sizes!.fontRatio * 14,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      borderRadius: 5,
                      onTapped: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PassengerScreen(
                        //       passengerCount:
                        //           int.parse("${widget.passengersCount}"),
                        //       tripId: int.parse("${widget.tripSecondId}"),
                        //       additionalList:
                        //           stepTwoSelectAdditionProvider.additionalList,
                        //     ),
                        //   ),
                        // );

                        ///Uncomment ->
                        await callOrderTrip();
                      },
                      padding: 20),
                  const SizedBox(
                    height: 10,
                  ),
                  //PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
                  (PreferenceUtils.getString(Strings.loginUserToken)!
                          .isNotEmpty)
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: sizes!.heightRatio * 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: appColor)),
                              child: Center(
                                child: CustomText(
                                    text: "Continue",
                                    textSize: sizes!.fontRatio * 15,
                                    fontWeight: FontWeight.w500,
                                    textColor: appColor),
                              ),
                            ),
                          ),
                        )
                ],
              )
            : const Center(
                child: Text("No Data Available"),
              ),
      ),
    );
  }

  Future<void> callOrderTrip() async {
    if (widget.isRoundTripChecked == true) {
      setState(() {
        isRoundTripCounter++;
        debugPrint("isRoundTripCounter:$isRoundTripCounter");
      });

      debugPrint(
          "debug: ${widget.firstTripModel}, ${widget.passengersCount}, ${widget.tripFirstAdditionalList}, ${widget.secondTripsModel}, ${widget.paramPassengerBody}, ${widget.paramHotelBody}");

      await stepTwoSelectAdditionProvider.roundOrderTrip(
        tripFirstId: widget.firstTripModel!,
        passengersCount: widget.passengersCount!,
        tripFirstAdditionalList: widget.tripFirstAdditionalList!,
        tripSecondId: widget.secondTripsModel!,
        paramPassengerBody: widget.paramPassengerBody,
        paramHotelBody: widget.paramHotelBody,
      );

      if (stepTwoSelectAdditionProvider.isRoundOrderTripSaved == true) {
        if (!mounted) return;
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const BottomBarScreen()),
        //     (route) => false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoundTripReviewOrderScreen(
              orderId: stepTwoSelectAdditionProvider
                  .roundOrderTripResponse.data!.tripId!,
            ),
          ),
        );
      }
    }
  }

  Widget itemContainer(
          {required String name,
          required int index,
          required String additionId}) =>
      Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          currentIndex == index
              ? _itemsCounter(
                  context: context,
                  name: name,
                  add: () {
                    // selectAdditionProvider.selectAdditionalList[index]++;
                    setState(() {
                      var counter = stepTwoSelectAdditionProvider
                          .selectAdditionalList[index]++;
                      Map<String, dynamic> selected = {
                        "id": additionId,
                        "counter": counter + 1
                      };
                      stepTwoSelectAdditionProvider.additionalList[index]
                          .addAll(selected);
                    });
                  },
                  minus: () {
                    if (stepTwoSelectAdditionProvider
                            .selectAdditionalList[index] >
                        0) {
                      // selectAdditionProvider.selectAdditionalList[index]--;
                      setState(() {
                        var counter = stepTwoSelectAdditionProvider
                            .selectAdditionalList[index]--;
                        Map<String, dynamic> selected = {
                          "id": additionId,
                          "counter": counter - 1
                        };
                        stepTwoSelectAdditionProvider.additionalList[index]
                            .addAll(selected);
                      });
                    }
                  },
                  number:
                      stepTwoSelectAdditionProvider.selectAdditionalList[index])
              : _itemsCounter(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0),
        ],
      );

  Widget _itemsCounter(
      {required BuildContext context,
      required String name,
      required Function add,
      required Function minus,
      required int number}) {
    return Container(
      height: sizes!.heightRatio * 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: name,
                textSize: sizes!.fontRatio * 16,
                fontWeight: FontWeight.normal,
                textColor: const Color(0xff747268)),
            Counter(number: number, onAdd: () => add(), onMinus: () => minus())
          ],
        ),
      ),
    ).get20HorizontalPadding();
  }
}
