import 'package:flutter/material.dart';

class HomeStyle {
  BoxDecoration animationBackDrop = const BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.transparent, Colors.black, Colors.black, Colors.black],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 0.7, 0.9, 1],
    ),
  );
}
