import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lancemeup/data/models/inbox.dart';
import 'package:lancemeup/data/models/project.dart';

// emails fetcher method
Future<Inbox> fetchInbox() async {
  Inbox inbox =
      Inbox.fromJson(await fetchData('lib/data/data_provider/emails.json'));
  return inbox;
}

// ongoing projects fetcher method
Future<ProjectsResponse> fetchProjects() async {
  ProjectsResponse projects = ProjectsResponse.fromJson(
      await fetchData('lib/data/data_provider/ongoing_projects.json'));
  return projects;
}

// acting like: it fetch data from network and returns to specific data repo collector
Future fetchData(String endPoint) async {
  // delaying to make it look like data is coming from an API
  await Future.delayed(const Duration(seconds: 1));
  String jsonData = await rootBundle.loadString(endPoint);
  return json.decode(jsonData);
}
