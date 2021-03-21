import 'package:alarm/views/homepage.dart';
import 'package:alarm/constants_pkg/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/menu_item.dart';

void main() {
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
