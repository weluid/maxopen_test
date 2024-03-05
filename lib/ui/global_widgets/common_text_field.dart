import 'package:flutter/material.dart';
import 'package:maxopen_test/utils/extentions.dart';

class CommonTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CommonTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: context.colors.backgroundPrimary,
        decoration: InputDecoration(
          hintText: widget.hint,
        ),
        onChanged: widget.onChanged,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
