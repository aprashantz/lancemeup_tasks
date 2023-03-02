class Notification {
  int id;
  String title;
  String type;
  bool markedRead;
  String timeStamp;

  Notification(
      {required this.id,
      required this.title,
      required this.type,
      required this.markedRead,
      required this.timeStamp});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      markedRead: json['marked_read'],
      timeStamp: json['time_stamp'],
    );
  }
}

class NotificationList {
  String msg;
  bool success;
  List<Notification> notifications;

  NotificationList(
      {required this.msg, required this.success, required this.notifications});

  factory NotificationList.fromJson(Map<String, dynamic> json) {
    var list = json['notifications'] as List;
    List<Notification> notificationList =
        list.map((i) => Notification.fromJson(i)).toList();
    return NotificationList(
      msg: json['msg'],
      success: json['success'],
      notifications: notificationList,
    );
  }
}
