import 'package:flutter/material.dart';
import 'package:maxopen_test/utils/extentions.dart';

class CommonButton extends StatefulWidget {
  final String title;
  final bool loadingState;
  final VoidCallback? onTap;

  const CommonButton({
    super.key,
    required this.title,
    this.loadingState = false,
    this.onTap,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 47,
      child: ElevatedButton(
        onPressed: widget.onTap,
        child: widget.loadingState == false
            ? Text(
                widget.title,
                style: context.textTheme.bodyMedium,
              )
            : SizedBox(
                width: 23,
                height: 23,
                child: CircularProgressIndicator(
                  color: context.colors.textPrimary,
                  strokeWidth: 2,
                ),
              ),
      ),
    );
  }
}
