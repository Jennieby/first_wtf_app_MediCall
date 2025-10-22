import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.label,
    this.textEditingController,
  });
  final String label;
  final TextEditingController? textEditingController;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Icon(isVisible ? Icons.visibility : Icons.visibility_off, size: 16 ),
        ),
        prefixIcon: Icon(Icons.lock_outline, size: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelText: widget.label,
      ),

      obscureText: !isVisible,
    );
  }
}
