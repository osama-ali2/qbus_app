// Created by Tayyab Mughal on 14/12/2022.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qbus/local_cache/utils.dart';
import 'package:qbus/res/strings.dart';
import 'package:qbus/widgets/loader.dart';

class ReviewOrderProvider with ChangeNotifier {
  var userToken = PreferenceUtils.getString(Strings.loginUserToken);
  BuildContext? context;
  final _logger = Logger();
  final _loader = Loader();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }
}
