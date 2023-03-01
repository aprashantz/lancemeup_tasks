import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/routes.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';
import 'widgets/logout_buttom_sheet.dart';
import 'widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Material(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(legoImg),
            ),
            title: CustomText(text: "Lancemeup", isBold: true),
            subtitle: CustomText(text: "admin@lancemeup.com", size: 12),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.online_prediction),
          title: const CustomText(text: "Set Status", size: 14),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            const Badge(backgroundColor: lancemeupColor),
            const SizedBox(width: 6),
            const CustomText(text: "Online", size: 12),
            IconButton(
                iconSize: 15,
                onPressed: () {},
                icon: const Icon(CupertinoIcons.right_chevron))
          ]),
        ),
        MenuTile(
            func: () {}, leadIcon: Icons.person_2_outlined, title: "Account"),
        MenuTile(func: () {}, leadIcon: Icons.access_time, title: "Activity"),
        Material(
            elevation: 1,
            child: MenuTile(
                func: () {},
                leadIcon: Icons.people_alt_outlined,
                title: "Connections")),
        const ListTile(title: CustomText(text: "App Settings", isBold: true)),
        MenuTile(
            leadIcon: Icons.notifications_none,
            title: "Notifications",
            func: () {}),
        Material(
          elevation: 1,
          child: ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: const CustomText(text: "Appearance"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomText(text: 'Light', size: 12),
                IconButton(
                    iconSize: 15,
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.right_chevron)),
              ],
            ),
          ),
        ),
        const ListTile(title: CustomText(text: "More", isBold: true)),
        MenuTile(
            leadIcon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            func: () {}),
        MenuTile(
            leadIcon: Icons.note_add_outlined,
            title: "Terms & Conditions",
            func: () {}),
        MenuTile(
            leadIcon: Icons.help_outline, title: "Help & Support", func: () {}),
        MenuTile(
            leadIcon: Icons.question_answer_outlined,
            title: "FAQ",
            func: () {}),
        const ListTile(title: CustomText(text: "Account", isBold: true)),
        ListTile(
          onTap: () async {
            bool? shouldLogout = await showLogoutBottomSheet(context);
            if (shouldLogout == true) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                loginScreen,
                (route) => false,
              );
            }
          },
          iconColor: Colors.red,
          textColor: Colors.red,
          leading: const Icon(Icons.logout),
          title: const CustomText(text: "Logout"),
        )
      ]),
    );
  }
}
