import 'package:firebase_chatting/enums.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/screens/history/components/body.dart';
import 'package:firebase_chatting/size_config.dart';

import '../../models/components/coustom_bottom_nav_bar.dart';

class HistoryScreen extends StatelessWidget {
  static String routeName = "/history";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "History",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.history),
    );
  }
}
