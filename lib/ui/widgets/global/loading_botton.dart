import 'package:flutter/material.dart';


class LoadingButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool loading;
  final String buttonName;
  const LoadingButton({
    super.key,
    required this.onClick,
    this.loading = false,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onClick,
      child: loading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(buttonName),
    );
  }
}
