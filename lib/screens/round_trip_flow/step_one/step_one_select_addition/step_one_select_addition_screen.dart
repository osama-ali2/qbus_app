import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/round_trip_flow/step_one/step_one_select_addition/step_one_select_addition_provider.dart';
import 'package:qbus/screens/round_trip_flow/step_two/round_trip_step_two_result.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';

class StepOneSelectAdditionScreen extends StatefulWidget {
  final String? tripId;
  final Trips? firstTripsModel;
  final bool? isRoundTripChecked;
  final String? passengersCount;
  final String? toCityId;
  final String? fromCityId;

  //Load Trip
  final TripFilterModel? tripFilterModel;
  final String? fromCity;
  final String? toCity;

  const StepOneSelectAdditionScreen({
    Key? key,
    this.tripId,
    this.firstTripsModel,
    this.isRoundTripChecked,
    this.passengersCount,
    this.toCityId,
    this.fromCityId,
    this.tripFilterModel,
    this.fromCity,
    this.toCity,
  }) : super(key: key);

  @override
  State<StepOneSelectAdditionScreen> createState() =>
      _StepOneSelectAdditionScreenState();
}

class _StepOneSelectAdditionScreenState
    extends State<StepOneSelectAdditionScreen> {
  int currentIndex = 0;
  int isRoundTripCounter = 0;
  late StepOneSelectAdditionProvider stepOneSelectAdditionProvider;

  @override
  void initState() {
    super.initState();
    stepOneSelectAdditionProvider = StepOneSelectAdditionProvider();
    stepOneSelectAdditionProvider =
        Provider.of<StepOneSelectAdditionProvider>(context, listen: false);
    stepOneSelectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      stepOneSelectAdditionProvider.getAdditionalData(id: widget.tripId!);
    });
    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<StepOneSelectAdditionProvider>(context, listen: true);
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
      body: (stepOneSelectAdditionProvider.isTripLoaded == true)
          ? SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: stepOneSelectAdditionProvider
                            .tripAdditionalsResponse.data!.additional!.length,
                        itemBuilder: (context, index) {
                          currentIndex = index;
                          var data = stepOneSelectAdditionProvider
                              .tripAdditionalsResponse.data!.additional![index];
                          var name = data.name!.en.toString();
                          var additionId = data.id.toString();
                          return _itemContainer(
                              name: name, index: index, additionId: additionId);
                        }),
                  ),

                  CustomButton(
                      name: "Save First Trip",
                      buttonColor: appColor,
                      height: sizes!.heightRatio * 45,
                      width: double.infinity,
                      textSize: sizes!.fontRatio * 14,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      borderRadius: 5,
                      onTapped: () async {
                        debugPrint(
                            "firstTripModelID: ${widget.firstTripsModel!.id} passengersCount: ${widget.passengersCount}, additionalList: ${stepOneSelectAdditionProvider.additionalList}");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoundTripStepTwoResult(
                              toCity: widget.toCity,
                              fromCity: widget.fromCity,
                              tripFilterModel: widget.tripFilterModel,
                              isRoundTripChecked: widget.isRoundTripChecked,
                              tripFirstPassengersCount: widget.passengersCount,
                              firstTripModel: widget.firstTripsModel,
                              tripFirstAdditionalList:
                                  stepOneSelectAdditionProvider.additionalList,
                            ),
                          ),
                        );
                      },
                      padding: 20),
                  const SizedBox(
                    height: 10,
                  ),
                  // PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
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
                        ),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                ],
              ),
            )
          : const Center(
              child: Text("No Data Available"),
            ),
    );
  }

  Widget _itemContainer(
          {required String name,
          required int index,
          required String additionId}) =>
      Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          currentIndex == index
              ? _itemsContainer(
                  context: context,
                  name: name,
                  add: () {
                    // selectAdditionProvider.selectAdditionalList[index]++;
                    setState(() {
                      var counter = stepOneSelectAdditionProvider
                          .selectAdditionalList[index]++;
                      Map<String, dynamic> selected = {
                        "id": additionId,
                        "counter": counter + 1
                      };
                      stepOneSelectAdditionProvider.additionalList[index]
                          .addAll(selected);
                    });
                  },
                  minus: () {
                    if (stepOneSelectAdditionProvider
                            .selectAdditionalList[index] >
                        0) {
                      // selectAdditionProvider.selectAdditionalList[index]--;
                      setState(() {
                        var counter = stepOneSelectAdditionProvider
                            .selectAdditionalList[index]--;
                        Map<String, dynamic> selected = {
                          "id": additionId,
                          "counter": counter - 1
                        };
                        stepOneSelectAdditionProvider.additionalList[index]
                            .addAll(selected);
                      });
                    }
                  },
                  number:
                      stepOneSelectAdditionProvider.selectAdditionalList[index])
              : _itemsContainer(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0),
        ],
      );

  Widget _itemsContainer(
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
