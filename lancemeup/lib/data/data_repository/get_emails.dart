import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lancemeup/data/models/inbox.dart';

Future<Inbox> fetchInbox() async {
  // I am delaying to make it look like data is coming from an API
  await Future.delayed(const Duration(seconds: 1));
  String jsonData =
      await rootBundle.loadString('lib/data/data_provider/emails.json');
  Inbox inbox = Inbox.fromJson(json.decode(jsonData));
  return inbox;
}
