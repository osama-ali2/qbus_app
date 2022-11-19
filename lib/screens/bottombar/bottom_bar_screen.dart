import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qbus/screens/bottombar/bottom_bar_screens/booking_history_screens/booking_history_screen.dart';

import '../../utils/constant.dart';
import '../get_started_screens/get_started_screen.dart';
import 'bottom_bar_screens/profile_screens/profile_screen.dart';
import 'bottom_bar_screens/setting_screens/setting_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  List<Widget> _tabs = [];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      const GetStartedScreen(),
      const BookingHistoryScreen(),
      const ProfileScreen(),
      const SettingScreen()
    ];
    // EasyLocalization.of(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 28,
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.list,
                size: 28,
              ),
              label: AppLocalizations.of(context)!.history,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline,
                size: 28,
              ),
              label: AppLocalizations.of(context)!.profile,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                size: 28,
              ),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: appColor,
          onTap: (index) => _onItemTapped(index),
          selectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        body: _tabs[_selectedIndex],
      ),
    );
  }
}
