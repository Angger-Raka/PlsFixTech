import 'package:flutter/material.dart';
import 'package:firebase_chatting/models/components/coustom_bottom_nav_bar.dart';
import 'package:firebase_chatting/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
