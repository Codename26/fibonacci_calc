import 'package:flutter/material.dart';

const snackBarThreeSecondsDuration = 3;

void showMessage(
  BuildContext context,
  String message, {
  bool isError = false,
  int duration = snackBarThreeSecondsDuration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.black87,
      duration: Duration(seconds: duration),
    ),
  );
}
