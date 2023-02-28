import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class OnboardInfo extends StatelessWidget {
  final int sliderAt;

  const OnboardInfo({super.key, required this.sliderAt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: const Color(0xFFD5DAE1),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 304,
              height: 400,
              child: Image(
                  image: AssetImage(sliderAt == 0
                      ? onboardImg0
                      : sliderAt == 1
                          ? onboardImg1
                          : onboardImg2))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: CustomText(
              text: sliderAt == 0
                  ? whatisTitle
                  : sliderAt == 1
                      ? aboutusTitle
                      : privacypolicyTitle,
              size: 24,
              isBold: true),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomText(
              text: sliderAt == 0
                  ? appDesc
                  : sliderAt == 1
                      ? aboutusDesc
                      : privacypolicyDesc),
        )
      ],
    );
  }
}
