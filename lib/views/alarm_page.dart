import 'package:alarm/constants_pkg/constants.dart';
import 'package:alarm/constants_pkg/notifications_consts.dart';
import 'package:alarm/data/data.dart';
import 'package:alarm/model/alarm_list_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  //decalare local notification object
  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var androidInitialize = AndroidInitializationSettings('alarm');

    var iosInitialization = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        //TODO: SET THE SETTINGS FOR IOS
      },
    );

    var initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iosInitialization,
    );

    //initialize localNotification Object
    localNotification = FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

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
                          onPressed: () {
                            sendNotification();
                          },
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

  Future sendNotification() async {
    //set the time of the alarm
    /*
    var schedualNotificationDateTime =
        DateTime.now().add(Duration(seconds: 70));

    //prepare the required notifications for android platform
    var androidPlatformChannelsDetails = AndroidNotificationDetails(
      NotificationsConstants.CHANNEL_ID,
      NotificationsConstants.CHANNEL_NAME,
      NotificationsConstants.CHANNEL_DESCRIPTION,
      sound: RawResourceAndroidNotificationSound('alarm_ringtone.wav'),
      icon: 'alarm',
      largeIcon: DrawableResourceAndroidBitmap('alarm'),
    );

    //prepare the required notifications for ios platform
    var iosPlatformChannelDetails = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'alarm_ringtone.wav',
    );

    //prepare the required notifications for all platforms
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelsDetails,
      iOS: iosPlatformChannelDetails,
    );

    await flutterLocalNotificationsPlugin.initialize();*/

    //android settings initialization

    //set Notification details for android platform
    var androidNotificationDetail = AndroidNotificationDetails(
      NotificationsConstants.CHANNEL_ID,
      NotificationsConstants.CHANNEL_NAME,
      NotificationsConstants.CHANNEL_DESCRIPTION,
      icon: 'alarm',
      importance: Importance.high,
      priority: Priority.high,
    );

    var iosNotificationDetails = IOSNotificationDetails();

    var notificationDetails = NotificationDetails(
      android: androidNotificationDetail,
      iOS: iosNotificationDetails,
    );

    //send the notification
    await localNotification.show(
      0,
      'Notification Title',
      'Messi is the King',
      notificationDetails,
    );

    await localNotification.schedule(
      1,
      'Schedualed Notification',
      'Notification bbody of schedualed notification',
      DateTime.now().add(Duration(seconds: 10)),
      notificationDetails,
    );
  }
}
