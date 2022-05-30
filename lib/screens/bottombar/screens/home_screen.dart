import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/screens/bottombar/screens/search/search_result.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_text.dart';
import 'package:qbus/widgets/package_card.dart';
import 'package:qbus/language.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import 'explore/explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool oneRoad = false;
  bool roundTrip = false;
  bool multiTrip = false;
  int number = 0;
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 13,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const CustomText(
              text: "Book Bus\nLet's Do Now!",
              textSize: 18,
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              textAlign: TextAlign.start,
            ),
            DropdownButton(
              onChanged: (language) {
                _changeLanguage(language);
              },
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                size: 28,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                      (language) => DropdownMenuItem(
                            value: language,
                            child: Row(
                              children: <Widget>[
                                Text(language.flag),
                                Text(language.name),
                              ],
                            ),
                          ))
                  .toList(),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              checkBox(context, oneRoad, "One Way", () {
                multiTrip = false;
                roundTrip = false;
                oneRoad = true;
                setState(() {});
              }),
              checkBox(context, roundTrip, "Round Trip", () {
                multiTrip = false;
                roundTrip = true;
                oneRoad = false;
                setState(() {});
              }),
              checkBox(context, multiTrip, "Multi Destination", () {
                multiTrip = true;
                roundTrip = false;
                oneRoad = false;

                setState(() {});
              }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: _email,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Departure from",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _email,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Arrival to",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: _email,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Select Dates",
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
              text: "Passengers count",
              textSize: 14,
              fontWeight: FontWeight.normal,
              textColor: Colors.black),
          const SizedBox(
            height: 10,
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
          const SizedBox(
            height: 15,
          ),
          CustomButton(
              name: "Search",
              buttonColor: appColor,
              height: 45,
              width: double.infinity,
              textSize: 14,
              textColor: Colors.white,
              fontWeight: FontWeight.normal,
              borderRadius: 5,
              onTapped: () {
                NavigationHelper.pushRoute(context, const SearchResult());
              },
              padding: 0),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                  text: "Packages",
                  textSize: 18,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black),
              InkWell(
                onTap: () {
                  NavigationHelper.pushRoute(context, const ExploreScreen());
                },
                child: Row(
                  children: const [
                    CustomText(
                        text: "Explore",
                        textSize: 16,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.black),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(itemBuilder: (context, i) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: PackageCard(),
              );
            }),
          )
        ],
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
            height: 18,
            width: 18,
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
          SizedBox(
            width: 3,
          ),
          CustomText(
              text: name,
              textSize: 12,
              fontWeight: FontWeight.normal,
              textColor: Colors.black)
        ],
      ),
    );
  }
}
