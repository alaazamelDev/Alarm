import 'package:flutter/foundation.dart';

class AlarmItem extends ChangeNotifier{
  int id;
  String title;
  String dateTime;
  int isActive;
  int gradientColorIndex;

  AlarmItem({
    this.id,
    this.title,
    this.dateTime,
    this.isActive,
    this.gradientColorIndex,
  });

  factory AlarmItem.fromMap(Map<String, dynamic> json) => AlarmItem(
        id: json["id"],
        title: json["title"],
        dateTime: json["datetime"],
        isActive: json["isactive"],
        gradientColorIndex: json["colorindex"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "datetime": dateTime,
        "isactive": isActive,
        "colorindex": gradientColorIndex,
      };
}
