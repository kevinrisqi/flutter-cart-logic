import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts {
    return _carts;
  }

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(MenuModel menu) {
    
  }
}
