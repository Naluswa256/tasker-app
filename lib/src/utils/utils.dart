import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar
    ..showSnackBar(snackBar);
}