import 'package:flutter/material.dart';

class CustomDialog {
  static void show(
      BuildContext context, String title, String content, String buttonText, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: onConfirm,
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
