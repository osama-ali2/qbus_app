import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../package_passenger_screens/package_passenger_screen.dart';
import 'package_select_addition_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PackageSelectAdditionScreen extends StatefulWidget {
  final String packageId;
  final int passengerCount;
  final bool isHotelTripeOneEmpty;
  final int firstTripId;
  final int secondTripId;

  const PackageSelectAdditionScreen({
    Key? key,
    required this.packageId,
    required this.passengerCount,
    required this.isHotelTripeOneEmpty,
    required this.firstTripId,
    required this.secondTripId,
  }) : super(key: key);

  @override
  State<PackageSelectAdditionScreen> createState() =>
      _PackageSelectAdditionScreenState();
}

class _PackageSelectAdditionScreenState
    extends State<PackageSelectAdditionScreen> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;
  int currentIndex = 0;

  late PackageSelectAdditionProvider packageSelectAdditionProvider;

  @override
  void initState() {
    super.initState();
    packageSelectAdditionProvider = PackageSelectAdditionProvider();
    packageSelectAdditionProvider =
        Provider.of<PackageSelectAdditionProvider>(context, listen: false);
    packageSelectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageSelectAdditionProvider.getAdditionalData(id: widget.packageId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageSelectAdditionProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: AppLocalizations.of(context)!.select_additions,
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: packageSelectAdditionProvider.isPackageLoaded == true
          ? SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: packageSelectAdditionProvider
                            .packageAdditionalsResponse
                            .data!
                            .additional!
                            .length,
                        itemBuilder: (context, index) {
                          currentIndex = index;
                          // var name = packageSelectAdditionProvider
                          //     .packageAdditionalsResponse
                          //     .data!
                          //     .additional![index]
                          //     .name!
                          //     .en
                          //     .toString();

                          var name = packageSelectAdditionProvider
                              .packageAdditionalsResponse
                              .data!
                              .additional![index]
                              .name!
                              .ar
                              .toString();

                          var additionId = packageSelectAdditionProvider
                              .packageAdditionalsResponse
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
                  CustomButton(
                    name: AppLocalizations.of(context)!.next,
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    borderRadius: 5,
                    onTapped: () {
                      debugPrint(
                          "packageSelectAddition: ${packageSelectAdditionProvider.additionalList}, passengerCount:${widget.passengerCount}, packageId:${widget.packageId}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PackagePassengerScreen(
                            passengerCount: widget.passengerCount,
                            packageId: int.parse(widget.packageId),
                            additionalList:
                                packageSelectAdditionProvider.additionalList,
                            isHotelTripeOneEmpty: widget.isHotelTripeOneEmpty,
                            firstTripId: widget.firstTripId,
                            secondTripId: widget.secondTripId,
                          ),
                        ),
                      );
                    },
                    padding: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
                          PreferenceUtils.getString(Strings.loginUserToken)!
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
                                  textColor: appColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                  CommonPadding.sizeBoxWithHeight(height: 10)
                ],
              ),
            )
          : const Center(
              child: Text(AppLocalizations.of(context)!.no_data),
            ),
    );
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
              ? _items(
                  context: context,
                  name: name,
                  add: () {
                    _tripAddCounter(index: index, additionId: additionId);
                  },
                  minus: () {
                    _tripMinusCounter(index: index, additionId: additionId);
                  },
                  number: packageSelectAdditionProvider
                      .packageSelectAdditionalList[index],
                )
              : _items(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0,
                ),
        ],
      );

  /// Trip Add Counter
  void _tripAddCounter({required int index, required String additionId}) {
    setState(() {
      packageSelectAdditionProvider.packageSelectAdditionalList[index]++;
      Map<String, dynamic> selected = {
        "id": additionId,
        "counter":
            packageSelectAdditionProvider.packageSelectAdditionalList[index],
      };
      debugPrint("tripAddCounter: $selected");
      packageSelectAdditionProvider.additionalList[index].addAll(selected);
    });
  }

  /// Trip Minus Counter
  void _tripMinusCounter({required int index, required String additionId}) {
    if (packageSelectAdditionProvider.packageSelectAdditionalList[index] > 0) {
      setState(() {
        packageSelectAdditionProvider.packageSelectAdditionalList[index]--;
        Map<String, dynamic> selected = {
          "id": additionId,
          "counter":
              packageSelectAdditionProvider.packageSelectAdditionalList[index],
        };
        debugPrint("tripMinusCounter: $selected");
        packageSelectAdditionProvider.additionalList[index].addAll(selected);
      });
    }
  }

  /// Items
  Widget _items({
    required BuildContext context,
    required String name,
    required Function add,
    required Function minus,
    required int number,
  }) {
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
              textColor: const Color(0xff747268),
            ),
            Counter(number: number, onAdd: () => add(), onMinus: () => minus())
          ],
        ),
      ),
    ).get20HorizontalPadding();
  }
}
