import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const DefaultButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
