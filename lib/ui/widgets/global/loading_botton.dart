import 'package:flutter/material.dart';
import 'package:tryapp/config/colors/app_color.dart';

class LoadingButton extends StatelessWidget {
  final VoidCallback? onClick;
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
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColor().primary,
              ),
            )
          : Text(buttonName),
    );
  }
}
