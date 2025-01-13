import 'package:flutter/material.dart';

// Text Styles
// static const Color IconColor = Colors.white ;

const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const TextStyle subTitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);


// Button Style
final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  textStyle: TextStyle(fontSize: 16),
);

// Padding
const EdgeInsets formPadding = EdgeInsets.all(16.0);
