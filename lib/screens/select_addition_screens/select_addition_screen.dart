import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/models/trips/TripsResponse.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screen.dart';
import 'package:qbus/screens/passenger_screens/passenger_screen.dart';
import 'package:qbus/screens/select_addition_screens/select_addition_provider.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';

class SelectAdditionScreen extends StatefulWidget {
  // final String? tripId;
  final Trips tripsModel;
  final bool isOneWayTripChecked;
  final bool isRoundTripChecked;
  final bool isMultiDestinationChecked;
  final String passengersCount;
  final String toCityId;
  final String fromCityId;

  const SelectAdditionScreen({
    Key? key,
    required this.tripsModel,
    required this.isOneWayTripChecked,
    required this.isRoundTripChecked,
    required this.isMultiDestinationChecked,
    required this.passengersCount,
    required this.toCityId,
    required this.fromCityId,
  }) : super(key: key);

  @override
  State<SelectAdditionScreen> createState() => _SelectAdditionScreenState();
}

class _SelectAdditionScreenState extends State<SelectAdditionScreen> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;
  int currentIndex = 0;
  int isRoundTripCounter = 0;
  late SelectAdditionProvider selectAdditionProvider;

  @override
  void initState() {
    super.initState();
    selectAdditionProvider = SelectAdditionProvider();
    selectAdditionProvider =
        Provider.of<SelectAdditionProvider>(context, listen: false);
    selectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectAdditionProvider.getAdditionalData(
        id: widget.tripsModel.id!.toString(),
      );
    });

    debugPrint("isOneWayTripChecked: ${widget.isOneWayTripChecked}");
    debugPrint("isRoundTripChecked: ${widget.isRoundTripChecked}");
    debugPrint(
        "isMultiDestinationChecked: ${widget.isMultiDestinationChecked}");
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectAdditionProvider>(context, listen: true);
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
      body: selectAdditionProvider.isTripLoaded == true
          ? SafeArea(
              child: Column(
                children: [
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  Expanded(
                    child: ListView.builder(
                        itemCount: selectAdditionProvider
                            .tripAdditionalsResponse.data!.additional!.length,
                        itemBuilder: (context, index) {
                          currentIndex = index;
                          var name = selectAdditionProvider
                              .tripAdditionalsResponse
                              .data!
                              .additional![index]
                              .name!
                              .en
                              .toString();
                          var additionId = selectAdditionProvider
                              .tripAdditionalsResponse
                              .data!
                              .additional![index]
                              .id
                              .toString();
                          return itemContainer(
                            name: name,
                            index: index,
                            additionId: additionId,
                          );
                        }),
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  CustomButton(
                    name: "Next",
                    //"Save Trip",
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () async {
                      //TODO: Uncomment this
                      // await callOrderTrip();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PassengerScreen(
                            passengerCount: int.parse(widget.passengersCount),
                            tripId: widget.tripsModel.id!,
                            additionalList:
                                selectAdditionProvider.additionalList,
                          ),
                        ),
                      );
                    },
                    padding: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                                border: Border.all(color: appColor),
                              ),
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

  /// Call Order Trip
  Future<void> callOrderTrip() async {
    if (widget.isOneWayTripChecked == true) {
      await selectAdditionProvider.oneWayOrderTrip(
          trips: widget.tripsModel, passengersCount: widget.passengersCount);
      if (selectAdditionProvider.isOneWayOrderTripSaved == true) {
        // await selectAdditionProvider.getAdditionalData(id: widget.tripId!);
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomBarScreen()),
            (route) => false);
      }
    } else if (widget.isRoundTripChecked == true) {
      setState(() {
        isRoundTripCounter++;
        debugPrint("isRoundTripCounter:$isRoundTripCounter");
      });
      await selectAdditionProvider.roundOrderTrip(
          trips: widget.tripsModel, passengersCount: widget.passengersCount);
      if (selectAdditionProvider.isRoundOrderTripSaved == true) {
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomBarScreen()),
            (route) => false);
      }
    }
    // else if (widget.isMultiDestinationChecked == true) {
    //   await selectAdditionProvider.multiOrderTrip(
    //       trips: widget.tripsModel!, passengersCount: widget.passengersCount!);
    //   if (selectAdditionProvider.isMultiOrderTripSaved == true) {
    //     if (!mounted) return;
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => const BottomBarScreen()),
    //         (route) => false);
    //   }
    // }
  }

  /// Item Container
  Widget itemContainer({
    required String name,
    required int index,
    required String additionId,
  }) =>
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
                    setState(() {
                      var counter =
                          selectAdditionProvider.selectAdditionalList[index]++;
                      Map<String, dynamic> selected = {
                        "id": additionId,
                        "counter": counter + 1
                      };
                      selectAdditionProvider.additionalList[index]
                          .addAll(selected);
                    });
                  },
                  minus: () {
                    if (selectAdditionProvider.selectAdditionalList[index] >
                        0) {
                      setState(() {
                        var counter = selectAdditionProvider
                            .selectAdditionalList[index]--;
                        Map<String, dynamic> selected = {
                          "id": additionId,
                          "counter": counter - 1
                        };
                        selectAdditionProvider.additionalList[index]
                            .addAll(selected);
                      });
                    }
                  },
                  number: selectAdditionProvider.selectAdditionalList[index],
                )
              : _itemsCounter(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0),
        ],
      );

  /// Items
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
