import 'package:flutter/material.dart';

class AlarmItem {
  DateTime dateTime;
  String description;
  bool isActive;
  List<Color> gradientColor;

  AlarmItem(this.dateTime, {this.description, this.isActive, this.gradientColor});
}
