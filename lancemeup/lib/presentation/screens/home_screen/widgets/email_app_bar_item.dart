import 'package:flutter/material.dart';

class EmailAppBarItem extends StatelessWidget {
  const EmailAppBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        const Expanded(
          child: SizedBox(
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search emails',
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
