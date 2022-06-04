import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/get_started_screens/get_started_provider.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textField.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../widgets/text_views.dart';
import '../explore_screens/explore_screen.dart';
import '../search_screens/search_result.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool oneRoad = false;
  bool roundTrip = false;
  bool multiTrip = false;
  int number = 0;

  bool tripType = false;

  late TextEditingController departureFromController;
  late TextEditingController arrivalToController;
  late TextEditingController dateController;
  late GetStartedProvider getStartedProvider;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStartedProvider.getPackagesData();
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
          CustomTextField(
            controller: departureFromController,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Departure from",
          ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          CustomTextField(
            controller: arrivalToController,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Arrival to",
          ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          CustomTextField(
            controller: dateController,
            padding: 0,
            validator: (val) => null,
            inputType: TextInputType.name,
            hint: "Select Dates",
          ),
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
                NavigationHelper.pushRoute(context, const SearchResult());
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
                  NavigationHelper.pushRoute(context, const ExploreScreen());
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
          getStartedProvider.isDataLoaded
              ? SizedBox(
                  height: sizes!.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: getStartedProvider
                          .packagesResponse.data!.packages!.isNotEmpty
                      ? ListView.builder(
                          itemCount: getStartedProvider
                              .packagesResponse.data!.packages!.length,
                          itemBuilder: (context, i) {
                            var data = getStartedProvider
                                .packagesResponse.data!.packages![i];
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
                            debugPrint("thumbnailImage: $thumbnailImage");
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: packageCardContainer(
                                  title: packageName,
                                  rating: rating,
                                  fee: fee,
                                  dateFrom: dateFrom,
                                  detail: detail,
                                  image: thumbnailImage),
                            );
                          })
                      : Center(
                          child: TextView.getSubHeadingTextWith15(
                              "No Data Available", Assets.latoBold,
                              color: AppColors.blueHomeColor,
                              lines: 1,
                              fontWeight: FontWeight.normal),
                        ),
                )
              : Container()
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
              height: sizes!.heightRatio * 130,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(image),
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
                  textSize: 10,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: sizes!.heightRatio * 5,
                ),
                Row(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
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
