import 'package:flutter/material.dart';
import 'package:lancemeup/constants/routes.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';
import 'package:lancemeup/presentation/screens/onboarding/widgets/dots_collection.dart';
import 'package:lancemeup/presentation/screens/onboarding/widgets/onboard_info.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int sliderAt = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnboardInfo(sliderAt: sliderAt),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: SliderDots(sliderAt: sliderAt),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  sliderAt += 1;
                  if (sliderAt == 3) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, loginScreen, (route) => false);
                  }
                });
              },
              child: const CustomText(text: "Next")),
        ),
      ],
    );
  }
}
