import 'package:flutter/material.dart';
import 'package:flutter_interview_test/services/menu_service.dart';

import '../models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _menus = [];

  List<MenuModel> get menus => _menus;

  set menus(List<MenuModel> menu) {
    _menus = menu;
    notifyListeners();
  }

  Future<void> getMenus() async {
    try {
      List<MenuModel> menus = await MenuService().getMenu();
    _menus = menus;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
