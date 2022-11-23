import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_chatting/screens/product_form/product_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      child: Container(
          width: 200,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: image,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(child: Text(discription)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, nameRoute);
                },
                child: const Text("PESAN SEKARANG"),
              ),
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
      width: 130,
    ),
    name: "PRODUCT 1",
    discription:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    nameRoute: ProductFormScreen.routeName,
  ),
  Product(
    image: Image.asset(
      'assets/images/splash_2.png',
      width: 130,
    ),
    name: "PRODUCT 2",
    discription:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    nameRoute: ProductFormScreen.routeName,
  ),
  Product(
    image: Image.asset(
      'assets/images/splash_3.png',
      width: 130,
    ),
    name: "PRODUCT 3",
    discription:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
      child: Column(children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
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
              return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
      ]),
    );
  }
}
