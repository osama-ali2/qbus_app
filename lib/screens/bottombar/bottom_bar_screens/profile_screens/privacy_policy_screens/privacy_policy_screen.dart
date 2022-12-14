import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/extensions.dart';

import '../../../../../res/assets.dart';
import '../../../../../res/colors.dart';
import '../../../../../res/common_padding.dart';
import '../../../../../res/res.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/text_views.dart';
import 'privacy_policy_provider.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  late PrivacyPolicyProvider privacyPolicyProvider;

  @override
  void initState() {
    super.initState();
    privacyPolicyProvider = PrivacyPolicyProvider();
    privacyPolicyProvider =
        Provider.of<PrivacyPolicyProvider>(context, listen: false);
    privacyPolicyProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      privacyPolicyProvider.getPrivacyPolicy();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PrivacyPolicyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const CustomText(
          text: "Privacy Policy",
          textSize: 18,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
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
              TextView.getMediumText18("Terms of Service", Assets.latoBold,
                  color: AppColors.black900, lines: 1),
              CommonPadding.sizeBoxWithHeight(height: 10),
              TextView.getMediumText14(
                  privacyPolicyProvider
                          .privacyPolicyResponse.data?.privacyPolicy?.en ??
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Accumsan lorem urna, augue vel est viverra sed placerat quis. Proin laoreet magna ultrices faucibus volutpat urna habitant. Sed lorem nibh tristique egestas facilisis condimentum id tellus. Mattis donec vitae egestas nibh sollicitudin adipiscing consequat aliquam. Blandit dis leo cursus augue nulla mollis erat. Urna, volutpat non sodales lacinia morbi non ut cursus. Elementum fusce netus lacus, a, accumsan"
                          "At id ut cras odio arcu vulputate. Pellentesque cursus odio bibendum sagittis. Nullam quis nunc consectetur dictum. Sed nibh urna, ullamcorper tortor enim pellentesque vel. Consectetur amet.",
                  Assets.latoRegular,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                  lines: 20),
            ],
          ).get20HorizontalPadding(),
        ),
      ),
    );
  }
}
