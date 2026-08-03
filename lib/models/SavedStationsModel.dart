import 'package:flutter/material.dart';

class SavedStation {
  final String name;
  final String line;
  final Color lineColor;
  final String nextTrain;

  SavedStation({
    required this.name,
    required this.line,
    required this.lineColor,
    required this.nextTrain,
  });
}