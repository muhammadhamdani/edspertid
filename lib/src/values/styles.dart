import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle sectionTitle =
  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle label =
  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle appTitle =
  const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);
  static TextStyle noImage =
  const TextStyle(fontSize: 10);
}

class CustomBoxDecoration {
  static BoxDecoration card = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade700,
        blurRadius: 2,
      )
    ],
  );
}