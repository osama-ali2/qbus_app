import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qbus/models/PackageFilterModel.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/resources/resources.dart';
import 'package:qbus/screens/project_widgets/filter_container_widget.dart';
import 'package:qbus/screens/project_widgets/package_card_container_widget.dart';
import 'package:qbus/widgets/text_views.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import 'package_detail_screens/package_detail_screen.dart';
import 'package_filter_screens/package_filter_screen.dart';
import 'package_provider.dart';

class PackageScreen extends StatefulWidget {
  final PackageFilterModel? packageFilterModel;

  const PackageScreen({Key? key, this.packageFilterModel}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  late PackageProvider packageProvider;

  // The controller for the ListView
  late ScrollController _scrollController;
  int index = 0;

  @override
  void initState() {
    super.initState();

    packageProvider = PackageProvider();
    packageProvider = Provider.of<PackageProvider>(context, listen: false);
    packageProvider.init(context: context);

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        debugPrint("Ending...");
        setState(() {
          index++;
          debugPrint("EndingIndex: $index");
        });
        packageProvider.getPackagesData(
          packageFilterModel: widget.packageFilterModel!,
          offset: index,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageProvider.getPackagesData(
        packageFilterModel: widget.packageFilterModel!,
        offset: index,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: CustomText(
          text: AppLocalizations.of(context)!.explore_packages,
          textSize: sizes!.fontRatio * 18,
          fontWeight: FontWeight.w400,
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizes!.fontRatio * 20.0),
          child: packageProvider.isListHasData > 0
              ? _getUI(context)
              : const Center(
                  child: Text("No Data"),
                ),
        ),
      ),
    );
  }

  /// Get UI
  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        CommonPadding.sizeBoxWithHeight(height: 10),
        FilterContainerWidget(onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PackageFilterScreen(),
            ),
          );
        }),
        CommonPadding.sizeBoxWithHeight(height: 10),
        packageProvider.isDataLoaded
            ? Expanded(
                child:
                    packageProvider.packagesResponse.data!.packages!.isNotEmpty
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: packageProvider
                                .packagesResponse.data!.packages!.length,
                            itemBuilder: (context, i) {
                              var data = packageProvider
                                  .packagesResponse.data!.packages![i];
                              var packageId = data.id.toString();

                              // var packageName = data.name!.en.toString();
                              var packageName = data.name!.toString();

                              var rating = data.rate.toString();
                              var fee = data.fees.toString();
                              var image = data.image.toString();
                              var baseUrl = packageProvider
                                  .packagesResponse.data!.imageBase
                                  .toString();
                              var thumbnailImage = "$baseUrl/$image";
                              var dateFrom = data.dateFrom.toString();
                              var detail = data.description!.toString();
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
                                  child: PackageCardContainerWidget(
                                    title: packageName,
                                    rating: rating,
                                    fee: fee,
                                    dateFrom: dateFrom,
                                    detail: detail,
                                    image: thumbnailImage,
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: TextView.getSubHeadingTextWith15(
                              AppLocalizations.of(context)!.no_data,
                              Assets.latoBold,
                              color: AppColors.blueHomeColor,
                              lines: 1,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
              )
            : Container(),
        CommonPadding.sizeBoxWithHeight(height: 10),
      ],
    );
  }
}
