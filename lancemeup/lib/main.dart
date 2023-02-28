import 'package:flutter/material.dart';
import 'package:lancemeup/constants/routes.dart';
import 'package:lancemeup/presentation/screens/home_screen/home_screen.dart';
import 'package:lancemeup/presentation/screens/login_screen/login_screen.dart';
import 'package:lancemeup/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:lancemeup/presentation/theme/dark_theme.dart';
import 'package:lancemeup/presentation/theme/light_theme.dart';

void main() {
  runApp(const LanceMeUp());
}

class LanceMeUp extends StatelessWidget {
  const LanceMeUp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LanceMeUp',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        loginScreen: (context) => const LoginScreen(),
        onboardingScreen: (context) => const OnboardingScreen(),
        home: (context) => const HomeScreen(),
      },

      // as this is just a UI demo app, there is no need to check whether the user is logged in or not
      // and take user to either to dashboard or to login screen based on available user credentials
      // so will take user to onboarding screen, login screen and to dashboard
      home: const OnboardingScreen(),
    );
  }
}
