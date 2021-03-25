import 'package:alarm/constants_pkg/constants.dart';
import 'package:alarm/model/alarm_item.dart';
import 'package:alarm/resources/db/alarm_db_helper.dart';
import 'package:alarm/views/alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmListItem extends StatefulWidget {
  final AlarmItem alarmItem;

  const AlarmListItem({Key key, this.alarmItem}) : super(key: key);
  @override
  _AlarmListItemState createState() => _AlarmListItemState(alarmItem);
}

class _AlarmListItemState extends State<AlarmListItem> {
  final AlarmItem alarmitem;

  _AlarmListItemState(this.alarmitem);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: GradientColors.colorsList[alarmitem.gradientColorIndex],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: GradientColors.colorsList[alarmitem.gradientColorIndex].last
                .withOpacity(0.4),
            offset: Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(8, 0, 16, 16),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.label,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      alarmitem.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'avenir',
                      ),
                    )
                  ],
                ),
                Switch(
                  value: true,
                  activeColor: Colors.white,
                  onChanged: (bool value) {},
                )
              ],
            ),
            Text(
              'Mon-Fri',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'avenir',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.jm().format(DateTime.parse(alarmitem.dateTime)),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'avenir',
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 24,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    AlarmHelper.instance.delete(alarmitem);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
