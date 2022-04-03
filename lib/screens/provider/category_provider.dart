import 'package:flutter/material.dart';
import 'package:todo_app/core/hive/hive_boxes.dart';
import 'package:todo_app/core/models/notification_model.dart';

class PageProvider extends ChangeNotifier {
  int pageIndex = 0;

 
  changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
