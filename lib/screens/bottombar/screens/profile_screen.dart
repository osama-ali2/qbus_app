import 'package:flutter/material.dart';
import 'package:qbus/navigation/navigation_helper.dart';
import 'package:qbus/screens/auth/login_screens/login_screen.dart';
import 'package:qbus/screens/bottombar/screens/contact_us_screens/contact_us_screen.dart';

import '../../../utils/constant.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/setting_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const CustomText(
            text: "Profile",
            textSize: 18,
            fontWeight: FontWeight.w400,
            textColor: Colors.white),
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        //Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 15.0),
        // child: Container(
        //   height: 100,
        //   width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //     color: const Color(0xffE7E8E8),
        //   )),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children:  [
        //             const Icon(
        //               Icons.person_outline,
        //               color: Colors.grey,
        //               size: 26,
        //             ),
        //             const SizedBox(
        //               width: 5,
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: const [
        //                 CustomText(
        //                     text: "Abdelhadi Mohammed",
        //                     textSize: 15,
        //                     fontWeight: FontWeight.w400,
        //                     textColor: Colors.black),
        //                 SizedBox(
        //                   height: 5,
        //                 ),
        //                 CustomText(
        //                     text: "Male",
        //                     textSize: 15,
        //                     fontWeight: FontWeight.w400,
        //                     textColor: Colors.black),
        //                 SizedBox(
        //                   height: 5,
        //                 ),
        //                 CustomText(
        //                     text: "093138941",
        //                     textSize: 15,
        //                     fontWeight: FontWeight.w400,
        //                     textColor: Colors.black),
        //               ],
        //             )
        //           ],
        //         ),

        //       ],
        //     ),
        //   ),
        // ),
        //),
        // const SizedBox(
        //   height: 15,
        // ),
        SettingCard(
          onTap: () {},
          name: 'Booking History',
        ),
        SettingCard(
          onTap: () {},
          name: 'Wallet',
        ),
        SettingCard(
          onTap: () {},
          name: 'Full bus Reservation',
        ),
        SettingCard(
          onTap: () {},
          name: 'About us',
        ),
        SettingCard(
          onTap: () {},
          name: 'Privacy Policy',
        ),
        SettingCard(
          onTap: () {},
          name: 'Return Policy',
        ),
        SettingCard(
          onTap: () {
            NavigationHelper.pushRoute(context, const ContactUsScreen());
          },
          name: 'Contact us',
        ),
        SettingCard(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          },
          name: 'Logout',
        ),
      ],
    );
  }
}
