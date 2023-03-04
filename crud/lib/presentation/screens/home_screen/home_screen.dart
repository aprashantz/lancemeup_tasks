import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.logout),
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
                      ]),
                ),
              ),
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
