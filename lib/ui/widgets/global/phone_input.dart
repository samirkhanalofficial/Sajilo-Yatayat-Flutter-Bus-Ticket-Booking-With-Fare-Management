import 'package:flutter/material.dart';

class NepalFlagInputField extends StatelessWidget {
  const NepalFlagInputField({super.key, required this.phoneNumberData});
  final TextEditingController phoneNumberData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 56,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 240, 238, 1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "asset/images/flag.png",
          ),
          const SizedBox(
            width: 6,
          ),
          const Text(
            "+977 |",
          ),
          Expanded(
            child: TextField(
              controller: phoneNumberData,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
