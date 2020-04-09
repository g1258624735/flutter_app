import 'package:flutter/material.dart';

/*
 * 数据持久化保存管理类  ChangeNotifier
 */
class NoticeManagerTest2 extends ChangeNotifier {
  int _count = 0;

  get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  minus() {
    _count--;
    notifyListeners();
  }
}
