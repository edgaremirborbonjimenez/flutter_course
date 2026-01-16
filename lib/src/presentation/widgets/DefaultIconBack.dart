import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  
  final double left;
  final double top;
  const DefaultIconBack({
    required this.left,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: left, top: top),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, size: 35, color: Colors.white),
      ),
    );
  }
}
