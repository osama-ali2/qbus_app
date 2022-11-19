import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/TripFilterModel.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/get_started_screens/get_started_provider.dart';

import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textField.dart';
import '../trips_search_screens/search_result.dart';

class TripFilterScreen extends StatefulWidget {
  const TripFilterScreen({Key? key}) : super(key: key);

  @override
  State<TripFilterScreen> createState() => _TripFilterScreenState();
}

class _TripFilterScreenState extends State<TripFilterScreen> {
  late TextEditingController couponController;

  var selectedFromCity = "From City";
  var selectedToCity = "To City";
  var selectedFromCityId = "-1";
  var selectedToCityId = "-1";
  var selectedRating = "Rating";

  bool hotel5stars = false;
  bool internet = true;
  bool meal = false;
  bool additional = false;

  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  late TimeOfDay _selectedTime;

  String _startDate = "Start Date";
  String _endDate = "End Date";
  String _startTime = "Start Time";

  late GetStartedProvider getStartedProvider;

  @override
  void initState() {
    super.initState();

    getStartedProvider = GetStartedProvider();
    getStartedProvider =
        Provider.of<GetStartedProvider>(context, listen: false);
    getStartedProvider.init(context: context);
    couponController = TextEditingController();
    _selectedStartDate = DateTime.now();
    _selectedEndDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
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
      });
    });
  }

  void _presentTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((pickedTime) {
      if (pickedTime == null) {
        return 'no time selected';
      }

      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GetStartedProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
            text: "Trips",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomTextField(
                  controller: couponController,
                  padding: 0,
                  validator: (val) => null,
                  inputType: TextInputType.name,
                  hint: "Coupon",
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 20),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.widthRatio * 6),
                          child: Text(
                            _startDate,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ).get20HorizontalPadding(),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                GestureDetector(
                  onTap: () {
                    _presentEndDate();
                    setState(() {
                      var date = DateFormat('yyyy-MM-dd')
                          .format(_selectedEndDate)
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
                  ).get20HorizontalPadding(),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                GestureDetector(
                  onTap: () {
                    _presentTime();
                    setState(() {
                      _startTime =
                          "${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()} ${_selectedTime.period.name.toUpperCase()}";
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
                            _startTime,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ).get20HorizontalPadding(),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.widthRatio * 10),
                          child: CustomText(
                              text: selectedFromCity,
                              textSize: 12,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.black),
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        items: getStartedProvider
                            .cityList // <String>['Riyadh', 'Abha', 'Dammam', 'Tabuk']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedFromCity = value!;

                            var l = getStartedProvider.citiesList.length;
                            for (int i = 0; i < l; i++) {
                              String name =
                                  getStartedProvider.citiesList[i]['city'];
                              String id =
                                  getStartedProvider.citiesList[i]['id'];
                              debugPrint("city: $name, id: $id");
                              if (name.contains(selectedFromCity)) {
                                selectedFromCityId = id;
                                debugPrint(
                                    "MatchedCity&Id: $name, $selectedFromCityId");
                              }
                            }
                          });
                          debugPrint("selectedCity: $selectedFromCity");
                        },
                      ),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.widthRatio * 10),
                          child: CustomText(
                              text: selectedToCity,
                              textSize: 12,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.black),
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        items: getStartedProvider
                            .cityList //<String>['Riyadh', 'Abha', 'Dammam', 'Tabuk']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedToCity = value!;

                            var l = getStartedProvider.citiesList.length;
                            for (int i = 0; i < l; i++) {
                              String name =
                                  getStartedProvider.citiesList[i]['city'];
                              String id =
                                  getStartedProvider.citiesList[i]['id'];
                              debugPrint("city: $name, id: $id");
                              if (name.contains(selectedToCity)) {
                                selectedToCityId = id;
                                debugPrint(
                                    "MatchedCity&Id: $name, $selectedToCityId");
                              }
                            }
                          });
                          debugPrint("selectedCity: $selectedToCity");
                        },
                      ),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizes!.widthRatio * 10),
                          child: CustomText(
                              text: selectedRating,
                              textSize: 12,
                              fontWeight: FontWeight.normal,
                              textColor: Colors.black),
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        items: <String>['1.0', '2.0', '3.0', '4.0', '5.0']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRating = value!;
                          });
                          debugPrint("selectedRating: $selectedRating");
                        },
                      ),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomText(
                  text: "Additional",
                  textSize: sizes!.fontRatio * 18,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    checkBox(context, internet, "Hostel 5 Stars", () {
                      hotel5stars = false;
                      meal = false;
                      internet = true;
                      setState(() {
                        additional = internet;
                      });
                    }),
                    CommonPadding.sizeBoxWithHeight(height: 15),
                    checkBox(context, meal, "Meal", () {
                      hotel5stars = false;
                      meal = true;
                      internet = false;
                      setState(() {
                        additional = meal;
                      });
                    }),
                    CommonPadding.sizeBoxWithHeight(height: 15),
                    checkBox(context, hotel5stars, "Internet", () {
                      hotel5stars = true;
                      meal = false;
                      internet = false;

                      setState(() {
                        additional = hotel5stars;
                      });
                    }),
                  ],
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 20),
                CustomButton(
                        name: "Filter Result",
                        buttonColor: appColor,
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        textSize: sizes!.fontRatio * 16,
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        borderRadius: 5,
                        onTapped: () {
                          var couponCode =
                              couponController.text.toString().trim();
                          // "code": code,
                          // "date_from": date_from,
                          // "date_to": date_to,
                          // "time_from": time_from,
                          // "from_city_id": from_city_id,
                          // "to_city_id": to_city_id,
                          // "additional": additional,
                          // "offset": offset

                          var filterData = TripFilterModel(
                              code: couponCode,
                              date_to: _endDate,
                              date_from: _startDate,
                              time_from: _startTime,
                              from_city_id: selectedFromCityId,
                              to_city_id: selectedToCityId,
                              additional: [],
                              offset: 0);

                          debugPrint("filterData: ${filterData.toJson()}");
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResult(
                                        tripFilterModel: filterData,
                                      )));
                        },
                        padding: 0)
                    .get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
            width: 10,
          ),
          CustomText(
              text: name,
              textSize: sizes!.fontRatio * 14,
              fontWeight: FontWeight.w400,
              textColor: Colors.black)
        ],
      ),
    );
  }
}
