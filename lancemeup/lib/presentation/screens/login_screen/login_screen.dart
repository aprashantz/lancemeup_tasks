import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/login_form.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lancemeupColor,
        centerTitle: false,
        title: const CustomText(text: signinText, size: 18, isBold: true),
        leading: IconButton(
            icon: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: welcomeText, size: 20, isBold: true),
              const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: CustomText(text: "Login to your account")),
              const SizedBox(height: 24),
              const LoginForm(),
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: "Don't have an account?", size: 16),
                    TextButton(
                      onPressed: () {},
                      child: const CustomText(text: "Sign up", isBold: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
