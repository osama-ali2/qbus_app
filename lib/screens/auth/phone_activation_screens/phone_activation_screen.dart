import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:qbus/res/colors.dart';
import 'package:qbus/res/extensions.dart';
import 'package:qbus/screens/auth/phone_activation_screens/phone_activation_provider.dart';

import '../../../navigation/navigation_helper.dart';
import '../../../res/assets.dart';
import '../../../res/common_padding.dart';
import '../../../res/res.dart';
import '../../../res/toasts.dart';
import '../../../utils/constant.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_views.dart';
import '../../bottombar/bottom_bar_screen.dart';

class PhoneActivationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PhoneActivationScreen({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<PhoneActivationScreen> createState() => _PhoneActivationScreenState();
}

class _PhoneActivationScreenState extends State<PhoneActivationScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController codeController;
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  bool showError = false;

  // CustomTimerController _timerController = CustomTimerController();
  bool isTimerEnded = false;
  int beginMinute = 1;
  int beginSecond = 30;
  int endMinute = 0;
  int endSecond = 0;

  late CustomTimerController _timerController;

  late PhoneActivationProvider phoneActivationProvider;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();

    phoneActivationProvider = PhoneActivationProvider();
    phoneActivationProvider =
        Provider.of<PhoneActivationProvider>(context, listen: false);
    phoneActivationProvider.init(context: context);

    _timerController = CustomTimerController(
      begin: Duration(minutes: beginMinute, seconds: beginSecond),
      end: Duration(minutes: endMinute, seconds: endSecond),
      initialState: CustomTimerState.counting,
      interval: CustomTimerInterval.milliseconds,
      vsync: this,
    );

    // _timerController.start();
  }

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
    focusNode.dispose();
    _timerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PhoneActivationProvider>(context, listen: true);
    const length = 4;
    const borderColor = AppColors.primary;
    const errorColor = AppColors.error400;
    final defaultPinTheme = PinTheme(
      width: sizes!.widthRatio * 48,
      height: sizes!.heightRatio * 48,
      textStyle: GoogleFonts.poppins(
        fontSize: sizes!.fontRatio * 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
    );

    final followingPinTheme = PinTheme(
      width: sizes!.widthRatio * 48,
      height: sizes!.heightRatio * 48,
      textStyle: GoogleFonts.poppins(
        fontSize: sizes!.fontRatio * 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        // color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray100, width: 1),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          width: sizes!.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonPadding.sizeBoxWithHeight(height: 90),
                Center(child: Image.asset("assets/png/main_logo.png")),
                CommonPadding.sizeBoxWithHeight(height: 30),
                Center(
                  child: TextView.getMediumText16(
                      AppLocalizations.of(context)!.enter_verification_code +
                          "${widget.phoneNumber}",
                      Assets.latoBold,
                      color: AppColors.black900,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                      lines: 4),
                ).get20HorizontalPadding(),
                CommonPadding.sizeBoxWithHeight(height: 20),
                Pinput(
                  length: length,
                  controller: codeController,
                  pinAnimationType: PinAnimationType.scale,
                  focusNode: focusNode,
                  followingPinTheme: followingPinTheme,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    setState(() => showError = pin != '5555');
                  },
                  onSubmitted: (pin) {
                    debugPrint("Successful :$pin");
                    Toasts.getSuccessToast(
                        text:
                            AppLocalizations.of(context)!.successful + "$pin");
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: sizes!.fontRatio * 58,
                    width: sizes!.fontRatio * 58,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                CommonPadding.sizeBoxWithHeight(height: 20),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 110),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isTimerEnded = false;
                            _timerController.reset();
                            _timerController.start();
                          });
                        },
                        child: TextView.getMediumText14(
                            "Resend Code", Assets.latoBold,
                            color: AppColors.black900,
                            fontWeight: FontWeight.w400,
                            lines: 1),
                      ),
                      CommonPadding.sizeBoxWithWidth(width: 2),
                      _getTimerText(),
                    ],
                  ),
                ),
                // CommonPadding.sizeBoxWithHeight(height: 20),
                // Center(
                //   child: TextView.getMediumText14("Edit Number", Assets.latoBold,
                //       color: AppColors.primary,
                //       fontWeight: FontWeight.w700,
                //       lines: 1),
                // ),
                CommonPadding.sizeBoxWithHeight(height: 50),
                CustomButton(
                    name: "Finish",
                    buttonColor: appColor,
                    height: sizes!.heightRatio * 45,
                    width: double.infinity,
                    textSize: sizes!.fontRatio * 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    borderRadius: 5,
                    onTapped: () {
                      validateData();
                    },
                    padding: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTimerText() {
    return CustomTimer(
      controller: _timerController,
      builder: (CustomTimerState state, CustomTimerRemainingTime time) {
        if (state == CustomTimerState.finished) {
          debugPrint("isTimerEnded: $isTimerEnded");
          isTimerEnded = true;
        }
        if (state == CustomTimerState.finished) {
          Toasts.getSuccessToast(text: "Timer End");
          isTimerEnded = true;
          debugPrint("Current state: $state");
        }
        return TextView.getMediumText14(
            "${time.minutes}:${time.seconds}", Assets.latoBold,
            color: AppColors.primary, lines: 1, fontWeight: FontWeight.w500);
      },
    );

    // return CustomTimer(
    //     controller: _timerController,
    //     begin: Duration(minutes: beginMinute, seconds: beginSecond),
    //     end: Duration(minutes: endMinute, seconds: endSecond),
    //     onChangeState: (state) {
    //       if (state == CustomTimerState.finished) {
    //         debugPrint("isTimerEnded: $isTimerEnded");
    //         isTimerEnded = true;
    //       }
    //       debugPrint("Current state: $state");
    //     },
    //     stateBuilder: (time, state) {
    //       if (state == CustomTimerState.finished) {
    //         Toasts.getSuccessToast(text: "Timer End");
    //         isTimerEnded = true;
    //       }
    //       // return null;
    //     },
    //     builder: (time) {
    //       return TextView.getMediumText14(
    //           "${time.minutes}:${time.seconds}", Assets.latoBold,
    //           color: AppColors.primary, lines: 1, fontWeight: FontWeight.w500);
    //     });
  }

  Future<void> validateData() async {
    var code = codeController.text.toString().trim();
    if (code.isNotEmpty) {
      await phoneActivationProvider.verifyPhoneNumber(code: code);
      if (phoneActivationProvider.isDataLoaded) {
        if (!mounted) return;
        NavigationHelper.pushReplacement(context, const BottomBarScreen());
      }
    } else if (code.isEmpty) {
      Toasts.getErrorToast(text: AppLocalizations.of(context)!.required_fields);
    }
  }
}
