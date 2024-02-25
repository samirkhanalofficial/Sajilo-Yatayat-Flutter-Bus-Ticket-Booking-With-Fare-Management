import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderChip extends StatelessWidget {
  const GenderChip({
    super.key,
    required this.selectedGender,
    required this.context,
    required this.gender,
    required this.onTap,
  });

  final String selectedGender;
  final BuildContext context;
  final String gender;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: selectedGender == gender
              ? Theme.of(context).primaryColor
              : const Color(0xFFf4f4f4),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          children: [
            CircleAvatar(
              foregroundImage: AssetImage('asset/images/$gender.png'),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              gender.capitalize!,
              style: TextStyle(
                  color:
                      selectedGender == gender ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
