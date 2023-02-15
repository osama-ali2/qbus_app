import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../local_cache/utils.dart';
import '../../../../resources/strings.dart';

class SettingSelectLangProvider with ChangeNotifier {
  BuildContext? context;
  final Logger _logger = Logger();
  String? lang = PreferenceUtils.getString(Strings.language);


  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }
  String getLang(){
    if(lang!=null && lang!.isNotEmpty){
      return lang!;
    }else{
      return 'ar';
    }
  }
  changeLang(String lang){
    print("Prov $lang");
    this.lang = lang;
    notifyListeners();
  }
}
