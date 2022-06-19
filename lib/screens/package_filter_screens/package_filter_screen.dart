import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/my_global/my_global.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/explore_screens/explore_screen.dart';
import '../../res/res.dart';
import '../../utils/constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_textField.dart';

class PackageFilterScreen extends StatefulWidget {
  const PackageFilterScreen({Key? key}) : super(key: key);

  @override
  State<PackageFilterScreen> createState() => _PackageFilterScreenState();
}

class _PackageFilterScreenState extends State<PackageFilterScreen> {
  late TextEditingController couponController;

  var selectedCity = "Starting City";

  bool internet = false;
  bool meal = false;
  bool hostel5Stars = false;

  bool additional = false;

  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  String _startDate = "Start Date";
  String _endDate = "End Date";
  String _startTime = "Start Time";



  @override
  void initState() {
    super.initState();
    couponController = TextEditingController();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  void _presentDate() {
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
        _selectedDate = pickedDate;
        var month = DateFormat('MM').format(_selectedDate).toString();
        var year = DateFormat('yyyy').format(_selectedDate).toString();
        debugPrint("_selectedDate: month $month");
        debugPrint("_selectedDate: year $year");
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
        var minutes = DateFormat('Hm').format(_selectedDate).toString();
        debugPrint("_selectedDate: minutes $minutes");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const CustomText(
            text: "Packages",
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SingleChildScrollView(
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
                  _presentDate();

                  setState(() {
                    var date = DateFormat('yyyy-MM-dd')
                        .format(_selectedDate)
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
                  _presentDate();

                  setState(() {
                    var date = DateFormat('yyyy-MM-dd')
                        .format(_selectedDate)
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
                        "${_selectedTime.hour.toString()}:${_selectedTime.minute.toString()}";
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
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
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
                            text: selectedCity,
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black),
                      ),
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: <String>['Riyadh', 'Abha', 'Dammam', 'Tabuk']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                        debugPrint("selectedCity: $selectedCity");
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
                    hostel5Stars = false;
                    meal = false;
                    internet = true;
                    setState(() {
                      additional = internet;
                    });
                  }),
                  CommonPadding.sizeBoxWithHeight(height: 15),
                  checkBox(context, meal, "Meal", () {
                    hostel5Stars = false;
                    meal = true;
                    internet = false;
                    setState(() {
                      additional = meal;
                    });
                  }),
                  CommonPadding.sizeBoxWithHeight(height: 15),
                  checkBox(context, hostel5Stars, "Internet", () {
                    hostel5Stars = true;
                    meal = false;
                    internet = false;

                    setState(() {
                      additional = hostel5Stars;
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

                        var filterData = PackageFilterModel(
                            code: couponCode,
                            starting_city_id: "",
                            date_from: _startDate,
                            date_to: _endDate,
                            time_from: _startTime,
                            additional: [],
                            offset: 0);

                        debugPrint("myGlobal: ${filterData.toJson()}");
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExploreScreen(
                                      packageFilterModel: filterData,
                                    )));
                      },
                      padding: 0)
                  .get20HorizontalPadding(),
            ],
          ),
        ),
      ),
    ));
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
              size: 16,
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
