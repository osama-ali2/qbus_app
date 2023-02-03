import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/text_views.dart';
import 'return_policy_provider.dart';

class ReturnPolicyScreen extends StatefulWidget {
  const ReturnPolicyScreen({Key? key}) : super(key: key);

  @override
  State<ReturnPolicyScreen> createState() => _ReturnPolicyScreenState();
}

class _ReturnPolicyScreenState extends State<ReturnPolicyScreen> {
  late ReturnPolicyProvider returnPolicyProvider;

  @override
  void initState() {
    super.initState();
    returnPolicyProvider = ReturnPolicyProvider();
    returnPolicyProvider =
        Provider.of<ReturnPolicyProvider>(context, listen: false);
    returnPolicyProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      returnPolicyProvider.getPrivacyPolicy();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ReturnPolicyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: CustomText(
            text: AppLocalizations.of(context)!.return_policy,
            textSize: 18,
            fontWeight: FontWeight.w700,
            textColor: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          height: sizes!.height,
          width: sizes!.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonPadding.sizeBoxWithHeight(height: 20),
              TextView.getMediumText18("Cancellation Policy", Assets.latoBold,
                  color: AppColors.black900, lines: 1),
              CommonPadding.sizeBoxWithHeight(height: 10),
              TextView.getMediumText14(
                  returnPolicyProvider
                          .returnPolicyResponse.data?.returnPolicy?.en ??
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan lorem urna, augue vel est viverra sed placerat quis. Proin laoreet magna ultrices faucibus volutpat urna habitant. Sed lorem nibh tristique egestas facilisis condimentum id tellus. Mattis donec vitae egestas nibh sollicitudin adipiscing consequat aliquam. Blandit dis leo cursus augue nulla mollis erat. Urna, volutpat non sodales lacinia morbi non ut cursus. Elementum fusce netus lacus, a, accumsan"
                          "At id ut cras odio arcu vulputate. Pellentesque cursus odio bibendum sagittis. Nullam quis nunc consectetur dictum. Sed nibh urna, ullamcorper tortor enim pellentesque vel. Consectetur amet.",
                  Assets.latoRegular,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                  lines: 20)
            ],
          ).get20HorizontalPadding(),
        ),
      ),
    );
  }
}
