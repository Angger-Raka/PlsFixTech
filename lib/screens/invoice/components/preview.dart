import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class preview_product extends StatelessWidget {
  const preview_product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset('assets/images/sampul_buku.jpg'),
      ),
    );
  }
}

class invoice_content extends StatelessWidget {
  const invoice_content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: const [
          TableRow(children: [
            Text('Spesifikasi'),
            Text('Jumlah'),
            Text('Total'),
          ]),
          TableRow(children: [
            Text('Cell 1'),
            Text('Cell 2'),
            Text('Cell 3'),
          ]),
          TableRow(children: [
            Text('Cell 1'),
            Text('Cell 2'),
            Text('Cell 3'),
          ]),
          TableRow(children: [
            Text('Cell 1'),
            Text('Cell 2'),
            Text('Cell 3'),
          ]),
        ],
      ),
    );
  }
}
