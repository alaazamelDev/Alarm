import 'package:flutter/foundation.dart';

import '../constants_pkg/enums.dart';

class MenuItem extends ChangeNotifier {
  ItemType itemType;
  String title;
  String imageSource;

  MenuItem(this.itemType, {this.title, this.imageSource});

  void updateMenu(MenuItem menuInfo) {
    this.itemType = menuInfo.itemType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
