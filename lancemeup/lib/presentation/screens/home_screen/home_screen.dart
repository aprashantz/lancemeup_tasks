import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/home_screen/widgets/switch_account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navAt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const SwitchAccount(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 25))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navAt,
          onTap: (index) => setState(() => _navAt = index),
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: _navAt == 2 ? false : true,
                backgroundColor: lancemeupColor,
                label: const Text("3"),
                child: const Icon(
                  Icons.email_outlined,
                ),
              ),
              label: 'Email',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_outlined,
              ),
              label: 'Notification',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
