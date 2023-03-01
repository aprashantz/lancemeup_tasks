class Inbox {
  final List<Email> emails;
  final bool success;
  final String message;

  Inbox({required this.emails, required this.success, required this.message});

  factory Inbox.fromJson(Map<String, dynamic> json) {
    var inboxJson = json['inbox'] as List;
    var emails = inboxJson.map((email) => Email.fromJson(email)).toList();

    return Inbox(
      emails: emails,
      success: json['success'],
      message: json['msg'],
    );
  }
}

class Email {
  final int id;
  final String profileIcon;
  final String emailSubject;
  final String body;
  final String date;
  final bool markedRead;
  bool markedFav;

  Email(
      {required this.id,
      required this.profileIcon,
      required this.emailSubject,
      required this.body,
      required this.date,
      required this.markedRead,
      required this.markedFav});

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
        id: json['id'],
        profileIcon: json['profile_icon'],
        emailSubject: json['email_subject'],
        body: json['body'],
        date: json['date'],
        markedRead: json['marked_read'],
        markedFav: json['marked_fav']);
  }
}
