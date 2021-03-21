import 'package:alarm/constants_pkg/constants.dart';
import 'package:alarm/constants_pkg/enums.dart';
import 'package:alarm/model/alarm_item.dart';
import 'package:alarm/model/menu_item.dart';

//list of items menu
List<MenuItem> items = [
  MenuItem(ItemType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuItem(ItemType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuItem(ItemType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuItem(ItemType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

//list of the alarms
List<AlarmItem> alarms = [
  AlarmItem(DateTime.now().add(Duration(hours: 1)), description: 'Job',gradientColor: GradientColors.sky),
  AlarmItem(DateTime.now().add(Duration(hours: 2)), description: 'Sport',gradientColor: GradientColors.fire),
  AlarmItem(DateTime.now().add(Duration(minutes: 23)), description: 'Study',gradientColor: GradientColors.mango),
];
