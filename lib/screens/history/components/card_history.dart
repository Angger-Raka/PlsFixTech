import 'package:flutter/material.dart';

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
    } else if (status == 'Completed') {
      colors = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {},
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
                  height: 140,
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
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, bottom: 5),
                            child: Text(
                              status,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      height: 62,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          description,
                          // overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(color: colors, width: 4),
                                top: BorderSide(color: colors, width: 4)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              price.toString(),
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          )),
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
