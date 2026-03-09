import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final String? errorText;
  final IconData icon;
  final Color? color;
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
    this.initialValue,
    this.color = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: (text) {
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: color)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: color),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
      ),
      style: TextStyle(color: color!),
    );
  }
}
