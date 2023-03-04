import 'package:crud/business_logic/auth_bloc/auth_bloc.dart';
import 'package:crud/constants/routes.dart';
import 'package:crud/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool clickedLogout = false;
  final UserAuth _userAuth = UserAuth();
  final AppRoutes _appRoutes = AppRoutes();

  Future<bool> signedOut() async {
    setState(() {
      clickedLogout = true;
    });
    await _userAuth.deleteAccessToken();
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (await signedOut()) {
                authBloc.add(InitialEvent());
                Navigator.pushNamedAndRemoveUntil(
                    context, _appRoutes.loginScreen, (route) => false);
              }
            },
            child: clickedLogout
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Icon(Icons.logout),
          ),
          body: Column(
            children: [
              Material(
                  elevation: 1,
                  child: SizedBox(
                      height: 50,
                      child: TabBar(
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          controller: _tabController,
                          tabs: const [
                            Text("Create"),
                            Text("Read"),
                            Text("Update"),
                            Text("Delete")
                          ]))),
              Expanded(
                  child: TabBarView(controller: _tabController, children: [
                Center(child: Text('Tab 1')),
                Center(child: Text('Tab 2')),
                Center(child: Text('Tab 3')),
                Center(child: Text('Tab 4')),
              ]))
            ],
          )),
    );
  }
}
