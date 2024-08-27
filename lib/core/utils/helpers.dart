import 'package:flutter/material.dart';

class Helpers {
  // Function to show a snack bar
  static void showSnackBar(BuildContext context, String message,
      {Color backgroundColor = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Function to navigate to a new screen
  static Future<void> navigateTo(BuildContext context, Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Function to format date
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Function to capitalize the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  // Function to parse a string to double with fallback
  static double parseDouble(String value, [double fallback = 0.0]) {
    try {
      return double.parse(value);
    } catch (e) {
      return fallback;
    }
  }
}
