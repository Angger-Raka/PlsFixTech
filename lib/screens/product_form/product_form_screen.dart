import 'package:flutter/material.dart';

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
      body: const Body(),
    );
  }
}
