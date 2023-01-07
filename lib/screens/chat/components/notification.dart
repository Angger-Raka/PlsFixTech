import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NotificationListSlider extends StatelessWidget {
  const NotificationListSlider({superKey}) : super(key: superKey);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final getSender = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _orderStream = firestore
        .collection('User')
        .doc(getSender)
        .collection('Product')
        .orderBy('time', descending: true)
        .snapshots();

    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 8, left: 12),
      child: Container(
        height: 130,
        child: StreamBuilder<QuerySnapshot>(
            stream: _orderStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return CarouselSlider(
                options: CarouselOptions(
                  height: 140,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  if (data['status'] == 'Pending' ||
                      data['status'] == 'Delivered' ||
                      data['status'] == 'Need to pay') {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotoficationCard(
                        name: data['product'],
                        status: data['status'],
                        description: data['description'],
                        price: data['price'],
                        image: data['image'].toString(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              );
            }),
      ),
    );

    //Container(
    //   height: 100,
    //   decoration: BoxDecoration(
    //     color: Colors.red,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    // ),
  }
}

class NotoficationCard extends StatelessWidget {
  const NotoficationCard({
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
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
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
                  height: 130,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
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
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
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
                                '\$ ' + price.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            )),
                      ),
                    ),
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
