import 'package:crud/business_logic/auth_bloc/auth_bloc.dart';
import 'package:crud/presentation/screens/home_screen/home_screen.dart';
import 'package:crud/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final TextFieldValidator _textFieldValidator = TextFieldValidator();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoadingState) {
        return Material(
            child: Center(
                child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Might take upto 30seconds to respond.")
          ],
        )));
      } else if (state is LoggedInState) {
        return const HomeScreen();
      } else if (state is ErrorState) {
        Fluttertoast.showToast(msg: state.message!);
      }
      return Material(
          child: Form(
              key: _loginKey,
              child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                            controller: _emailField,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return _textFieldValidator.emailValidator(value!);
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(CupertinoIcons.mail))),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return _textFieldValidator
                                .passwordValidator(value!);
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(CupertinoIcons.padlock)),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              if (_loginKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(LoginClickedEvent(
                                    email: _emailField.text,
                                    password: _passwordField.text));
                              }
                            },
                            child: const Text("Login")),
                        const Text("Email: admin@admin.com"),
                        const Text("Password: admin123"),
                        const Text("Used free backend hosting service."),
                        const Text("So, might take upto 30seconds to respond.")
                      ]))));
    });
  }
}
