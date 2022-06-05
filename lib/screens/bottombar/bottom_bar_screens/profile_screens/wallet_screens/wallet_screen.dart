import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/extensions.dart';

import '../../../../../res/colors.dart';
import '../../../../../res/common_padding.dart';
import '../../../../../res/res.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widgets/custom_text.dart';
import 'wallet_provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late WalletProvider changePasswordProvider;

  @override
  void initState() {
    super.initState();
    changePasswordProvider = WalletProvider();
    changePasswordProvider =
        Provider.of<WalletProvider>(context, listen: false); //Read
    changePasswordProvider.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WalletProvider>(context, listen: true); //Watch
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          elevation: 0,
          title: const CustomText(
              text: "Wallet",
              textSize: 18,
              fontWeight: FontWeight.w700,
              textColor: Colors.white),
        ),
        body: Container(
          color: AppColors.white,
          height: sizes!.height,
          width: sizes!.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonPadding.sizeBoxWithHeight(height: 20),
              Container(
                height: sizes!.heightRatio * 150,
                width: sizes!.widthRatio * 335,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizes!.widthRatio * 10,
                      vertical: sizes!.widthRatio * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                          text: "My Balance",
                          textSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.black),
                      CommonPadding.sizeBoxWithHeight(height: 10),
                      const CustomText(
                          text: "SAR 25.00 ",
                          textSize: 40,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.black),
                    ],
                  ),
                ),
              ).get20HorizontalPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
