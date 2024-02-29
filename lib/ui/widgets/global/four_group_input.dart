import 'package:flutter/material.dart';

class FourGroupInput extends StatelessWidget {
  const FourGroupInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 72,
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
        SizedBox(
          width: 72,
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
        SizedBox(
          width: 72,
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
        SizedBox(
          width: 72,
          child: TextField(
            decoration: InputDecoration(),
          ),
        ),
      ],
    );
  }
}
