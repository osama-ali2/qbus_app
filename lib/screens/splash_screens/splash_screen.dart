import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qbus/screens/splash_screens/splash_provider.dart';
import 'package:qbus/widgets/loader.dart';

import '../../res/res.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider splashProvider;

  @override
  void initState() {
    super.initState();
    splashProvider = SplashProvider();
    splashProvider = Provider.of<SplashProvider>(context, listen: false);
    splashProvider.init(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Loader().showLoader(context: context);
      splashProvider.navigateToNextScreen(context: context);
    });
    // Timer(const Duration(seconds: 3), () {
    //   NavigationHelper.pushReplacement(context, const GetStartedScreen());
    // });
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    Provider.of<SplashProvider>(context, listen: true);
    return Scaffold(
      body: _getUI(context),
      backgroundColor: Colors.white,
    );
  }
}

Widget _getUI(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: SizedBox(
          height: 52,
          width: 185,
          child: Image.asset('assets/images/appicon.png'),
        ),
      ),
    ],
  );
}
