import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:flutter_interview_test/services/menu_service.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<MenuModel> _menus = [];
  List<CartModel> _carts = [];

  List<CartModel> get carts {
    return _carts;
  }

  List<MenuModel> get menus => _menus;

  set menus(List<MenuModel> menu) {
    _menus = menu;
    notifyListeners();
  }

  Future<void> getMenus() async {
    try {
      List<MenuModel> menus = await MenuService().getMenu();
      _menus = menus;
      addCart();
    } catch (e) {
      print(e);
    }
  }

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  Future<void> addCart() async {
    try {
      List<MenuModel> menus = await MenuService().getMenu();
      List<MenuModel> menu = [];
      _menus = menus;

      menus.map((e) => null).toList();
      _carts.add(
        CartModel(
          id: _carts.length,
          // menu: MenuModel(
          //   gambar: 'https://tes-mobile.landa.id/img/chicken-katsu.png',
          //   nama: 'tak tau',
          //   harga: 3000,
          //   id: 3,
          //   tipe: 'lala',
          // ),
          // menu: menu.,
          quantity: 1,
        ),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
