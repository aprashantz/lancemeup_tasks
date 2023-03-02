import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/home_screen/widgets/custom_tab.dart';
import 'package:lancemeup/presentation/screens/home_tab_pages/project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 1,
          child: TabBar(
            indicatorColor: lancemeupColor,
            labelColor: lancemeupColor,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              CustomTab(icon: CupertinoIcons.briefcase, label: "Project Tools"),
              CustomTab(icon: CupertinoIcons.chat_bubble_2, label: "Chat"),
              CustomTab(icon: CupertinoIcons.doc, label: "Drive "),
              CustomTab(icon: CupertinoIcons.gauge, label: "Tracking"),
              CustomTab(icon: CupertinoIcons.padlock, label: "Private")
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ProjectPage(),
              Center(child: Text('Tab 2')),
              Center(child: Text('Tab 3')),
              Center(child: Text('Tab 4')),
              Center(child: Text('Tab 5'))
            ],
          ),
        ),
      ],
    );
  }
}
