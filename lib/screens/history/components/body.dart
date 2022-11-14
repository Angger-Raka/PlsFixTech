import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: const [
          product_history(
            status: 'Pengiriman',
          ),
          product_history(
            status: 'Pengiriman',
          ),
          product_history(
            status: 'Pengiriman',
          ),
          product_history(
            status: 'Pengiriman',
          ),
          product_history(
            status: 'Pengiriman',
          ),
        ],
      ),
    );
  }
}

class product_history extends StatelessWidget {
  const product_history({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange, width: 4),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.orange, width: 4)),
                ),
                child: Image.asset(
                  'assets/images/sampul_buku.jpg',
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
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12))),
                          child: const Padding(
                            padding: const EdgeInsets.only(
                                right: 8, left: 8, bottom: 5, top: 5),
                            child: Text(
                              "PENGIRIMAN",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        "Judul Buku",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Spesifikasi\nspesifikasi\nspesifikasi",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(color: Colors.orange, width: 4),
                                top:
                                    BorderSide(color: Colors.orange, width: 4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Rp. 5.000,-',
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
