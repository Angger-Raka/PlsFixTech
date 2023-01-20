import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class PreviewProduct extends StatelessWidget {
  const PreviewProduct({superKey}) : super(key: superKey);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
        ),
        //make image Part of the screen
        child: PinchZoom(
          child: Image.network(
            'https://placekitten.com/640/500',
            height: 300,
          ),
          resetDuration: const Duration(milliseconds: 100),
          maxScale: 2.5,
          onZoomStart: () {
            print('Start zooming');
          },
          onZoomEnd: () {
            print('Stop zooming');
          },
        ),
      ),
    );
  }
}
