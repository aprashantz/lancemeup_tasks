import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class MenuTile extends StatelessWidget {
  final IconData leadIcon;
  final String title;
  final VoidCallback func;
  const MenuTile(
      {super.key,
      required this.leadIcon,
      required this.title,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadIcon),
      title: CustomText(text: title, size: 14),
      trailing: IconButton(
          iconSize: 15,
          onPressed: func,
          icon: const Icon(CupertinoIcons.right_chevron)),
    );
  }
}
