import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import '../models/cart_model.dart';
import '../models/voucher_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts {
    return _carts;
  }

  menuExist(MenuModel menu) {
    if (_carts.indexWhere((element) => element.menu!.id == menu.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  addCart(MenuModel menu) {
    if (menuExist(menu)) {
      int index = _carts.indexWhere((element) => element.menu!.id == menu.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(CartModel(
        id: carts.length,
        menu: menu,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! + 1;
    notifyListeners();
  }

  minQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! - 1;
    if (_carts[id].quantity! < 0) {
      return _carts[id].quantity = 0;
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity!;
    }
    return total;
  }

  subTotalPrice() {
    int total = 0;
    for (var item in _carts) {
      total += (item.quantity! * item.menu!.harga!);
    }
    return total;
  }

  totalPrice(VoucherModel voucher) {
    int total = 0;
    for (var item in _carts) {
      total += (item.quantity! * item.menu!.harga!);
    }
    if (voucher.id == 2) {
      if (total > voucher.nominal!.toInt()) {
        total = total - voucher.nominal!.toInt();
      }
    } else {
      if (total > voucher.nominal!.toInt()) {
        total = total - voucher.nominal!.toInt();
      }
    }

    return total;
  }

}
