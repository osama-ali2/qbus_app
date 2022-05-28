import 'package:flutter/material.dart';
import 'package:qbus/ui/bottombar/screens/history_screen.dart';
import 'package:qbus/ui/bottombar/screens/home_screen.dart';
import 'package:qbus/ui/bottombar/screens/profile_screen.dart';
import 'package:qbus/ui/bottombar/screens/setting_screen.dart';

import '../../utils/constant.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
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
      const HomeScreen(),
      const HistoryScreen(),
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 28,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 28,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 28,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 28,
              ),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: appColor,
          onTap: (index) => _onItemTapped(index),
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        body: _tabs[_selectedIndex],
      ),
    );
  }
}
