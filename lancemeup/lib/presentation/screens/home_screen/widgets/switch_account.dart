import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.person_2_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomText(
              text: currentUser,
              size: 14,
              isBold: true,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 25,
          )
        ],
      ),
    );
  }
}
