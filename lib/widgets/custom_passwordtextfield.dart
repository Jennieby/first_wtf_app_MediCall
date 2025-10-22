import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({super.key, required this.label, this.textEditingController});
  final String label;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelText: label,
      ),
      obscureText: true,
    );
  }
}
