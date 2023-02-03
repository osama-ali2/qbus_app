import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qbus/language.dart';
import 'package:qbus/utils/constant.dart';
import 'package:qbus/widgets/custom_text.dart';
import '../../../../local_cache/utils.dart';
import '../../../../widgets/text_views.dart';
import 'package:qbus/resources/resources.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: CustomText(
              text: AppLocalizations.of(context)!.settings,
              textSize: sizes!.fontRatio * 18,
              fontWeight: FontWeight.w700,
              textColor: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CommonPadding.sizeBoxWithHeight(height: 20),
            getRow(
              title: AppLocalizations.of(context)!.the_language,
              language: AppLocalizations.of(context)!.language,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget getRow({
    required String title,
    required String language,
    required Function? onPress,
  }) =>
      Container(
        height: sizes!.heightRatio * 42,
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
          padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView.getMediumText14(language, Assets.latoBold,
                  color: AppColors.black900,
                  fontWeight: FontWeight.w400,
                  lines: 1),
              CommonPadding.sizeBoxWithWidth(width: 10),
              const Spacer(),
              DropdownButton(
                onChanged: (language) {
                  _changeLanguage(language as Language);
                },
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.language,
                  size: 28,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>((language) =>
                        DropdownMenuItem(
                          value: language,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(language.flag),
                              Text(language.name),
                            ],
                          ),
                        ))
                    .toList(),
              ),
              GestureDetector(
                onTap: () {
                  _changeLanguage(language as Language);
                },
                child: SvgPicture.asset(
                  "assets/svg/forward_icon.svg",
                  width: sizes!.widthRatio * 24,
                  height: sizes!.heightRatio * 24,
                ),
              ),
            ],
          ),
        ),
      ).get20HorizontalPadding();

  /// Change Language
  void _changeLanguage(Language lang) {
    debugPrint("lang: ${lang.languageCode}");
    PreferenceUtils.setString(Strings.language, lang.languageCode);
  }
}
