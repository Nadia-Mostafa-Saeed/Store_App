import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.inputType,
  });
  final String hintText;
  bool obscureText;
  Function(String)? onChanged;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
      ),
    );
  }
}
