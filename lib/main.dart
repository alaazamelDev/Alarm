import 'package:alarm/constants_pkg/enums.dart';
import 'package:alarm/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'model/menu_item.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
 FlutterLocalNotificationsPlugin();

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  //settings initialization for android
   var initializationSettingsAndroid = AndroidInitializationSettings('alarm');

  //settings initialization for ios
  var initializationSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );

  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
    },
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuItem>(
        create: (context) => MenuItem(ItemType.clock), 
        child: HomePage(),
      ),
    );
  }
}
