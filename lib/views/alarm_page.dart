import 'package:alarm/constants_pkg/constants.dart';
import 'package:alarm/data/data.dart';
import 'package:alarm/model/alarm_list_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Alarm',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Colors.white,
                  fontFamily: 'avenir',
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((alarm) {
                  return AlarmListItem(
                    alarmItem: alarm,
                  );
                }).followedBy([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 16, 16),
                    child: DottedBorder(
                      radius: Radius.circular(24),
                      strokeWidth: 2,
                      borderType: BorderType.RRect,
                      dashPattern: [5, 4],
                      color: CustomColors.dottedBorderColor,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: CustomColors.clockBG,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/add_alarm.png',
                                scale: 1.5,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Add Alarm',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'avenir',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
