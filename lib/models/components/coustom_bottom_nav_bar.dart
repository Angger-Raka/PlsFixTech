import 'package:firebase_chatting/screens/history/history_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_chatting/screens/home/home_screen.dart';
import 'package:firebase_chatting/screens/profile/profile_screen.dart';
import 'package:firebase_chatting/screens/chat/chat_screen.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    // Navigator.pushNamed(context, HomeScreen.routeName),
                    Get.toNamed(HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: MenuState.message == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    // Navigator.pushNamed(context, ChatScreen.routeName),
                    Get.toNamed(ChatScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: MenuState.history == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    // Navigator.pushNamed(context, HistoryScreen.routeName),
                    Get.toNamed(HistoryScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed(ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
