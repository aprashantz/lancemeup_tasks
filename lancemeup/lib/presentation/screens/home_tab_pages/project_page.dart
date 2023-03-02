import 'package:flutter/material.dart';
import 'package:lancemeup/data/data_repository/get_data.dart';
import 'package:lancemeup/data/models/project.dart';
import 'package:lancemeup/presentation/screens/home_tab_pages/project_card.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Future<ProjectsResponse> _ongoingProjectsOfUser;
  @override
  void initState() {
    super.initState();
    _ongoingProjectsOfUser = fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProjectsResponse>(
        future: _ongoingProjectsOfUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data!.projects.isNotEmpty) {
            final projectData = snapshot.data!;
            return ListView.builder(
              itemCount: projectData.projects.length,
              itemBuilder: (context, index) {
                final project = projectData.projects[index];
                return ProjectCard(project: project);
              },
            );
          } else {
            return const Center(
              child: Text('You are not assigned in any ongoing projects'),
            );
          }
        });
  }
}
