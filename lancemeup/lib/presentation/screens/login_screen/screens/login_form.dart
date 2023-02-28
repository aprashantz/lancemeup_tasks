import 'package:flutter/material.dart';
import 'package:lancemeup/business_logic/textfield_validators.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hidePassword = true;
  bool _rememberPassword = true;
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailField.dispose();
    _passwordField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: CustomText(text: "Email"),
            ),
            TextFormField(
              controller: _emailField,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => TextFieldValidator.emailValidator(value),
              decoration: const InputDecoration(
                  hintText: "example@lancemeup.com",
                  border: OutlineInputBorder()),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: CustomText(text: "Password")),
            TextFormField(
              controller: _passwordField,
              obscureText: _hidePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => TextFieldValidator.passwordValidator(value),
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_outlined))),
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Checkbox(
                      activeColor: lancemeupColor,
                      value: _rememberPassword,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberPassword = value!;
                        });
                      },
                    ),
                    CustomText(text: "Remember me", size: 14),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                            text: "Forgot Password?", isBold: true, size: 14))
                  ],
                )
              ],
            ),
            const SizedBox(height: 259),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  onPressed: () => _loginKey.currentState!.validate()
                      ? print("valud")
                      : print("invalid"),
                  child: CustomText(text: "Login")),
            ),
          ],
        ),
      ),
    );
  }
}
