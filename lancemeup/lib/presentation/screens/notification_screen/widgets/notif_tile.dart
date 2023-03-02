import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String type;
  final bool markedRead;
  final String timeStamp;
  const NotificationTile(
      {super.key,
      required this.title,
      required this.type,
      required this.markedRead,
      required this.timeStamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: lancemeupColor,
            radius: 24,
            child: Icon(type == "Invites"
                ? Icons.handshake
                : type == "Mentions"
                    ? CupertinoIcons.at
                    : type == "Workspace"
                        ? Icons.people_alt_outlined
                        : type == "Emails"
                            ? Icons.email_outlined
                            : type == "Downloads"
                                ? Icons.download_outlined
                                : CupertinoIcons.time),
          ),
          title: CustomText(text: title, size: 14),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomText(text: timeStamp, size: 12),
          ),
          trailing: !markedRead
              ? const Badge(
                  backgroundColor: lancemeupColor,
                )
              : null,
        ),
      ),
    );
  }
}
