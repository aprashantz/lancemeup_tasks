import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

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
      appBar: CustomAppBar(navAt: _navAt),
      floatingActionButton: _navAt == 2
          ? FloatingActionButton.extended(
              backgroundColor: lancemeupColor,
              onPressed: () {},
              label: const CustomText(
                text: composeText,
                size: 12,
              ),
              icon: const Icon(Icons.edit),
            )
          : null,
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
