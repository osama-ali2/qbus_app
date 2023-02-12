import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qbus/resources/resources.dart';

class Toasts {
  static getErrorToast({@required String? text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "Please try again Toasts",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }

  static getSuccessToast({@required String? text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "Please try again Toasts",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }

  static getWarningToast({@required String? text}) async {
    await Fluttertoast.showToast(
        msg: text ?? "Please try again Toasts.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0);
  }
}
