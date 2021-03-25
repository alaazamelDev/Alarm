import 'package:alarm/data/data.dart';
import 'package:alarm/constants_pkg/enums.dart';
import 'package:alarm/views/alarm_page.dart';
import 'package:alarm/views/clock_page.dart';
import 'package:alarm/model/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(DateTime.now());
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                items.map((menuItem) => BuildMenuButton(menuItem)).toList(),
          ),
          VerticalDivider(
            width: 1,
            color: Colors.white54,
          ),
          Expanded(
            child: Consumer<MenuItem>(
              builder: (BuildContext context, MenuItem value, Widget child) {
                switch (value.itemType) {
                  case ItemType.clock:
                    // return the clock fragment
                    return ClockFragment(
                      formattedTime: formattedTime,
                      formattedDate: formattedDate,
                      offsetSign: offsetSign,
                      timezoneString: timezoneString,
                    );
                  case ItemType.alarm:
                    return AlarmPage();
                  case ItemType.timer:
                    return Container();
                  case ItemType.stopwatch:
                    return Container();
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BuildMenuButton extends StatelessWidget {
  final MenuItem menuItem;

  BuildMenuButton(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, MenuItem value, Widget child) {
        return FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32)),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            onPressed: () {
              var menuInfo = Provider.of<MenuItem>(context, listen: false);
              menuInfo.updateMenu(menuItem);
              print(menuInfo.title);
            },
            color: menuItem.itemType == value.itemType
                ? Color(0xFF242634)
                : Colors.transparent,
            child: Column(
              children: [
                Image.asset(
                  menuItem.imageSource,
                  scale: 1.5,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  menuItem.title ?? '',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ));
      },
    );
  }
}
