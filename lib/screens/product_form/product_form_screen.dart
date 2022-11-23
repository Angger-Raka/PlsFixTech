import 'package:flutter/material.dart';
import 'package:firebase_chatting/models/components/coustom_bottom_nav_bar.dart';
import 'package:firebase_chatting/enums.dart';

import 'components/body.dart';

class ProductFormScreen extends StatelessWidget {
  static String routeName = "/product_form";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Product Form"),
      ),
      body: Body(),
    );
  }
}
