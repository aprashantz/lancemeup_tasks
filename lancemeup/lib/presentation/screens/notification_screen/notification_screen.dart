import 'package:flutter/material.dart';
import 'package:lancemeup/constants/text_constants.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/presentation/screens/notification_screen/widgets/notification_tab.dart';
import 'package:lancemeup/presentation/screens/notification_screen/notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: lancemeupColor),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: const EdgeInsets.symmetric(vertical: 12),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          controller: _tabController,
          tabs: [
            NotificationTypeTab(label: notifTypes[0]),
            NotificationTypeTab(label: notifTypes[1]),
            NotificationTypeTab(label: notifTypes[2]),
            NotificationTypeTab(label: notifTypes[3]),
            NotificationTypeTab(label: notifTypes[4]),
            NotificationTypeTab(label: notifTypes[5]),
            NotificationTypeTab(label: notifTypes[6])
          ]),
      Expanded(
          child: TabBarView(controller: _tabController, children: [
        const Notifications(),
        Notifications(notificationType: notifTypes[1]),
        Notifications(notificationType: notifTypes[2]),
        Notifications(notificationType: notifTypes[3]),
        Notifications(notificationType: notifTypes[4]),
        Notifications(notificationType: notifTypes[5]),
        Notifications(notificationType: notifTypes[6]),
      ]))
    ]);
  }
}
