import 'package:firebase_chatting/screens/home/components/product.dart';
import 'package:firebase_chatting/screens/home/components/welcome_user.dart';
import 'package:firebase_chatting/screens/product/components/body.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../product/components/product_content.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'u_wallet.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            const welcomeUser(),
            const WalletBanner(),
            const DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            const ProductSlider()
          ],
        ),
      ),
    );
  }
}
