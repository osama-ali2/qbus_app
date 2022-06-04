import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/screens/explore_screens/explore_provider.dart';
import 'package:qbus/screens/package_filter_screens/package_filter_screen.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/package_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreProvider exploreProvider;

  @override
  void initState() {
    super.initState();

    exploreProvider = ExploreProvider();
    exploreProvider = Provider.of<ExploreProvider>(context, listen: false);
    exploreProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      exploreProvider.getPackagesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ExploreProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
            text: "Explore Package",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        exploreProvider.isDataLoaded
            ? Expanded(
                child:
                    exploreProvider.packagesResponse.data!.packages!.isNotEmpty
                        ? ListView.builder(
                            itemCount: exploreProvider
                                .packagesResponse.data!.packages!.length,
                            itemBuilder: (context, i) {
                              var data = exploreProvider
                                  .packagesResponse.data!.packages![i];
                              var packageName = data.name!.en.toString();
                              var rating = data.rate.toString();
                              var fee = data.fees.toString();
                              var image = data.image.toString();
                              var baseUrl = exploreProvider
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
            : Container(),
        CommonPadding.sizeBoxWithHeight(height: 15),
        exploreProvider.isDataLoaded
            ? CustomButton(
                name: "Filter",
                buttonColor: appColor,
                height: 45,
                width: double.infinity,
                textSize: 14,
                textColor: Colors.white,
                fontWeight: FontWeight.normal,
                borderRadius: 5,
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PackageFilterScreen()));
                },
                padding: 0)
            : Container(),
        CommonPadding.sizeBoxWithHeight(height: 30),
      ],
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
      SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              height: 130,
              //width: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(image),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: title,
                    textSize: 14,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomText(
                    text: "$detail...",
                    textSize: 10,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: dateFrom,
                  textSize: 10,
                  fontWeight: FontWeight.normal,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
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
                            textSize: 12,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black)
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: CustomText(
                            text: "SKR $fee",
                            textSize: 10,
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
}
