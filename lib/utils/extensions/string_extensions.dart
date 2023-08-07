import 'package:flutter/material.dart';

extension StringExtensions on String {
  String firstChars() {
    return split(' ').map((e) => e.characters.first).join();
  }
}
