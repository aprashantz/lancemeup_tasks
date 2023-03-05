import 'package:crud/business_logic/auth_bloc/auth_bloc.dart';
import 'package:crud/business_logic/crud_bloc/crud_bloc.dart';
import 'package:crud/constants/routes.dart';
import 'package:crud/presentation/screens/home_screen/home_screen.dart';
import 'package:crud/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRoutes _appRoutes = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (BuildContext context) =>
                  AuthBloc()..add(LoginCheckerEvent())),
          BlocProvider<CRUDBloc>(
              create: (BuildContext context) =>
                  CRUDBloc()..add(InitialCRUDEvent())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const AppEntry(),
            routes: {
              _appRoutes.loginScreen: (context) => const LoginScreen(),
              _appRoutes.homeScreen: (context) => const HomeScreen(),
            }));
  }
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    final state = authBloc.state;

    if (state is LoadingState) {
      return Material(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
            CircularProgressIndicator(),
            Text("Might take upto 30seconds to respond.")
          ])));
    } else if (state is LoggedInState) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
