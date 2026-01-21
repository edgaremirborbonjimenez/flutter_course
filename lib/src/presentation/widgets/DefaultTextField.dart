import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final IconData icon;
  final Function(String text) onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const DefaultTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: (text) {
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
