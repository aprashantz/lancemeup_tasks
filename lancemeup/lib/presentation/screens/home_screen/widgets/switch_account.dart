import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/constants/value_constants.dart';

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(child: Image.asset(legoImg))),
          const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(currentUser,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))),
          const Icon(Icons.arrow_drop_down, size: 25)
        ],
      ),
    );
  }
}
