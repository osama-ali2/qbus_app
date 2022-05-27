import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/ui/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      NavigationHelper.pushReplacement(context, const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
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
           child:  Container(
            height: 52,
            width: 185,
            child: Image.asset('assets/images/appicon.png'),
           ),
          ),
        ],
      );
}