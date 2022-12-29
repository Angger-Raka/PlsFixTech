import 'package:flutter/material.dart';

import '../../../size_config.dart';

class WalletBanner extends StatelessWidget {
  const WalletBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 90,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: getProportionateScreenWidth(15),
            right: getProportionateScreenWidth(15),
            left: getProportionateScreenWidth(15)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF6625E),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            WalletDisplay(),
            WalletOptions(
              icon: Icons.upload,
              title: 'Pay',
            ),
            WalletOptions(icon: Icons.add, title: 'Top Up'),
            WalletOptions(icon: Icons.more_horiz, title: 'More')
          ],
        ));
  }
}

class WalletOptions extends StatelessWidget {
  const WalletOptions({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class WalletDisplay extends StatelessWidget {
  const WalletDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 6, bottom: 4, top: 4),
            child: Text(
              'U-Wallet',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(
              'Rp. 5000',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, bottom: 2),
            child: Text(
              'Tap to TopUp',
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
