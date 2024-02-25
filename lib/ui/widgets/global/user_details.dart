import 'package:flutter/material.dart';

class UserDetailsFields extends StatelessWidget {
  final String title;
  final dynamic value;

  const UserDetailsFields({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
