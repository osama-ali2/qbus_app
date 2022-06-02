import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/search_screens/search_provider.dart';
import 'package:qbus/screens/trip_filter_screens/trip_filter_screen.dart';

import '../../../../navigation/navigation_helper.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_views.dart';
import '../selectAddition/select_addition_screen.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late SearchProvider searchProvider;

  @override
  void initState() {
    super.initState();

    searchProvider = SearchProvider();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchProvider.getTripsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          centerTitle: false,
          title: const CustomText(
              text: "Makkah - Al Madina",
              textSize: 18,
              fontWeight: FontWeight.w400,
              textColor: Colors.white),
        ),
        body: Column(
          children: [
            searchProvider.isTripDataLoaded
                ? Expanded(
                    child: searchProvider.tripsResponse.data!.trips!.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchProvider
                                .tripsResponse.data!.trips!.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                  onTap: () {
                                    NavigationHelper.pushRoute(
                                        context, const SelectAdditionScreen());
                                  },
                                  child: _card(context));
                            })
                        : Center(
                            child: TextView.getSubHeadingTextWith15(
                                "No Data Available", Assets.latoBold,
                                color: AppColors.blueHomeColor,
                                lines: 1,
                                fontWeight: FontWeight.normal),
                          ),
                  )
                : Container(),
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
                      Navigator.pop(context);
                      NavigationHelper.pushRoute(
                          context, const TripFilterScreen());
                    },
                    padding: 0)
                .get20HorizontalPadding(),
            CommonPadding.sizeBoxWithHeight(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                        text: "10:30 Makkah",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xff747268),
                      size: 18,
                    ),
                    CustomText(
                        text: "10:30 Makkah",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                  ],
                ),
                Container(
                  height: 20,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2), color: appColor),
                  child: const Center(
                    child: CustomText(
                        text: "SAR 90",
                        textSize: 10,
                        fontWeight: FontWeight.normal,
                        textColor: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                        text: "Station A",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                    Icon(
                      Icons.play_arrow,
                      color: Color(0xff747268),
                      size: 18,
                    ),
                    CustomText(
                        text: "Station B",
                        textSize: 14,
                        fontWeight: FontWeight.w400,
                        textColor: Color(0xff747268)),
                  ],
                ),
                const CustomText(
                    text: "5 Stops",
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: Color(0xff747268))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                    text: "Jeddah Trip",
                    textSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: Color(0xff747268)),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    CustomText(
                        text: "(4/5)",
                        textSize: 16,
                        fontWeight: FontWeight.normal,
                        textColor: Color(0xff747268)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                text: "Ac / Hotel 3 star / meal",
                textSize: 14,
                fontWeight: FontWeight.w500,
                textColor: Colors.grey),
          ],
        ),
      ),
    );
  }
}
