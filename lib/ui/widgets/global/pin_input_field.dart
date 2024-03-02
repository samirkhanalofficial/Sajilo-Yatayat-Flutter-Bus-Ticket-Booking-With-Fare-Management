import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInputFiled extends StatelessWidget {
  final int length;
  final TextEditingController controller;

  const PinInputFiled(
      {super.key, required this.length, required this.controller});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      textStyle: const TextStyle(
          fontSize: 20, color: Color(0xFF0ACF83), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F0EE),
        border: Border.all(
          color: const Color(0xFFF1F0EE),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(16),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFFF1F0EE),
      ),
    );
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      length: length,
      controller: controller,
    );
  }
}
