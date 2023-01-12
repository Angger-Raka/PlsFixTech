import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chatting/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Get.snackbar(
                'Feature not available yet',
                'This feature is not available yet, please wait for the next update',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.orange,
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );
            },
          ),
          // ProfileMenu(
          //   text: "Notifications",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {
          //     Get.snackbar(
          //       'Feature not available yet',
          //       'This feature is not available yet, please wait for the next update',
          //       snackPosition: SnackPosition.TOP,
          //       backgroundColor: Colors.orange,
          //       colorText: Colors.white,
          //       duration: const Duration(seconds: 2),
          //     );
          //   },
          // ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {
          //     Get.snackbar(
          //       'Feature not available yet',
          //       'This feature is not available yet, please wait for the next update',
          //       snackPosition: SnackPosition.TOP,
          //       backgroundColor: Colors.orange,
          //       colorText: Colors.white,
          //       duration: const Duration(seconds: 2),
          //     );
          //   },
          // ),
          ProfileMenu(
            text: "About us",
            icon: "assets/icons/Question mark.svg",
            press: () {
              _launchUrl();
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Future.delayed(const Duration(seconds: 1), () {
                Get.snackbar(
                  'Logged out',
                  'Thank you for using our app',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 5),
                );
              });
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, SignInScreen.routeName, ((route) => false));
            },
          ),
        ],
      ),
    );
  }
}

final Uri url = Uri.parse('https://github.com/Angger-Raka');

Future<void> _launchUrl() async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
