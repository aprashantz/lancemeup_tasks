import 'package:flutter/material.dart';

// as we need different font size of text,
//making a custom text widget to accept
//required properties from arguments
class CustomText extends StatelessWidget {
  String text;
  double size;
  bool isBold;

  CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
