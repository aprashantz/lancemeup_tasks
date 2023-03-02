import 'package:flutter/material.dart';
import 'package:lancemeup/data/data_repository/get_data.dart';
import 'package:lancemeup/data/models/inbox.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

import 'widgets/email_text.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late Future<Inbox> _inboxFuture;
  @override
  void initState() {
    super.initState();
    _inboxFuture = fetchInbox();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<Inbox>(
      future: _inboxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data!.emails.isNotEmpty) {
          final inbox = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: CustomText(text: "All Inbox"),
              ),
              SizedBox(
                height: size.height * 0.72,
                child: ListView.builder(
                  itemCount: inbox.emails.length,
                  itemBuilder: (context, index) {
                    final email = inbox.emails[index];
                    return Container(
                      height: 85,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(email.profileIcon),
                        ),
                        title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: EmailText(
                                markedRead: email.markedRead,
                                text: email.emailSubject,
                                maxLines: 1)),
                        subtitle: EmailText(
                            text: email.body,
                            markedRead: email.markedRead,
                            maxLines: 2),
                        trailing: Stack(
                          children: [
                            CustomText(text: email.date, size: 16),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      email.markedFav = !email.markedFav;
                                    });
                                  },
                                  icon: Icon(
                                    email.markedFav
                                        ? Icons.star
                                        : Icons.star_border_rounded,
                                    color: Colors.deepOrange,
                                  )),
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No Emails'),
          );
        }
      },
    );
  }
}
