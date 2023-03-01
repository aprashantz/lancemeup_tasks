import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/home_screen/widgets/email_app_bar_item.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';
import 'switch_account.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int navAt;
  const CustomAppBar({super.key, required this.navAt});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      centerTitle: false,
      title: navAt == 0
          ? const SwitchAccount()
          : navAt == 2
              ? const EmailAppBarItem()
              : CustomText(
                  text: navAt == 1
                      ? "Search"
                      : navAt == 3
                          ? "Notification"
                          : "Profile",
                  isBold: true,
                  size: 18,
                ),
      actions: [
        navAt == 0 // for home
            ? IconButton(
                onPressed: () {}, icon: const Icon(Icons.search, size: 25))
            : navAt == 1 // for search
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search, size: 25))
                : navAt == 2 // for email
                    ? IconButton(
                        onPressed: () {},
                        icon: const CircleAvatar(
                          backgroundImage: AssetImage(legoImg),
                        ))
                    : navAt == 3 // for notification
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert, size: 25))
                        // for profile
                        : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
