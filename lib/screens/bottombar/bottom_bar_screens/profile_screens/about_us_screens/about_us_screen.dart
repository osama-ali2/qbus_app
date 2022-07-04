import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/assets.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/common_padding.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/widgets/text_views.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_text.dart';
import 'about_us_provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late AboutUsProvider aboutUsProvider;

  @override
  void initState() {
    super.initState();
    aboutUsProvider = AboutUsProvider();
    aboutUsProvider = Provider.of<AboutUsProvider>(context, listen: false);
    aboutUsProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      aboutUsProvider.getAboutUsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AboutUsProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title:  CustomText(
            text: AppLocalizations.of(context)!.about_us,
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: Container(
        color: AppColors.white,
        height: sizes!.height,
        width: sizes!.width,
        child: aboutUsProvider.isDataLoaded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonPadding.sizeBoxWithHeight(height: 20),
                  TextView.getMediumText18(
                          aboutUsProvider.getAboutUsResponse.data!.aboutUs!
                                  .aboutTitle!.trans!.en ??
                              "Qbus services",
                          Assets.latoBold,
                          color: AppColors.black900,
                          lines: 1)
                      .get20HorizontalPadding(),
                  CommonPadding.sizeBoxWithHeight(height: 10),
                  aboutUsProvider.getAboutUsResponse.data!.aboutUs!.aboutText!.trans!
                              .en !=
                          null
                      ? TextView.getMediumText14(
                              aboutUsProvider.getAboutUsResponse.data!.aboutUs!
                                  .aboutText!.trans!.en,
                              Assets.latoRegular,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                              lines: 20)
                          .get20HorizontalPadding()
                      : TextView.getMediumText14(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan lorem urna, augue vel est viverra sed placerat quis. Proin laoreet magna ultrices faucibus volutpat urna habitant. Sed lorem nibh tristique egestas facilisis condimentum id tellus. Mattis donec vitae egestas nibh sollicitudin adipiscing consequat aliquam. Blandit dis leo cursus augue nulla mollis erat. Urna, volutpat non sodales lacinia morbi non ut cursus. Elementum fusce netus lacus, a, accumsan"
                              "At id ut cras odio arcu vulputate. Pellentesque cursus odio bibendum sagittis. Nullam quis nunc consectetur dictum. Sed nibh urna, ullamcorper tortor enim pellentesque vel. Consectetur amet.",
                              Assets.latoRegular,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                              lines: 20)
                          .get20HorizontalPadding(),
                ],
              )
            : const Center(
                child: Text("No Data Available"),
              ),
      ),
    ));
  }
}
