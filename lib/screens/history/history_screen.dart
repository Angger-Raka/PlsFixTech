import 'package:firebase_chatting/enums.dart';
import 'package:firebase_chatting/screens/history/components/tab_dp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting/screens/history/components/body.dart';
import 'package:firebase_chatting/size_config.dart';

import '../../models/components/coustom_bottom_nav_bar.dart';
import 'components/tab_delivery.dart';
import 'components/tab_history.dart';
import 'components/tab_pending.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String routeName = "/history";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Products'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.pending_actions_outlined),
                ),
                Tab(
                  icon: Icon(Icons.monetization_on_outlined),
                ),
                Tab(
                  icon: Icon(Icons.delivery_dining_outlined),
                ),
                Tab(
                  icon: Icon(Icons.history_outlined),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TabPending(),
              TabNeedToPlay(),
              TabDelivery(),
              TabHistory(),
            ],
          ),
          bottomNavigationBar:
              const CustomBottomNavBar(selectedMenu: MenuState.history),
        ),
      ),
    );
  }
}
