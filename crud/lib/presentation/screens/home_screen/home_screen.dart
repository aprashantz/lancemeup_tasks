import 'package:crud/business_logic/auth_bloc/auth_bloc.dart';
import 'package:crud/presentation/screens/home_screen/add_movie.dart';
import 'package:crud/presentation/screens/home_screen/delete_movie.dart';
import 'package:crud/presentation/screens/home_screen/update_movie.dart';
import 'package:crud/presentation/screens/home_screen/view_movies.dart';
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
                  }
                },
                child: clickedLogout
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.logout)),
            body: Column(children: [
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
                  child:
                      TabBarView(controller: _tabController, children: const [
                PostMovie(), // POST Request
                ViewMovies(), // GET Request
                UpdateMovie(), // PATCH Request
                DeleteMovie() // DELETE Request
              ]))
            ])));
  }
}
