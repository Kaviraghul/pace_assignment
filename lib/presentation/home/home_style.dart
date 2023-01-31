import 'package:flutter/material.dart';

abstract class HomeStyleAbstract {
  BoxDecoration animationBackDrop;
  HomeStyleAbstract(this.animationBackDrop);
}

class HomeStyle extends HomeStyleAbstract {
  HomeStyle(super.animationBackDrop);

  @override
  BoxDecoration get animationBackDrop => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.black
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.7, 0.9, 1],
        ),
      );
}
