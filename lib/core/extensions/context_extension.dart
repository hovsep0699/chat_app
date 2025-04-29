import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
