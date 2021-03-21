import 'package:alarm/enums.dart';
import 'package:alarm/menu_item.dart';

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
