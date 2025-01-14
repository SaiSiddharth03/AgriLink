import 'package:flutter/material.dart';

var raisedDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: Colors.grey.shade50, // Use non-null version
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black26, // Assuming it's always available
      offset: Offset(5, 2),
      blurRadius: 3.0,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Colors.white, // Assuming it's always available
      offset: Offset(-5, -2),
      blurRadius: 3.0,
      spreadRadius: 0.0,
    ),
  ],
);
Color facebookColor = Color(0xFF416BC1);
Color googleColor = Color(0xFFCF4333);