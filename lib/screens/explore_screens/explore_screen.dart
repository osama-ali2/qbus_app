import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/explore_screens/explore_provider.dart';
import 'package:qbus/screens/explore_screens/package_detail_screens/package_detail_screen.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import 'package_filter_screens/package_filter_screen.dart';

class ExploreScreen extends StatefulWidget {
  final PackageFilterModel? packageFilterModel;

  const ExploreScreen({Key? key, this.packageFilterModel}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ExploreProvider exploreProvider;

  // The controller for the ListView
  late ScrollController _scrollController;

  int index = 0;

  @override
  void initState() {
    super.initState();

    exploreProvider = ExploreProvider();
    exploreProvider = Provider.of<ExploreProvider>(context, listen: false);
    exploreProvider.init(context: context);

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        debugPrint("Ending...");
        setState(() {
          index++;
          debugPrint("EndingIndex: $index");
        });
        exploreProvider.getPackagesData(
            packageFilterModel: widget.packageFilterModel!, offset: index);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      exploreProvider.getPackagesData(
          packageFilterModel: widget.packageFilterModel!, offset: index);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ExploreProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: CustomText(
            text: AppLocalizations.of(context)!.explore_packages,
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizes!.fontRatio * 20.0),
        child: exploreProvider.isListHasData > 0
            ? _getUI(context)
            : Center(
                child: const Text("no Data"),
              ),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizes!.heightRatio * 10,
        ),
        exploreProvider.isDataLoaded
            ? Expanded(
                child:
                    exploreProvider.packagesResponse.data!.packages!.isNotEmpty
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: exploreProvider
                                .packagesResponse.data!.packages!.length,
                            itemBuilder: (context, i) {
                              var data = exploreProvider
                                  .packagesResponse.data!.packages![i];
                              var packageId = data.id.toString();
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
                              // debugPrint("thumbnailImage: $thumbnailImage");
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
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
                            })
                        : Center(
                            child: TextView.getSubHeadingTextWith15(
                                AppLocalizations.of(context)!.no_data, Assets.latoBold,
                                color: AppColors.blueHomeColor,
                                lines: 1,
                                fontWeight: FontWeight.normal),
                          ),
              )
            : Container(),
        CommonPadding.sizeBoxWithHeight(height: 15),
        exploreProvider.isDataLoaded
            ? CustomButton(
                name: AppLocalizations.of(context)!.filter,
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.normal,
                borderRadius: 5,
                onTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PackageFilterScreen(),
                    ),
                  );
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
              width: sizes!.widthRatio * 10,
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
                            text: "SAR $fee",
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
}
