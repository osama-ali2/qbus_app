import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/resources.dart';

class Loader {
  showLoader({
    BuildContext? context,
  }) {
    showDialog(
      context: context!,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: SizedBox(
              height: sizes!.height * 0.35,
              width: sizes!.width * 0.35,
              child: Lottie.asset(Assets.apiLoading),
            ),
          ),
        );
      },
    );
  }

  void hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
