import 'package:flutter/material.dart';
import 'package:lancemeup/presentation/screens/onboarding/widgets/slider_dot.dart';

class SliderDots extends StatelessWidget {
  final int sliderAt;
  const SliderDots({super.key, required this.sliderAt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Dot(sliderAt: sliderAt, dotLocation: 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Dot(sliderAt: sliderAt, dotLocation: 1),
        ),
        Dot(sliderAt: sliderAt, dotLocation: 2)
      ],
    );
  }
}
