import 'package:flutter/material.dart';
import 'package:lancemeup/data/models/project.dart';
import 'package:lancemeup/presentation/screens/home_tab_pages/overlapping_members.dart';
import 'package:lancemeup/presentation/screens/login_screen/widgets/custom_text.dart';

// widget to show project card that contains project name,
// template, status, project completeness status, members assigned to this project
class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
            onTap: () {},
            child: Card(
                elevation: 3,
                child: Stack(children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon((Icons.more_vert)))),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              SizedBox(
                                width: 150,
                                child: Text(project.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              const SizedBox(width: 11),
                              // To show icon of leader of this project
                              CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage(
                                      project.members[0].profileIcon)),
                            ]),
                            const SizedBox(height: 12),
                            Row(children: [
                              const CustomText(text: "Template:", size: 14),
                              const SizedBox(width: 32),
                              CustomText(text: project.template, size: 14)
                            ]),
                            const SizedBox(height: 6),
                            Row(children: [
                              const CustomText(text: "Status:", size: 14),
                              const SizedBox(width: 52),
                              CustomText(text: project.status, size: 14)
                            ]),
                            const SizedBox(height: 6),
                            Row(children: [
                              const CustomText(text: "Last Updated:", size: 14),
                              const SizedBox(width: 8),
                              CustomText(text: project.lastUpdated, size: 14)
                            ]),
                            const SizedBox(height: 20),
                            Row(children: [
                              Expanded(
                                  child: LinearProgressIndicator(
                                      minHeight: 7,
                                      value: project.completedPercent / 100,
                                      backgroundColor: Colors.grey[300])),
                              const SizedBox(width: 8),
                              Text("${project.completedPercent}%")
                            ]),
                            const SizedBox(height: 20),
                            OverlappingMembers(members: project.members)
                          ]))
                ]))));
  }
}
