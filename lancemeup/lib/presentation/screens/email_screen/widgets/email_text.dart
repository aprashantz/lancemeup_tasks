import 'package:flutter/material.dart';

class EmailText extends StatelessWidget {
  const EmailText({
    super.key,
    required this.text,
    required this.markedRead,
    required this.maxLines,
  });

  final String text;
  final double maxLines;
  final bool markedRead;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 16,
          fontWeight: markedRead ? FontWeight.normal : FontWeight.bold),
    );
  }
}
