import 'package:flutter/material.dart';

SelectOptionImageDialog(
  BuildContext context,
  Function() pickImage,
  Function() takePhoto,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Select an option"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            pickImage();
          },
          child: Text('Gallery', style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            takePhoto();
          },
          child: Text('Camera', style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
