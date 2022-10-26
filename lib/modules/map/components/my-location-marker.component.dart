import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyLocationMarker extends AnimatedWidget {
  const MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final size = 40.0;
    final newValue = lerpDouble(0.5, 1.0, value)!;
    return Stack(
      children: [
        Center(
            child: Container(
          height: size * newValue,
          width: size * newValue,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF3DC5A7).withOpacity(0.5)),
        )),
        Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0xFF3DC5A7),
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}
