class Project {
  int id;
  String name;
  String template;
  String status;
  String lastUpdated;
  int completedPercent;
  List<Member> members;

  Project({
    required this.id,
    required this.name,
    required this.template,
    required this.status,
    required this.lastUpdated,
    required this.completedPercent,
    required this.members,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    List<Member> members = [];
    for (var memberJson in json['members']) {
      members.add(Member.fromJson(memberJson));
    }
    return Project(
      id: json['id'],
      name: json['name'],
      template: json['template'],
      status: json['status'],
      lastUpdated: json['last_updated'],
      completedPercent: json['completed_percent'],
      members: members,
    );
  }
}

class Member {
  int id;
  String profileIcon;

  Member({
    required this.id,
    required this.profileIcon,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      profileIcon: json['profile_icon'],
    );
  }
}

class ProjectsResponse {
  String msg;
  bool success;
  List<Project> projects;

  ProjectsResponse({
    required this.msg,
    required this.success,
    required this.projects,
  });

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) {
    List<Project> projects = [];
    for (var projectJson in json['projects']) {
      projects.add(Project.fromJson(projectJson));
    }
    return ProjectsResponse(
      msg: json['msg'],
      success: json['success'],
      projects: projects,
    );
  }
}
