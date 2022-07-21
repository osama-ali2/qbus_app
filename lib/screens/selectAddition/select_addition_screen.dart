import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/res/res.dart';
import 'package:qbus/screens/selectAddition/select_addition_provider.dart';
import 'package:qbus/widgets/counter.dart';
import 'package:qbus/widgets/custom_button.dart';

import '../../../../utils/constant.dart';
import '../../../../widgets/custom_text.dart';
import '../../local_cache/utils.dart';
import '../../res/strings.dart';
import '../auth/login_screens/login_screen.dart';

class SelectAdditionScreen extends StatefulWidget {
  final String? tripId;

  const SelectAdditionScreen({Key? key, this.tripId}) : super(key: key);

  @override
  State<SelectAdditionScreen> createState() => _SelectAdditionScreenState();
}

class _SelectAdditionScreenState extends State<SelectAdditionScreen> {
  int hotel = 0;
  int chicken = 0;
  int water = 0;

  int currentIndex = 0;

  late SelectAdditionProvider selectAdditionProvider;

  @override
  void initState() {
    super.initState();
    selectAdditionProvider = SelectAdditionProvider();
    selectAdditionProvider =
        Provider.of<SelectAdditionProvider>(context, listen: false);
    selectAdditionProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectAdditionProvider.getAdditionalData(id: widget.tripId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SelectAdditionProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: sizes!.heightRatio * 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomButton(
                name: "Save Trip",
                buttonColor: appColor,
                height: sizes!.heightRatio * 45,
                width: double.infinity,
                textSize: sizes!.fontRatio * 14,
                textColor: Colors.white,
                fontWeight: FontWeight.w500,
                borderRadius: 5,
                onTapped: () async {
                  await callOrderTrip();
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
                                builder: (context) => const LoginScreen()));
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
            text: "Trip Select Additions",
            textSize: sizes!.fontRatio * 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: selectAdditionProvider.isTripLoaded == true
          ? ListView.builder(
              itemCount: selectAdditionProvider
                  .tripAdditionalsResponse.data!.additional!.length,
              itemBuilder: (context, index) {
                currentIndex = index;
                var name = selectAdditionProvider
                    .tripAdditionalsResponse.data!.additional![index].name!.en
                    .toString();
                return itemContainer(name: name, index: index);
              })
          : const Center(
              child: Text("No Data Available"),
            ),
    );
  }

  Future<void> callOrderTrip() async {
    await selectAdditionProvider.roundOrderTrip();
    await selectAdditionProvider.multiOrderTrip();
  }

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
                    selectAdditionProvider.selectAdditionalList[index]++;
                    setState(() {});
                  },
                  minus: () {
                    if (selectAdditionProvider.selectAdditionalList[index] >
                        0) {
                      selectAdditionProvider.selectAdditionalList[index]--;
                      setState(() {});
                    }
                  },
                  number: selectAdditionProvider.selectAdditionalList[index])
              : _items(
                  context: context,
                  name: name,
                  add: () {},
                  minus: () {},
                  number: 0),
        ],
      );

  Widget _items(
      {required BuildContext context,
      required String name,
      required Function add,
      required Function minus,
      required int number}) {
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
