import 'package:flutter/material.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class NotificationTypeTab extends StatelessWidget {
  final String label;
  const NotificationTypeTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: CustomText(text: label, size: 13),
      ),
    ));
  }
}
