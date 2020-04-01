import 'package:flutter/material.dart';

/*
 * 全局状态管理类  ChangeNotifier
 */
class NoticeManagerTest extends ChangeNotifier {
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
