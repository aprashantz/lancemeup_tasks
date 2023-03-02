import 'package:flutter/material.dart';
import 'package:lancemeup/data/data_repository/get_data.dart';
import 'package:lancemeup/data/models/notification.dart';
import 'package:lancemeup/presentation/screens/notification_screen/widgets/notif_tile.dart';

class Notifications extends StatefulWidget {
  final String notificationType;
  const Notifications({super.key, this.notificationType = "All"});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<NotificationList> _notifications;
  @override
  void initState() {
    super.initState();
    _notifications = fetchNotifications(widget.notificationType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NotificationList>(
        future: _notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data!.notifications.isNotEmpty) {
            final notifs = snapshot.data!;
            return ListView.builder(
                itemCount: notifs.notifications.length,
                itemBuilder: (context, index) {
                  final notif = notifs.notifications[index];
                  return NotificationTile(
                      title: notif.title,
                      type: notif.type,
                      markedRead: notif.markedRead,
                      timeStamp: notif.timeStamp);
                });
          } else {
            return const Center(
              child: Text('No notifications for now'),
            );
          }
        });
  }
}
