import 'package:flutter/material.dart';

class ContentInvoice extends StatelessWidget {
  const ContentInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Content Invoice',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            //make table 3x5
            SizedBox(
              height: 10,
            ),
            Table(
              border: TableBorder.all(),
              //make height 50 for each row
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(68),
                1: FixedColumnWidth(68),
                2: FixedColumnWidth(68),
                3: FixedColumnWidth(68),
                4: FixedColumnWidth(68),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border(
                      top: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                      left: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  children: [
                    Text('No'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                    Text('5'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                    Text('5'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                    Text('4'),
                    Text('5'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
