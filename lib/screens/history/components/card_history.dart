import 'package:flutter/material.dart';
import 'package:get/get.dart';

class product_history extends StatelessWidget {
  const product_history({
    Key? key,
    required this.name,
    required this.status,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final String status;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    Color colors = Colors.orange;
    if (status == 'Pending') {
      colors = const Color.fromARGB(255, 120, 120, 120);
    } else if (status == 'Need to pay') {
      colors = Colors.blue;
    } else if (status == 'Delivered' || status == 'On Process') {
      colors = Colors.orange;
    } else if (status == 'Canceled') {
      colors = Colors.red;
    } else if (status == 'History') {
      colors = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {
          Get.toNamed('/invoice', arguments: {
            'name': name,
            'status': status,
            'description': description,
            'price': price,
            'image': image,
          });
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: colors, width: 4),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: colors, width: 4)),
                ),
                child: Image.network(
                  image,
                  width: 100,
                  height: 125,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          decoration: BoxDecoration(
                              color: colors,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, bottom: 5),
                            child: Text(
                              status,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          description,
                          // overflow: TextOverflow.clip,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: colors, width: 4),
                                  top: BorderSide(color: colors, width: 4)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                price.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
