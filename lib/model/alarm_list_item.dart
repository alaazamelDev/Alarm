
import 'package:alarm/model/alarm_item.dart';
import 'package:flutter/material.dart';

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
          colors: alarmitem.gradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: alarmitem.gradientColor.last.withOpacity(0.4),
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
                      'Office',
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
                  '07:00 AM',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: 'avenir',
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 24,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
