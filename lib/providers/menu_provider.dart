import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _menus = [];

  List<MenuModel> get menus => _menus;

  set menus(List<MenuModel> menu) {
    _menus = menu;
    notifyListeners();
  }
}
