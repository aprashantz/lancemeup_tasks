import 'package:flutter/material.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class CustomTab extends StatelessWidget {
  final IconData icon;
  final String label;
  const CustomTab({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(children: [
      Icon(icon),
      const SizedBox(
        width: 10,
      ),
      CustomText(
        text: label,
        size: 12,
      )
    ]));
  }
}
