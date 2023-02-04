import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/resources/resources.dart';

import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../../local_cache/utils.dart';
import '../../auth/login_screens/login_screen.dart';
import 'package_select_addition_provider.dart';

class PackageSelectAdditionScreen extends StatefulWidget {
  final String? packageId;

  const PackageSelectAdditionScreen({Key? key, this.packageId})
      : super(key: key);

  @override
  State<PackageSelectAdditionScreen> createState() =>
      _PackageSelectAdditionScreenState();
}

class _PackageSelectAdditionScreenState
    extends State<PackageSelectAdditionScreen> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;
  int currentIndex = 0;

  late PackageSelectAdditionProvider packageSelectAdditionProvider;

  @override
  void initState() {
    super.initState();
    packageSelectAdditionProvider = PackageSelectAdditionProvider();
    packageSelectAdditionProvider =
        Provider.of<PackageSelectAdditionProvider>(context, listen: false);
    packageSelectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageSelectAdditionProvider.getAdditionalData(id: widget.packageId!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PackageSelectAdditionProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: sizes!.heightRatio * 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomButton(
                name: "PROCEED TO PAYMENT",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () {
                  Toasts.getErrorToast(text: "Try it Later");
                },
                padding: 20),
            const SizedBox(
              height: 10,
            ),
            (PreferenceUtils.getString(Strings.loginEmail)!.isNotEmpty &&
                    PreferenceUtils.getString(Strings.loginUserToken)!
                        .isNotEmpty)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Container(
                        height: sizes!.heightRatio * 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appColor)),
                        child: Center(
                          child: CustomText(
                              text: "Continue",
                              textSize: sizes!.fontRatio * 15,
                              fontWeight: FontWeight.w500,
                              textColor: appColor),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        centerTitle: false,
        title: CustomText(
            text: "Package Select Additions",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: packageSelectAdditionProvider.isPackageLoaded == true
          ? SafeArea(
              child: ListView.builder(
                  itemCount: packageSelectAdditionProvider
                      .packageAdditionalsResponse.data!.additional!.length,
                  itemBuilder: (context, index) {
                    currentIndex = index;
                    // var name = packageSelectAdditionProvider
                    //     .packageAdditionalsResponse
                    //     .data!
                    //     .additional![index]
                    //     .name!
                    //     .en
                    //     .toString();

                    var name = packageSelectAdditionProvider
                        .packageAdditionalsResponse
                        .data!
                        .additional![index]
                        .name!
                        .ar
                        .toString();
                    return itemContainer(name: name, index: index);
                  }),
            )
          : const Center(
              child: Text("No Data Available"),
            ),
    );
  }

  /// Item Container
  Widget itemContainer({required String name, required int index}) => Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          currentIndex == index
              ? _items(
                  context: context,
                  name: name,
                  add: () {
                    packageSelectAdditionProvider
                        .packageSelectAdditionalList[index]++;
                    setState(() {});
                  },
                  minus: () {
                    if (packageSelectAdditionProvider
                            .packageSelectAdditionalList[index] >
                        0) {
                      packageSelectAdditionProvider
                          .packageSelectAdditionalList[index]--;
                      setState(() {});
                    }
                  },
                  number: packageSelectAdditionProvider
                      .packageSelectAdditionalList[index])
              : _items(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0),
        ],
      );

  /// Items
  Widget _items({
    required BuildContext context,
    required String name,
    required Function add,
    required Function minus,
    required int number,
  }) {
    return Container(
      height: sizes!.heightRatio * 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: name,
                textSize: sizes!.fontRatio * 16,
                fontWeight: FontWeight.normal,
                textColor: const Color(0xff747268)),
            Counter(number: number, onAdd: () => add(), onMinus: () => minus())
          ],
        ),
      ),
    ).get20HorizontalPadding();
  }
}
