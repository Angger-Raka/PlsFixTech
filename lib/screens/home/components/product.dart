import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_chatting/screens/product_form/product_form_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/components/default_button.dart';

class Product extends StatelessWidget {
  const Product({
    Key? key,
    required this.image,
    required this.name,
    required this.discription,
    required this.nameRoute,
  }) : super(key: key);

  final Image image;
  final String name;
  final String discription;
  final String nameRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
          width: 200,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: image,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(discription, textAlign: TextAlign.center),
                ),
              ),
              Spacer(),
              Container(
                height: 50,
                width: 200,
                child: DefaultButton(
                  text: "Order",
                  press: () {
                    Navigator.pushNamed(context, nameRoute);
                  },
                ),
              ),
              Spacer()
            ],
          )),
    );
  }
}

class ProductSlider extends StatefulWidget {
  const ProductSlider({Key? key}) : super(key: key);

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

int _currentIndex = 0;
List cardList = [
  Product(
    image: Image.asset(
      'assets/images/splash_1.png',
      height: 100,
    ),
    name: "Cleaning",
    discription:
        "layanan yang menyediakan membersihkan perangkat pelanggan dari debu dan kotoran yang dapat menyebabkan masalah teknis.",
    nameRoute: ProductFormScreen.routeName,
  ),
  Product(
    image: Image.asset(
      'assets/images/splash_2.png',
      height: 100,
    ),
    name: "Repair",
    discription:
        "layanan yang menyediakan perbaikan pada perangkat pelanggan yang rusak atau tidak berfungsi dengan baik.",
    nameRoute: ProductFormScreen.routeName,
  ),
  Product(
    image: Image.asset(
      'assets/images/splash_3.png',
      height: 100,
    ),
    name: "Upgrade",
    discription:
        "layanan yang menyediakan upgrade perangkat keras seperti menambahkan memory, hard drive, atau meng-upgrade komponen lainnya pada perangkat.",
    nameRoute: ProductFormScreen.routeName,
  ),
  Product(
    image: Image.asset(
      'assets/images/splash_2.png',
      height: 100,
    ),
    name: "Trade-in",
    discription:
        "layanan yang memungkinkan pelanggan untuk menukar perangkat lama mereka dengan perangkat baru.",
    nameRoute: ProductFormScreen.routeName,
  ),
];
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            'Our Services',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
            textAlign: TextAlign.start,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 239, 239, 239),
                    child: card,
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ]),
    );
  }
}
