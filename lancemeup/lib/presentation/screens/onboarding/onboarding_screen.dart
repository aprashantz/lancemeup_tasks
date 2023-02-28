import 'package:flutter/material.dart';
import 'package:lancemeup/constants/routes.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';
import 'package:lancemeup/presentation/screens/onboarding/widgets/onboard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 58, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Onboard(),
            const SizedBox(height: 15),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    loginScreen,
                    (route) => false,
                  );
                },
                child: CustomText(text: "Skip", isBold: true))
          ],
        ),
      ),
    );
  }
}
