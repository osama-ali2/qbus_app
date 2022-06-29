import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/res/toasts.dart';
import 'package:qbus/screens/get_started_screens/get_started_provider.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../../../widgets/custom_button.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../widgets/text_views.dart';
import '../explore_screens/explore_screen.dart';
import '../explore_screens/package_detail_screens/package_detail_screen.dart';
import '../search_screens/search_result.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool oneRoad = false;
  bool roundTrip = true;
  bool multiTrip = false;
  int number = 0;

  bool tripType = false;

  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  String _startDate = "Departure Date";
  String _endDate = "Arrival Date";

  late TextEditingController departureFromController;
  late TextEditingController arrivalToController;
  late TextEditingController dateController;
  late GetStartedProvider getStartedProvider;

  var departureFrom = "Departure from";
  var arrivalTo = "Arrival to";

  var arrivalToID = "-1";
  var departureFromID = "-1";

  @override
  void initState() {
    super.initState();
    getStartedProvider = GetStartedProvider();
    getStartedProvider =
        Provider.of<GetStartedProvider>(context, listen: false);
    getStartedProvider.init(context: context);
    departureFromController = TextEditingController();
    arrivalToController = TextEditingController();
    dateController = TextEditingController();
    _selectedStartDate = DateTime.now();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStartedProvider.getPackagesData();
      getStartedProvider.getCitiesData();
    });
  }

  void _presentStartDate() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return 'no date selected';
      }
      setState(() {
        _selectedStartDate = pickedDate;
        var month = DateFormat('MM').format(_selectedStartDate).toString();
        var year = DateFormat('yyyy').format(_selectedStartDate).toString();
        debugPrint("_selectedDate: month $month");
        debugPrint("_selectedDate: year $year");
      });
    });
  }

  void _presentEndDate() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return 'no date selected';
      }
      setState(() {
        _selectedEndDate = pickedDate;
        var month = DateFormat('MM').format(_selectedEndDate).toString();
        var year = DateFormat('yyyy').format(_selectedEndDate).toString();
        debugPrint("_selectedDate: month $month");
        debugPrint("_selectedDate: year $year");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GetStartedProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: _getUI(context)),
      ),
    );
  }

  void _changeLanguage(lang) {
    const Locale("ar", 'Ar');
    debugPrint(lang.name);
  }

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
              text: "Book Bus\nLet's Do Now!",
              textSize: sizes!.fontRatio * 18,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              textAlign: TextAlign.start,
            ),
            // DropdownButton(
            //   onChanged: (language) {
            //     _changeLanguage(language);
            //   },
            //   underline: const SizedBox(),
            //   icon: const Icon(
            //     Icons.language,
            //     size: 28,
            //   ),
            //   items: Language.languageList()
            //       .map<DropdownMenuItem<Language>>(
            //           (language) => DropdownMenuItem(
            //                 value: language,
            //                 child: Row(
            //                   children: <Widget>[
            //                     Text(language.flag),
            //                     Text(language.name),
            //                   ],
            //                 ),
            //               ))
            //       .toList(),
            // ),
          ]),
          SizedBox(
            height: sizes!.fontRatio * 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBox(context, oneRoad, "One Way", () {
                multiTrip = false;
                roundTrip = false;
                oneRoad = true;
                setState(() {
                  tripType = oneRoad;
                });
              }),
              checkBox(context, roundTrip, "Round Trip", () {
                multiTrip = false;
                roundTrip = true;
                oneRoad = false;
                setState(() {
                  tripType = roundTrip;
                });
              }),
              checkBox(context, multiTrip, "Multi Destination", () {
                multiTrip = true;
                roundTrip = false;
                oneRoad = false;

                setState(() {
                  tripType = multiTrip;
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

          // CustomTextField(
          //   controller: departureFromController,
          //   padding: 0,
          //   validator: (val) => null,
          //   inputType: TextInputType.name,
          //   hint: "Departure from",
          // ),
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
                      text: arrivalTo,
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
                    arrivalTo = value!;
                    debugPrint("selectedCity: $arrivalTo");

                    var l = getStartedProvider.citiesList.length;
                    for (int i = 0; i < l; i++) {
                      String name = getStartedProvider.citiesList[i]['city'];
                      String id = getStartedProvider.citiesList[i]['id'];
                      debugPrint("city: $name, id: $id");
                      if (name.contains(arrivalTo)) {
                        arrivalToID = id;
                        debugPrint("MatchedCity&Id: $name, $arrivalToID");
                      }
                    }
                  });
                },
              ),
            ),
          ),

          // CustomTextField(
          //   controller: arrivalToController,
          //   padding: 0,
          //   validator: (val) => null,
          //   inputType: TextInputType.name,
          //   hint: "Arrival to",
          // ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          GestureDetector(
            onTap: () {
              _presentStartDate();

              setState(() {
                var date = DateFormat('yyyy-MM-dd')
                    .format(_selectedStartDate)
                    .toString();
                _startDate = date;
              });
            },
            child: Container(
              height: sizes!.heightRatio * 48,
              width: sizes!.widthRatio * 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade400)),
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
                    setState(() {
                      var date = DateFormat('yyyy-MM-dd')
                          .format(_selectedStartDate)
                          .toString();
                      _endDate = date;
                    });
                  },
                  child: Container(
                    height: sizes!.heightRatio * 48,
                    width: sizes!.widthRatio * 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade400)),
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
              text: "Passengers count",
              textSize: sizes!.fontRatio * 14,
              fontWeight: FontWeight.normal,
              textColor: Colors.black),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          Counter(
              number: number,
              onAdd: () {
                number++;
                setState(() {});
              },
              onMinus: () {
                if (number > 0) {
                  number--;
                  setState(() {});
                }
              }),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
          CustomButton(
              name: "Search",
              buttonColor: appColor,
              height: sizes!.heightRatio * 45,
              width: double.infinity,
              textSize: sizes!.fontRatio * 16,
              textColor: Colors.white,
              fontWeight: FontWeight.normal,
              borderRadius: 5,
              onTapped: () {
                if (departureFromID != "-1" &&
                    arrivalToID != "-1" &&
                    _startDate != "" &&
                    departureFrom != "" &&
                    arrivalTo != "") {
                  NavigationHelper.pushRoute(
                      context,
                      SearchResult(
                        fromCity: departureFrom,
                        toCity: arrivalTo,
                        tripFilterModel: TripFilterModel(
                            from_city_id: departureFromID,
                            to_city_id: arrivalToID,
                            date_from: _startDate),
                      ));
                } else {
                  Toasts.getErrorToast(text: "Fields are required");
                }
              },
              padding: 0),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: "Packages",
                  textSize: sizes!.fontRatio * 18,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              InkWell(
                onTap: () {
                  NavigationHelper.pushRoute(
                      context,
                      ExploreScreen(
                        packageFilterModel: PackageFilterModel(),
                      ));
                },
                child: Row(
                  children: [
                    CustomText(
                        text: "Explore",
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
                        var packageName = data.name!.en.toString();
                        var rating = data.rate.toString();
                        var fee = data.fees.toString();
                        var image = data.image.toString();
                        var baseUrl = getStartedProvider
                            .packagesResponse.data!.imageBase
                            .toString();
                        var thumbnailImage = "$baseUrl/$image";
                        var dateFrom = data.dateFrom.toString();
                        var detail = data.description!.en.toString();
                        // debugPrint("thumbnailImage: $thumbnailImage");
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: sizes!.heightRatio * 8.0),
                          child: GestureDetector(
                            onTap: () {
                              NavigationHelper.pushRoute(
                                  context,
                                  PackageDetailScreen(
                                    packageTitle: packageName,
                                    packageId: packageId,
                                  ));
                            },
                            child: packageCardContainer(
                                title: packageName,
                                rating: rating,
                                fee: fee,
                                dateFrom: dateFrom,
                                detail: detail,
                                image: thumbnailImage),
                          ),
                        );
                      }))
              : Container(),
          CommonPadding.sizeBoxWithHeight(height: 20),
        ],
      ),
    );
  }

  Widget packageCardContainer({
    required String title,
    required String rating,
    required String fee,
    required String dateFrom,
    required String detail,
    required String image,
  }) =>
      Container(
        height: sizes!.heightRatio * 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.containerShadowColor,
                blurRadius: 10.0,
                offset: Offset(0, 2),
              ),
            ],
            color: Colors.white),
        child: Row(
          children: [
            Container(
              height: sizes!.heightRatio * 100,
              width: sizes!.widthRatio * 140,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  image,
                  height: sizes!.heightRatio * 100,
                  width: sizes!.widthRatio * 140,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: sizes!.heightRatio * 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: title,
                    textSize: sizes!.fontRatio * 14,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.black),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                SizedBox(
                  height: sizes!.heightRatio * 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomText(
                    text: "$detail...",
                    textSize: sizes!.fontRatio * 10,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                CustomText(
                  text: dateFrom,
                  textSize: sizes!.fontRatio * 10,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 22,
                        ),
                        CustomText(
                            text: rating,
                            textSize: sizes!.fontRatio * 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black)
                      ],
                    ),
                    CommonPadding.sizeBoxWithWidth(width: 85),
                    Container(
                      height: sizes!.heightRatio * 20,
                      width: sizes!.widthRatio * 60,
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: CustomText(
                            text: "SKR $fee",
                            textSize: sizes!.fontRatio * 10,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );

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
                    color: isSelected ? appColor : Colors.grey.shade400)),
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
              textColor: Colors.black)
        ],
      ),
    );
  }
}
