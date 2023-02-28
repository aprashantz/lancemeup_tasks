import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';

// this widget is responsible to build
// either bigger and green dot or smaller and grey dot
class Dot extends StatelessWidget {
  final int sliderAt;
  final int dotLocation;

  const Dot({super.key, required this.sliderAt, required this.dotLocation});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: sliderAt == dotLocation ? 12 : 7,
      backgroundColor: sliderAt == dotLocation ? lancemeupColor : Colors.grey,
    );
  }
}
