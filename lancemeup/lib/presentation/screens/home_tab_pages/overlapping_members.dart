import 'package:flutter/material.dart';
import 'package:lancemeup/constants/value_constants.dart';
import 'package:lancemeup/data/models/project.dart';

// widget to show members assigned to specific project in a row
class OverlappingMembers extends StatelessWidget {
  final List<Member> members;
  const OverlappingMembers({Key? key, required this.members}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(members.length, (index) {
      return Transform.translate(
          offset: Offset(index * 25, 0),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: lancemeupColor, width: 3),
              ),
              child: CircleAvatar(
                  backgroundImage: AssetImage(members[index].profileIcon),
                  radius: 14)));
    }));
  }
}
